> **Warning** Please follow the below instructions before using this repository.
> 
> Please download [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS) and follow [this guide](https://dortania.github.io/OpenCore-Post-Install/universal/iservices.html#using-gensmbios) for generating SMBIOS data for enabling iServices functionality.

# ASUS-ZenBook-Duo-14-UX481-Hackintosh
Hackintosh OpenCore configuration for ASUS ZenBook Duo 14 UX481(FA/FL)

<p>
  <img
    src="https://raw.githubusercontent.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/main/assets/UX481FL.png"
    alt="UX481FL"
    class="center"
  >
</p>


## License
See the original repository license (protected under GNU GPL license).


## Current progress

> **Note**
> This repository is still a work in progress.
>
> All testing was done using the below hardware configuration for the ASUS Zenbook Duo 14" UX481FL:
>
><details><summary>Hardware Configuration</summary>
> 
>  |Component | Brand |
>  |--- | --- |
>  |CPU | Intel Core i7-10510U (Comet Lake) 4-core Processor [^0a]|
>  |iGPU | Intel UHD Graphics 620|
>  |dGPU | Nvidia GeForce MX250 2GB (10W 1D52 version; disabled)|
>  |Audio | Realtek ALC294|
>  |Memory | 16GB LPDDR3 2133MHz Cl16<br>(Micron MT52L1G32D4PG-093)|
>  |Wifi & Bluetooth | • Intel AX201 WiFi 6<br>• Bluetooth 5.0|
>  |Storage | Intel 660p 1TB M.2-2280 NVMe SSD<br>(INTEL SSDPEKNW010T8)|
>  |Camera | Windows Hello HD Camera with IR|
>  |Trackpad | ELAN1207, _SB.PCI0.I2C1.ETPD, 04F3:310E|
>  |Display | • 14" (1920 x 1080) IPS display<br>• 12.6" (1920 x 515) IPS Screenpad Plus display|
>  |Touch Screen | • ELAN9008, \\_SB.PCI0.I2C0.TPL1, 04F3:310E<br>• ELAN9009, \\_SB.PCI0.I2C3.TPL0, 04F3:29DE|
>  |Ports | (Left)<br>• 1x 4.5mm DC-in (19V; 3.42A)<br>• 1x HDMI 1.4<br>• 1x USB 3.1 Gen 2 Type-A<br>• 1x USB 3.1 Gen 2 Type-C<br>(Right)<br>• 1x USB 3.1 Gen 1 Type-A<br>• 1x 3.5 mm Audio combo jack<br>• 1x MicroSD card reader<br>|
>  |Battery | Dynapack 70Wh (15.4V; 4440mAh) 4-cell LiPo Battery|
> [^0a]: [Intel Core i7-10510U - Intel Ark Page](https://ark.intel.com/content/www/us/en/ark/products/196449/intel-core-i710510u-processor-8m-cache-up-to-4-90-ghz.html)
>
> </details>
> 
> The below versions were used for testing:
> * OpenCore Version: [0.8.7](https://github.com/acidanthera/OpenCorePkg/releases/tag/0.8.7) (debug version)
> * macOS Version: macOS Monterey 12.4 (Build 21F79, Public Release)
>
> All changes are based off the [Zenbook Pro Duo 15" (UX582) OpenCore configuration and guide from shiecldk](https://github.com/shiecldk/ASUS-ZenBook-Pro-Duo-15-OLED-UX582-Hackintosh).


Current macOS version support:
- [x] macOS Ventura
- [x] macOS Monterey (11.3+)
- [ ] macOS Big Sur
- [ ] macOS Catalina (min supported version)

Hardware features:
- [x] Intel UHD Graphics 620
- [x] Intel AX201 (WiFi 6 + Bluetooth)
- [x] Internal stereo speaker
- [ ] Internal microphone (untested)
- [ ] Combo audio jack (untested)
- [ ] Built-in Camera (untested)
- [x] Primary Display
- [ ] ScreenPad Plus Display (WIP)
- [x] HDMI port (with hot-plug support)
- [x] Keyboard
- [x] Trackpad (with gestures)
- [ ] Left/Right Trackpad Buttons (WIP)
- [x] USB (3.2 Gen2 Type-A, 3.1 Gen2 Type-A, Type-C)
- [x] Power adapter

Software features:
- [x] Battery indication
- [x] Touchscreen w/ multitouch gestures (screenpad-plus is a WIP)
- [x] Brightness control (screenpad-plus screen is a WIP)
- [ ] Stylus pen (untested; can work but without pressure data)
- [x] Sleep/wake
- [x] iCloud
- [x] Continuity (only Handoff and Universal Clipboard)
