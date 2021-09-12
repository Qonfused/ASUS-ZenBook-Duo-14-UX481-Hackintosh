# ASUS-ZenBook-Pro-Duo-15-OLED-UX582-Hackintosh
Hackintosh installation guide for ASUS ZenBook Pro Duo 15 OLED UX582


## License
This repo is protected by GNU GPL license. Any commercial use of this project without my authorization is strictively prohabited. Please refer the original repo before you make any distribution.


## Support this Project
If you like this guide, please consider donating me through PayPal or crypto. Developement of this hackintosh consumes a lof of time. You can contribute to this project by buying me a cup of coffee to keep this repo up-to-date.

<p>
<a href="https://www.paypal.com/donate/?hosted_button_id=YK65DJNB4UK2L">
         <img alt="Qries" src="https://raw.githubusercontent.com/shiecldk/ASUS-ZenBook-Pro-Duo-15-OLED-UX582-Hackintosh/main/PayPal.png"
          height="140"></a><br>
<a href="https://www.paypal.com/donate/?hosted_button_id=YK65DJNB4UK2L">Donate with PayPal</a></p>

<p>BTC Wallet: 1jUMQVzq9e64erkytLYuD1LTt7nMkAFXs<br>
ETH Wallet: 0x09bbd23a1fe39cc70aba2232dcd9d1aa64a3fb2d<br>
SOL Wallet: HPrnqBfDArW3xcQqGZZ1Y51QSbJMFtoVtmtnufySqynD<br>
ADA Wallet: Ae2tdPwUPEZMsWbd5xpjBD9rvurtkdPq4p7mPZMsmbcbTR1wAhsYkGVMGza</p>


## External Guide

<p>
<a href="https://www.tonymacx86.com/threads/guide-asus-zenbook-pro-duo-ux582-opencore.315661/">Big Sur Installation Gudie on tonymacx86.com</a></p>


## Spec

| Component | Brand |
| ----------- | ----------- |
| CPU | Intel Core i9-10980HK (varient: Intel Core i7-10870H) |
| iGPU | Intel UHD Graphics 630 |
| Audio | Realtek ALC294 |
| Ram | 32GB DDR4L 2933 MHz (varient: 16GB DDR4L 2933 MHz) |
| Wifi + Bluetooth | Intel AX201 Wifi 6, Bluetooth 5.0 |
| Storage | Samsung PM981A 1TB M.2 SSD (Replacement Needed) |
| Camera | Windows Hello HD Camera with IR |
| Trackpad | ELAN1406, 04F3:3101 |
| Display | 15.6" (3840x2160) OLED; 14" (3840x1100) IPS ScreenPad Plus |
| Touch Screen| ELAN9008, \_SB.PCI0.I2C1.TPL0, 04F3:2C56; ELAN9009, \_SB.PCI0.I2C1.TPL1, 04F3:2C23 |
| Stylus | ASUS Pen (SA201H)  |
| Ports | 1x USB 3.2 Gen 2 Type-A; 2x Thunderbolt 3; 1x HDMI 2.1; 1x 3.5mm Combo Audio Jack; 1x DC-in |
| Battery | 92Wh 15.48v 5810mAh |


## ToDo List
- [ ] Trackpad stop working sometimes
- [ ] Windows in main screen misplaced after restart
- [ ] ScreenPad multi-touch control
- [ ] Brightness control
- [ ] Ambient sensor
- [ ] Camera
- [ ] Keyboard Backlight and other FN keys
- [ ] Numpad
- [ ] Speaker seems to be a little quiet: may be can boost by this app [eqMac](https://eqmac.app/)
- [ ] Thunderbolt 3 for eGPU (Need more SSDT and DROM patches)
- [ ] Update for macOS Monterey


## Current progress
### What's working
- [x] Intel UHD Graphics 630
- [x] Intel WiFi 6 (Speed can be slow on very few routers)
- [x] Intel Bluetooth
- [x] Internal Speakers
- [x] Internal microphone
- [x] Combo audio jack
- [x] Battery indication
- [x] SpeedStep
- [x] Main touch screen
- [x] Secondary ScreenPad Plus (Partially work, single touch as cursor)
- [x] Brightness control (Use software brightness control workaround with Lunar.app)
- [x] Stylus pen with both screens
- [x] Keyboard
- [x] Trackpad with multi-touch gestures (Stop working sometimes and start working a few minutes later again)
- [x] FN Key, volume and brightness
- [x] Type-A to USB3
- [x] Type-C to USB3 & USB2
- [x] Type-C to DP/HDMI
- [x] Thunderbolt 3 (Only non-eGPU devices work)
- [x] Stylus, work without sense of pressure
- [x] Sleep/wake

### What's not working
- [ ] Nvidia RTX 3070 and HDMI port (won't work due to no driver in macOS)
- [ ] Keyboard Backlight (WIP)
- [ ] Most other FN keys (WIP)
- [ ] Numpad (need to port driver from Linux)
- [ ] Camera (?)
- [ ] Ambient sensor
