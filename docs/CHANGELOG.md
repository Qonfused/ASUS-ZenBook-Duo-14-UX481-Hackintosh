# Change Log
All notable changes to this project will be documented in this file.
 
The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

The latest progress can be viewed on this repository's [project board](https://github.com/users/Qonfused/projects/2/views/11).

## [0.6.0] - 2023-12-06

This patch version includes major feature and build system fixes, with some tweaks to post-install scripts.

### Changed
- Modularize analyze workflow ([`1948fcb`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/1948fcb835d185caf379e7aac21999ade04c1cf5))
- Upgraded config to new schema ([`f4b563a`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/f4b563a4284ec93a150787d198511f5218955f12))
- Refactor build scripts, CI workflows ([`845da6a`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/845da6a96097fe242684b3d228f6807e36903cc9))
- Vendor base configuration, cleanup build spec ([`fb0f8aa`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/fb0f8aa916dc7fc7e1a53c52e11281a2265ff2a1))

## [0.5.4] - 2023-05-14

This patch version includes small feature and build system fixes, with some tweaks to post-install scripts.

### Changed
- Fixed display overrides script for local builds ([`04e3bc5`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/04e3bc52bd16460ebc2de539aada023d6b543f33))
- Use `latest` oc-version with OCE-Build ([`e721330`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/e721330cd48fe403effd756a8916db5750448d50))
- Renamed **OC-Build** to **OCE-Build** ([`7a6679d`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/7a6679d2d1ed839496ef5e23190bc84db8533835))

### Added
- Added `ControlMsrE2` tool for unlocking CFG-Lock ([`1a1993e`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/1a1993eef9ee3d0ccc7a779108a28a1bbf9df5f5))

