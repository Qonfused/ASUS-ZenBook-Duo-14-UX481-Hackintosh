/*
 * Enables GPIO device and pinning for Trackpad and Primary/Secondary displays.
 * @see https://github.com/VoodooI2C/VoodooI2C/blob/master/Documentation/GPIO%20Pinning.md
 *
 * Refer to the below issue comment for GPIO pin calculations:
 * https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/issues/24#issuecomment-1399232818
 */
DefinitionBlock ("", "SSDT", 2, "UX481", "GPI0", 0x00000000)
{
    External (_SB_.PCI0.I2C0.TPL1, DeviceObj)
    External (_SB_.PCI0.I2C1.ETPD, DeviceObj)
    External (_SB_.PCI0.I2C3.TPL0, DeviceObj)
    External (GPHD, IntObj)
    External (USTP, IntObj)
    // config.plist ACPI > Patch renames
    External (_SB_.PCI0.I2C1.ETPD.XCRS, MethodObj)
    External (_SB_.PCI0.I2C0.TPL1.XCRS, MethodObj)
    External (_SB_.PCI0.I2C3.TPL0.XCRS, MethodObj)

    If (_OSI ("Darwin"))
    {
        // Enables _STA method in GPIO device
        GPHD = Zero
        // Enables correct SSCN and FMCN bus timings for each I2C controller.
        USTP = One
    }

    // Trackpad
    Scope (_SB.PCI0.I2C1.ETPD)
    {
        Name (SBFG, ResourceTemplate ()
        {
            GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
                "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0055
                }
        })
        Method (_CRS, 0, Serialized)
        {
            Name (SBFB, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x0015, ControllerInitiated, 0x00061A80,
                    AddressingMode7Bit, "\\_SB.PCI0.I2C1",
                    0x00, ResourceConsumer, , Exclusive,
                    )
            })
            If (_OSI ("Darwin"))
            {
                Return (ConcatenateResTemplate (SBFB, SBFG))
            }
            Else { Return (XCRS ()) }
        }
    }

    // Touchscreen - Primary Display
    Scope (_SB.PCI0.I2C0.TPL1)
    {
        Method (_CRS, 0, NotSerialized) { Return (XCRS ()) }

        // Name (SBFG, ResourceTemplate ()
        // {
        //     GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
        //         "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
        //         )
        //         {   // Pin list
        //             0x0072
        //         }
        // })
        // Method (_CRS, 0, Serialized)
        // {
        //     Name (SBFB, ResourceTemplate ()
        //     {
        //         I2cSerialBusV2 (0x0010, ControllerInitiated, 0x00061A80,
        //             AddressingMode7Bit, "\\_SB.PCI0.I2C0",
        //             0x00, ResourceConsumer, , Exclusive,
        //             )
        //     })
        //     If (_OSI ("Darwin"))
        //     {
        //         Return (ConcatenateResTemplate (SBFB, SBFG))
        //     }
        //     Else { Return (XCRS ()) }
        // }
    }

    // Touchscreen - Secondary Display
    Scope (_SB.PCI0.I2C3.TPL0)
    {
        Method (_CRS, 0, NotSerialized) { Return (XCRS ()) }

        // Name (SBFG, ResourceTemplate ()
        // {
        //     GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
        //         "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
        //         )
        //         {   // Pin list
        //             0x0032
        //         }
        // })
        // Method (_CRS, 0, Serialized)
        // {
        //     Name (SBFB, ResourceTemplate ()
        //     {
        //         I2cSerialBusV2 (0x0010, ControllerInitiated, 0x00061A80,
        //             AddressingMode7Bit, "\\_SB.PCI0.I2C3",
        //             0x00, ResourceConsumer, , Exclusive,
        //             )
        //     })
        //     If (_OSI ("Darwin"))
        //     {
        //         Return (ConcatenateResTemplate (SBFB, SBFG))
        //     }
        //     Else { Return (XCRS ()) }
        // }
    }
}