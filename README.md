# ASUS-ZenBook-Duo-14-UX481-Hackintosh
Hackintosh OpenCore configuration for ASUS ZenBook Pro Duo 14 UX481(FA/FL)

<p>
  <img
    src="https://raw.githubusercontent.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/main/images/UX481FL.png"
    alt="UX481FL"
    class="center"
  >
</p>


## License
See the original repository license (protected under GNU GPL license).


> **Note**
> This repository is still a work in progress.
> This repository contains all OpenCore and macOS fixes for patching & restoring various device functionality for the ASUS Zenbook Duo 14" UX481(FA/FL).
>
> All testing was done using the below hardware configuration and OpenCore configuration for the ASUS Zenbook Duo 14" UX481FL:
>
><details><summary>Hardware Configuration</summary>
> 
>  |Component | Brand |
>  |--- | --- |
>  |CPU | Intel Core i7-10510U (Comet Lake) 4-core Processor [^0a]|
>  |iGPU | Intel UHD Graphics 620|
>  |dGPU | Nvidia GeForce MX250 2GB (10W 1D52 version; disabled)|
>  |Audio | Realtek ALC???|
>  |Memory | 16GB LPDDR3 2133MHz Cl16 (4x4 GB Micron Modules)|
>  |Wifi & Bluetooth | • Intel AX201 WiFi 6<br>• Bluetooth 5.0|
>  |Storage | Intel 660p 1TB M.2-2280 NVMe SSD|
>  |Camera | Windows Hello HD Camera with IR|
>  |Trackpad | ELAN????, ?|
>  |Display | • 14" (1920 x 1080) IPS display<br>• 12.6" (1920 x 515) IPS Screenpad Plus display|
>  |Touch Screen | • ELAN????, \\_SB.PCI0.I2C?.????, ?<br>• ELAN????, \\_SB.PCI0.I2C?.????, ?|
>  |Ports | (Left)<br>• 1x 4.5mm DC-in (19V; 3.42A)<br>• 1x HDMI 1.4<br>• 1x USB 3.1 Gen 2 Type-A<br>• 1x USB 3.1 Gen 2 Type-C<br>(Right)<br>• 1x USB 3.1 Gen 1 Type-A<br>• 1x 3.5 mm Audio combo jack<br>• 1x MicroSD card reader<br>|
>  |Battery | Dynapack 70Wh (15.4V; 4440mAh) 4-cell LiPo Battery|
> [^0a]: [Intel Core i7-10510U - Intel Ark Page](https://ark.intel.com/content/www/us/en/ark/products/196449/intel-core-i710510u-processor-8m-cache-up-to-4-90-ghz.html)
></details>
><details><summary>OpenCore Configuration</summary>
>
> `WIP`
></details>
>
> The below versions were used for testing:
> * OpenCore Version: [0.7.6](https://github.com/acidanthera/OpenCorePkg/releases/tag/0.7.6https://github.com/acidanthera/OpenCorePkg/releases/tag/0.7.6) (debug version)
> * macOS Version: macOS Monterey 12.4 (Build 21F79, Public Release)
>
> All changes are based off the [Zenbook Pro Duo 15" (UX582) OpenCore configuration and guide from shiecldk](https://github.com/shiecldk/ASUS-ZenBook-Pro-Duo-15-OLED-UX582-Hackintosh).


## Current progress

macOS version support:
- [ ] macOS Ventura (untested)
- [x] macOS Monterey
- [ ] macOS Big Sur (untested)
- [x] macOS Catalina

Hardware features:
- [ ] Intel UHD Graphics 620 (no proper framebuffer id yet)
- [x] Intel WiFi 6
- [x] Intel bluetooth
- [x] Internal stereo speaker
- [x] Internal microphone
- [x] Combo audio jack
- [ ] Camera
- [ ] Main touchscreen
- [ ] Secondary ScreenPad Plus
- [x] Keyboard (doesn't properly map in recovery)
- [ ] Trackpad
- [ ] Media FN keys (FN+F10 alt behavior: volume, brightness, keyboard backlight; switch main/secondary monitors, and disable secondary monitor; see <a href="https://github.com/hieplpvip/AsusSMC">hieplpvip/AsusSMC</a>)
- [x] USB 3.2 Gen2 Type-A (works but haven't done USB mapping)
- [x] USB 3.1 Gen2 Type-A (works but haven't done USB mapping)
- [x] USB 3 Type-C (works but haven't done USB mapping)
- [x] Power adapter

Software features:
- [ ] Battery indication (need to adjust set capacity for proper reading)
- [ ] CPU SpeedStep
- [x] Brightness control (main screen works, screenpad-plus screen is a WIP)
- [ ] Stylus pen (untested; supposedly works without pressure data)
- [ ] Sleep/wake (untested)
- [x] iCloud
- [ ] Continuity (untested)

### What's not working for now
- [ ] Brightness auto adjustment with ambient sensor
- [ ] Trackpad GPIO mode (haven't looked into this)
- [ ] HDMI port (routed to MX 250, which isn't supported by macOS)