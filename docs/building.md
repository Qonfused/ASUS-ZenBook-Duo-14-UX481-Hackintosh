# Building the EFI

OCE-Build downloads the AsusSMC package matching your EFI build. Install AsusSMCDaemon from the same package so F4/F5 adjust brightness on the display under the pointer. Fn Lock starts off on the UX481, so you can use F4/F5 without holding Fn after boot. AsusSMC remembers your ScreenPad brightness across restarts.

Press Switch Windows to toggle between Automatic and Full Speed. AsusSMCDaemon shows the selected fan mode on the primary display. The package also includes `fanctl` for reading fan speeds and changing the mode from Terminal. [AsusSMC releases](https://github.com/Qonfused/AsusSMC/releases)

When upgrading an existing build, pass `--clean` to remove the obsolete `SSDT-SPLC.aml` and `SSDT-XWAK.aml` before OpenCore’s ACPI entries are generated.

Run either build script from the repository's root directory. In Bash or WSL:

```sh
bash scripts/build.sh --clean
```

In PowerShell:

```powershell
.\scripts\build.ps1 --clean
```

Both scripts download [OCE-Build v0.2.0](https://github.com/Qonfused/OCE-Build/releases/tag/v0.2.0), fetch the dependencies declared in [`src/build.yml`](../src/build.yml), and write the generated EFI to `dist/EFI`.

VoodooI2C and VoodooI2CHID use the unmodified binaries from the official 2.9.1 RELEASE archive, hosted on our [VoodooI2C](https://github.com/Qonfused/VoodooI2C/releases/tag/v2.9.1) and [VoodooI2CHID](https://github.com/Qonfused/VoodooI2CHID/releases/tag/v2.9.1) forks. DuoLink checks these binaries before installing its hooks, so both drivers use RELEASE binaries even when OpenCore is built with DEBUG enabled.

DuoLink's [1.0.0 archives](https://github.com/Qonfused/DuoLink/releases/tag/v1.0.0) include DuoLinkTouch. The VoodooI2C fork also hosts the standalone VoodooGPIO archive built from upstream [`44fc744`](https://github.com/VoodooI2C/VoodooGPIO/commit/44fc744d26b3e4971d6d8f0027d75c25e1388637), including GPIO configuration and wake corrections missing from the original 2.9.1 archive.

OCE-Build includes the separate VoodooGPIO bundle and excludes the older GPIO plugin from VoodooI2C's bundled dependencies. DuoLinkTouch remains inside DuoLink, with its own OpenCore entry. OCE-Build orders those entries by their declared dependencies, placing Lilu before DuoLink and DuoLink before its companion.

The USB port map in `src/Kexts/UTBMap.kext` is specific to this laptop and stays in source control alongside the ACPI tables.
