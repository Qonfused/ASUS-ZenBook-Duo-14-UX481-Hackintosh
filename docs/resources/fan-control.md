# UX481FL fan firmware and validation

On the ASUS UX481FL, the embedded controller (EC) converts tachometer periods to RPM before the ACPI `RTAH` method reads them. Because `TACH` applies a period-to-RPM conversion to those readings a second time, AsusSMC needs to read `RTAH` directly to report fan speeds correctly.

Firmware also exposes Automatic and Full Speed through its ASUS WMI CPU fan-control interface. The boot arguments and `fanctl` commands used to read speeds and select these modes are documented in AsusSMC's [Fan monitoring and control](https://github.com/Qonfused/AsusSMC/blob/master/docs/fan-control.md) guide.

## Fan wiring

[Sheet 50 of the UX481FL schematic](schematics/Asus%20ZenBook%20Duo%20UX481FL%20Rev%202.0.pdf), PDF page 34, shows two four-pin fan connectors supplied by `+5VS`, with separate signals for pulse-width modulation (PWM) and tachometer feedback. On each connector, pin 1 carries tachometer feedback, pin 2 is ground, pin 3 carries PWM, and pin 4 supplies power. Each tachometer signal has a 10 kΩ pull-up to `+3VS` and reaches the EC without an external frequency divider.

These signals connect to U3001, an ITE IT8225VG-128/CX shown on sheet 30, PDF page 23, with separate control outputs and tachometer inputs for each fan:

| Fan | Connector | EC PWM output | EC tachometer input |
| --- | --- | --- | --- |
| 1 | J5002 | PWM5/GPA5, ball J6 | TACH0A/GPD6, ball M11 |
| 2 | J5003 | PWM3/GPA3, ball N6 | TACH1A/TMA1/GPD7, ball M12 |

Both fan circuits are annotated `0.24A`, and part numbers `12017-00380100` and `12017-00380200` identify connector alternatives. The schematic gives no motor model, maximum speed, or tachometer pulses per revolution, so it cannot establish whether a reported RPM matches a fan's mechanical rating.

## RPM reporting

The EC firmware image `F002140C.UX481FL.30E` begins at file offset `0x700000` in the [BIOS dump](schematics/UX481FL-W25Q128.BIN); routine and table offsets below are relative to that image. At `0xA2C4`, an NDS32 routine reads tachometer counter bytes from `0xF0181E–0xF01821`, combines them into a period count, and calculates RPM. These instructions correspond to:

```c
count = (tach_high << 8) | tach_low;
rpm = count != 0 ? 2156250 / count : 0;
```

`sethi` at `0xA31E` and `addi` at `0xA322` construct the constant `2156250` used by the division instruction at `0xA326`. To make the converted readings available to ACPI, the updater at `0x11058` obtains them through `0x1325A` and calls routines `0xDB8E` and `0xDB98` to store each fan's 16-bit RPM value in EC RAM `0x8099C` and `0x8099E`, respectively.

Those locations correspond to the `THL0/THH0` and `THL1/THH1` byte pairs that `RTAH` reads with bank `0xC9` selected, so the method returns RPM without needing another conversion. The fan indices also agree with the schematic: the lookup table at `0x18E60` starts with `05 03`, selecting PWM5 and PWM3 for the two fans.

The [firmware WMI speed query](firmware/UX481FL/DSDT.dsl#L55188) uses the same interpretation when it returns `RTAH(0) / 100` in units of 100 RPM. However, the ACPI [`TACH` method](firmware/UX481FL/DSDT.dsl#L57331) calculates `0x41CDB4 / (2 * RTAH(index))`, treating the RPM value as though it were still a period count. That second conversion makes reported speeds fall as the fans accelerate: a reading of approximately 8,400 RPM becomes 256 RPM.

On this laptop, `-asussmcrawfan` avoids the second conversion by selecting `RTAH` directly after checking EC availability through `ECAV`. Failed reads and values outside the SMC `fpe2` range are reported as unavailable, while successful zero readings represent stopped fans. This option is selected explicitly because an `RTAH` method on another ASUS model may return different units.

With `asussmcfans=2`, AsusSMC publishes `FNum = 2`, the RPM keys `F0Ac` and `F1Ac`, and the names `F0ID` and `F1ID`. Configuring the count explicitly avoids trying to infer the number of fans from firmware values that can represent either a stopped fan or an unsupported index.

## Fan mode commands

Automatic and Full Speed use WMI device `0x00110013`, with `DEVS` arguments `0` and `1` respectively, following the [ASUS WMI implementation in Linux](https://github.com/torvalds/linux/blob/master/drivers/platform/x86/asus-wmi.c). In the [UX481FL DSDT](firmware/UX481FL/DSDT.dsl#L55455), both commands read EC offset `0x30` through `RRAM(0xCC, 0x30)` and write it through `WRAM(0xCD, 0x30, value)`, clearing bit 6 for Automatic or setting it for Full Speed.

Although the GPU fan-control branch has a separate WMI device ID, `0x00110014`, it writes the same bit. These setters therefore provide neither independent fan targets nor a parameter for an arbitrary RPM target; the effect of the CPU command on each fan is recorded in the test below.

Because firmware can return success after skipping an EC write, AsusSMC checks availability through `ECAV` before issuing a mode request. Changing modes with `fanctl` requires administrator privileges. Pressing Switch Windows calls the same firmware control directly. A successful command updates the cached mode used by `fanctl status`, which consequently reports the last accepted request rather than reading back the hardware override bit.

## Hardware validation

On 22 November 2026, we sampled fan speeds every two seconds on a UX481FL running macOS 13.7.8, starting with both fans reporting zero RPM. The 20-second Full Speed trial was followed by 20 seconds in Automatic, during which Fan 1 gradually slowed. Selected readings are shown below, with approximate times measured from each mode change.

| Mode | Seconds after command | Fan 1 RPM | Fan 2 RPM |
| --- | ---: | ---: | ---: |
| Full Speed | 0 | 0 | 0 |
| Full Speed | 4 | 2,039 | 0 |
| Full Speed | 8 | 8,422 | 0 |
| Full Speed | 18 | 8,489 | 0 |
| Automatic | 0 | 8,489 | 0 |
| Automatic | 18 | 5,543 | 0 |

Reading AppleSMC during Full Speed also returned `FNum = 2`, `F0Ac = 8,489`, and `F1Ac = 0`, with both RPM keys encoded as `fpe2` and both names available through `F0ID` and `F1ID`. These values match `fanctl`, confirming that the RPM readings are also available through the SMC interface.

Across the capture, all 15 distinct nonzero Fan 1 readings match the integer conversion found in the EC firmware. Counter values `254`, `255`, and `256`, for example, produce `8,489`, `8,455`, and `8,422` RPM, tying the observed steps in speed to the conversion traced above.

Fan 2 had reported nonzero speeds during earlier use but remained stopped throughout this trial, so the observed Full Speed response is limited to Fan 1. After the trial, we restored Automatic; its restoration during sleep, wake, and shutdown still needs a hardware test.