### Fixed
- Resolved [**#8**](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/issues/8), fixing trackpad buttons ([`109fcd5`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/109fcd5a28f4617da313dc78d0dfaa19d7095d11)) (Thanks to [**@1Revenger1**](https://github.com/1Revenger1)!)

### Removed
- Removed `DVL0` device from `SSDT-SBUS-MCHC` ([`be4e197`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/be4e19786256c98523238f2c4d4cefd57df6b23b))

## [0.5.3] - 2023-04-17

This patch version includes some small documentation additions and progressional fixes. Notably, this version may result in a decrease in resolution quality for touchscreen gesture inputs, which will be fixed in a later patch version.

### Changed
- Documented source [config.yml](/src/config.yml) file ([`1ed24aa`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/1ed24aaf8cc642f3afd2db892c0e622d8f38b919))
- Bumped OpenCore version to version 0.9.1 ([`6375fa8`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/6375fa8a15867adfeacd74330fa2522fca964abc))

### Added
- Added ScreenPad connector datasheet ([`91757a6`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/91757a62f8014852529ab66c02bd547c565f478c))
- Added template ALSC dummy method ([`01dab52`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/01dab5221c73319813ad1ad3aee63b832bc1bfd6))
- Added SSDT-GPRW to fix RTC/USB wake issue ([`6c3ede2`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/6c3ede2bf55c6dfc43324c454c374f833483517e))

### Fixed
- Fixed GPIO root pinning for touchscreens (superceded by APIC) ([`16569fa`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/16569fa2962329af2e33b3b0cc5bdcba9d207141))
- Fixed I2CHID intermittency issue with APIC interrupts ([`6fb418f`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/6fb418f160ccc1b27533e9fb651305e9cf5464b0))
- Fixed preprocessor macros in `config.yml` file ([`c3699df`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/c3699dfa6e3d36d940e2328faa2eb43b27dfaad0))
- Fixed `SecureBootModel` policy for macOS installer ([`dd22c99`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/dd22c9993e5e42695098227f099125db3c6d4d5a))

## [0.5.2] - 2023-03-20

This patch version includes some small refinements and stability fixes with overall improved code quality.

### Changed
- Bumped OpenCore version to version 0.9.0 release ([`978dc81`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/978dc8100d310e71f32b66e954a15cc159443636))
- Reverted ScreenPad Plus busID to `0x01` ([`f58e77e`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/f58e77e9b44aea6f733a9d723ab4f513a4adeffc))

### Added
- Added XWAK SSDT for fixing some device wake behaviors ([`8dbc419`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/8dbc419aadacd708a0fb785f71bf90b915c15fbb))
- Added [`gen-debug.sh`](/scripts/gen-debug.sh) script for kernel logs + diagnostics. ([`aa70c04`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/aa70c044063f963f1d9b3d1211315b382d494314))

### Removed
- Properly nullified primary + screenpad display GPIO pinning ([`ddbdeee`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/ddbdeee79cccdebb887b0a9fbbb21e4c8912df44))

### Fixed
- Addressed macOS SSDTs being injected into Linux/Windows ([`ddbdeee`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/ddbdeee79cccdebb887b0a9fbbb21e4c8912df44))
- Fixed keyboard backlight edge case on startup ([`ddbdeee`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/ddbdeee79cccdebb887b0a9fbbb21e4c8912df44))

## [0.5.1] - 2023-02-27

This patch version includes small feature improvements and fixes, adding support for SMBIOS data patching and resolving regression issues from the previous release.

### Changed
- Moved DiskArbitrationFixup build to separate repo ([`cd21c5e`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/cd21c5ef04cc1f0516e54930d74fb375c0f44c02))
- Replaced VoodooI2CHID patch with VoodooInjector kext ([`97eb080`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/97eb0805231b6b1b320de10ce15deb0d4997bb66))
- Refactored keyboard backlight to use native EC methods ([#38 PR](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/38))

### Added
- Added **.serialdata** patch script for custom SMBIOS data ([`e4ead15`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/e4ead158ef938c2a7c2cd02c62a28d1a2fc3f3dd))
- Added [devcontainers](https://code.visualstudio.com/docs/devcontainers/containers) for dockerized local and remote development ([`dc36bc4`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/dc36bc424c5013bef97cac4d6dbe602ebe17f279))
- Added RTS5227S driver (for RTS522A microSD reader) ([`22608c6`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/22608c64184a1ff81b15ed614124ca956536b1ce))

### Fixed
- Fixed config.yml parsing for OC GUI theme ([`05c39b2`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/05c39b216ee0588d4143188385cd226d960166c5))
- Fixed VoodooI2CHID patch ([`edc5f86`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/edc5f86889ee5866c18b46aee1ce37d73e1a8a4a))
- ACPI patches correctly parse with OCE-Build fix ([`2ec5c96`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/36/commits/2ec5c96afe8cc64a535dcefa51c297885cd3e026))
- Bumped OC version to pre-release [v0.9.0#457c68d](https://github.com/acidanthera/OpenCorePkg/commit/457c68dcdead63b33c2715e57fbe8a7ad0366db0) to fix OC picker ([`46de66e`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/36/commits/46de66e52ccb87e26e8a8955c2db999e2c636164))

## [0.5.0] - 2023-02-20

This minor version incorporates a project overhaul from the [#36 PR](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/36) for incorporating the [OCE-Build](https://github.com/Qonfused/OCE-Build) manager by [**@Qonfused**](https://github.com/Qonfused) into the project. This includes minor updates for OpenCore version [0.8.9](https://github.com/acidanthera/OpenCorePkg/releases/tag/0.8.9).

Refer to [README.md#Getting-Started](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh#-getting-started) for upgrade and build instructions.

### Changed
- Updated OpenCore to version 0.8.9 ([`#36@0e5793a`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/36/commits/0e5793ae101c74b7131b7a1be90267acabb92fb1))
- Updated VoodooI2C Kext to version [2.8](https://github.com/VoodooI2C/VoodooI2C/releases/tag/2.8) w/ macOS 13+ crash fixes. ([`#36@2a4b914`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/36/commits/2a4b91421cb78cd18db66f817d258da2a07a4eab))

### Added
- Added new OCE-Build project structure and build script ([`#36@1da43cc`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/36/commits/1da43ccd5627330de2a871bdd356ed1d14c235e5))
- Added VoodooI2CHID patch script ([`#36@97bdedd`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/36/commits/97bdeddc7cb180f5e12b3355afce88b71215cd2b))
- Added validate-efi script ([`#36@a0e68fb`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/36/commits/a0e68fb9fd63ea83803061fa636c02614ec4d3f3))
- Added 10th gen CML datasheets ([`#36@f693ea3`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/36/commits/f693ea3231e59f28d38f92ccbdba9ffae02c8458))
- Added ScreenPad-Plus docs ([`#36@975690a`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/36/commits/975690a22fe9377e459397d935567713c657b3dd))

### Removed
- Removed old built EFI folder ([`#36@07d496c`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/36/commits/07d496cae306212fb5bf64cb26a59e737d056d6e))

### Fixed
- Re-enable default boot entry support ([`#36@433b7c6`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/36/commits/433b7c6fc40ef149a2742912a79313b68d8b7d2f))
- Changed BluetoolFixup restriction to macOS 12+ ([`#36@e397620`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/36/commits/e3976205a69052a45baa46c0fb8c42c9890a4b5f))

## [0.4.1] - 2023-02-05

Patch version bump removing a depreciated tool.

### Removed
- Removed modGRUBShell tool ([`ff393e5`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/ff393e5d0b80226175584ea9e736f2f798122c06))

## [0.4.0] - 2023-01-23

This minor version includes refactors for Windows multi-boot compatibility, including complete rewrites for harder spec-compliance for keyboard and screenpad backlight controls.

### Changed
- Relicensed from GPLv3 to BSD-3-Clause ([#26](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/26))
- Updated memory map quirks for more native handling ([`ba3ea5f`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/ba3ea5ff5570119c726a3c1a2676fc78307fbf4b))
- Refactored Screenpad backlight/connector functions into SPLC ([`#32@9de3d05`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/32/commits/9de3d053fa7704d16a94a4466b66e14553afe70f), [`#32@da644e0`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/32/commits/da644e00ed1149f159875ab473f9290e55dd937e))

### Added
- Added display-overrides for screenpad ([`91a8048`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/91a8048680c636716c5dd9575866d6ae1c3e388c))
- Added `USTP` fix for native I2C bus speeds ([`6f50e2b`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/6f50e2ba72295dad7bfc15fb60b6159d0e1ceef3))
- Added NTFS scan policy ([`fedb910`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/fedb9105ea317547d8fba62ef481c0d42d470ab6))
- Added AnyiSightCam Kext for built-in camera ([`#32@e0672e8`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/32/commits/e0672e87eb7d4d2a78975f29b1ebd285a1323b21))
- Added backlight registers fix for CFL/CML ([`4fcbcc1`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/4fcbcc15e716e093ff14c7c0ca110c21860cfc6f))

### Removed
- Remove PS2 mouse/trackpad plugins ([`4dc7f43`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/4dc7f4311382cb8a99494573c2a200abf17fdc30))
- Removed APFS trim default ([`bd87ed0`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/bd87ed096f928a5c195756219af6bc7d53c2a61e))

### Fixed
- Resolved ALS confict with keyboard backlight ([`6c1dd86`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/6c1dd86e0d9ef729ba390d061d464f4e76b08c60))
- Fixed built-in microphone ([`a162265`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/a162265cc4767df13f7de9ec45e4fbeb9ccbe90f)) (Thanks for [**@LeongWZ**](https://github.com/LeongWZ)'s direction!)
- Fix BTFixup dependency load issue ([`555b002`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/555b0027a9cd24baaeeef2c11a3c1d9bd01f48ef))
- Fix VoodooI2C Services + GPIO load order ([`263f279`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/263f279f57f1237f598c0ae7b36688a7cd1e5248))
- Resolve Kext OSBundleLibraries order manually ([`5bd4419`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/5bd441973f2ebbd18de129845f30f45b728ea431))
- Fixed SMBIOS injection under windows ([`360b013`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/360b01315f797c7b7f6f8c80de7cd033c0c86528))

## [0.3.0] - 2023-01-05

This minor version includes a major ACPI overhaul from [#19 PR](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/19), incorporating ATKD/WMI methods from [**@wern-apfel**](https://github.com/wern-apfel). This includes minor updates to OpenCore version [0.8.8](https://github.com/acidanthera/OpenCorePkg/releases/tag/0.8.7), as well as overhauls of previous/legacy SSDTs with many ACPI + Kext + Driver refactors.

### Changed
- Update OpenCore to version 0.8.8 ([`aae14c8`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/aae14c88d759d5dca77ade45b61ae74a50c39196))
- Added ATKD w/ keyboard backlight EC functions from ([`4668403`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/19/commits/466840358ea5321cbfcd408e788ed47bcdd043be)) (Thanks to [**@wern-apfel**](https://github.com/wern-apfel)!)

### Added
- Add FeatureUnlock kext for Sidecar/etc. support ([`#19@424fbf8`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/19/commits/424fbf8b44cc29db14b29dd708f4a534ad864b5a))
- Added documentation for config.plist ACPI renames ([`#19@49750c0`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pulls/19/commits/49750c0b8cb61e37663d5c1501928a1597bb3b43))
- Added Wi-Fi + Bluetooth injector kexts for older macOS targets ([`#19@523a327`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/19/commits/523a327726b7ebe4543f1f8800bddb48a90bb2ad))
- Added APFS restriction for Catalina 10.15.4 or newer ([`e5e5c2b`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/e5e5c2b6bfea78bfd752938683100787f9b4771d))

### Removed
- Removed unneeded config.plist ACPI renames ([`#19@8b3e947`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/19/commits/8b3e9479c635dd4cf29912613cdcbb3803d7a224))
- `_PTS` ACPI fix ([`#19@8b3e947`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/19/commits/8b3e9479c635dd4cf29912613cdcbb3803d7a224))
- Remove depreciated SSDT-ALC294 companion SSDT for CodecCommander ([`#19@c0cd303`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/19/commits/c0cd303f1aa560b96ce03528e03a6178910525b9))
- Remove `SAT0`/`SATA` config.plist ACPI rename ([`#19@2fa6ddb`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/19/commits/2fa6ddb3803640d0c0eddcde07096ef72f869ee1))
- Remove BATT, GPRW, HPET SSDTs ([`#19@3480a1e`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/19/commits/3480a1e022d52e50f5f8a428b9b1bdf3bb579b76))
- Remove SSDT-XOSI and config.plist ACPI rename ([`f3c3145`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/19/commits/f3c314596e7fef4ab0050ae655366b79665cc8bc))

### Fixed
- Fix LoadEarly driver values w/o OpenVariableRuntimeDxe ([`#19@4401757`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/19/commits/44017571c00f8509603dfeea9cbb58b8cc4438d3))
- Resolved native backlight handling with WhateverGreen ([`#19@6ed835d`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/19/commits/6ed835db5192748d4e8bb925a819ac1547129000))
- Added null check for SSDT-GPU-DISABLE per [**@UsedDiscord**](https://github.com/UsedDiscord)'s suggestion ([`#19@a4d38da`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/19/commits/a4d38dafc5c572a20adc726a4c3f8518a6cef0f5))
- Fix BluetoolFixup kext dependency order ([`7a5ba8f`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/44017571c00f8509603dfeea9cbb58b8cc4438d3))

## [0.2.0] - 2022-12-18

This minor version includes small fixes for upgrading to OpenCore version [0.8.7](https://github.com/acidanthera/OpenCorePkg/releases/tag/0.8.7), as well as a clearer Kext load order.

### Changed
- Updated OpenCore to version 0.8.7 ([#15](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/15))

### Added
- Added Screenpad disable SSDT ([`df5b2cd`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/df5b2cd938254855b7e98015998aab76b633201b)) (@wern-apfel)
- Added support for built-in microSD reader ([`e14c7f9`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/e14c7f9b056f4b2b03ce1defbb0f4a65caf23e77))

### Removed
- Sanitized dummy serial info ([`1822753`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/1822753b4422a6cd0c6cddea0b6e601a02c7efaa))

### Fixed
- Changed Kext order for proper OSBundleLibraries load order ([`6249948`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/6249948b78853d7435534ecf6434b831fec87ac9))

## [0.1.0] - 2022-11-30

This minor version includes a major overhaul for this project, incorporating new changes from OpenCore version [0.8.6](https://github.com/acidanthera/OpenCorePkg/releases/tag/0.8.6). This verison removes many old or undocumented config.plist settings from [**@shiecldk**](https://github.com/shiecldk)'s UX582 repo, and is effectively considered a re-write.

### Breaking Changes
- Overhauled base config for OpenCore version 0.8.6 ([#14](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/pull/14))

### Added
- iGPU name spoof ([`9db8996`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/9db899651108b84547d924569aff482a34776e7e))
- CPU name spoof ([`ecd22d0`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/ecd22d01f92561c14a44fa6a3f8ee46162013042), [`690caca`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/690caca612cf25ce9d037a2d10b95b02be8215b4))

### Fixed
- Backlight smoothing ([`000e6c4`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/000e6c4fb676006a4ab681093bc090d9fd8be9bb))
- dGPU Disable SSDT ([`459adea`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/459adea575f1abcf103c3257584a9d37226f4637))
- VoodooI2C plugin and kext load order ([`0b67115`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/0b6711556207d49135466101fb8e217ab68704dd))

## [0.0.1] - 2022-08-28

This patch version incorporates many necessary changes for booting into macOS Monterey using the UX481FA/FL models. This is based on the UX582 config from [**@shiecldk**](https://github.com/shiecldk) using OpenCore version [0.7.6](https://github.com/acidanthera/OpenCorePkg/releases/tag/0.7.6).

### Changed
- Replaced USB mapping with UX481 USB map w/ USBToolBox ([`7a03f24`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/7a03f240f5ba2960739ecad1cfd39bacba73d7ec))
- Updated SMBIOS to MacBookPro16,3 ([`965c52e`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/965c52e5a707d30562455d24e676436033ae35a5))

### Added
- Added ScreenPad Plus EDID dump for model BOE087F ([`4bc0cdf`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/4bc0cdf6905fe5490096428d2457f613be7d93d1))
- Added UX481FL device schematic ([`f628c3c`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/f628c3c3d9cf251e8c45098e372d1e198907c3a3))
- Added documentation for used Kexts ([`92b2e70`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/92b2e70bdfcdae0cb8e755aee553ff36cd0b9100))
- Added IntelBTPatcher Kext for macOS Monterey ([`286b35d`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/286b35d19b37e8429b364e5633123afd8b6dbef1))

### Removed
- Remove unneeded SSDTs ([`b797736`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/b797736ec30bd9cf3c4a2d4e0dd900208f962aef))
- Remove unneeded Kexts ([`8a275f8`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/8a275f8b817a6294b5932115e77315b9199dc26d), [`aba8e86`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/aba8e8673a1ba463624549f02925c85d375c767c))

### Fixed
- Intel UHD 620 device-id ([`a4c3e71`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/a4c3e71a7617d6678787acddc919a2c543ca9d20), [`61f2e23`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/61f2e2327670294a25bdef93d0db3c8720c7962b), [`30a270e`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/30a270edb380e7a3794413a789aa2f98b31fe2cc))
- HDMI infinite-loop on hotplug ([`98580ee`](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/commit/98580ee05d2ca6346bb81db2cf6285b9aa29f37e))