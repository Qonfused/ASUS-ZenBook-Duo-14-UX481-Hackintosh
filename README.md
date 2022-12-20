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
> The below versions are recommended for testing:
> * OpenCore Version: [0.8.7](https://github.com/acidanthera/OpenCorePkg/releases/tag/0.8.7) (DEBUG version)
> * macOS Version: macOS Monterey 12.4 (Build 21F79, Public Release)
>
> All changes are based off the [Zenbook Pro Duo 15" (UX582) OpenCore configuration and guide](https://github.com/shiecldk/ASUS-ZenBook-Pro-Duo-15-OLED-UX582-Hackintosh) from @shiecldk.


### Current macOS version support:
<table>
  <thead>
    <tr>
      <th>Codebase</th>
      <th colspan=2>Status</th>
      <th>Minimum supported version</th>
      <th>Maximum supported version</th>
    </tr>
  </thead>
  <tbody>
  <!-- macOS 13 -->
    <tr>
      <td>
        <img
          src="https://raw.githubusercontent.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/main/assets/ventura.png"
          width=25
          hspace=2
          align="top"
        />
        macOS Ventura
      </td>
      <td style="text-align: center;">✅</td>
      <td>Supported</td>
      <td>13.0 Release (Build 22A380)</td>
      <td><code>(Latest)</code></td>
    </tr>
  <!-- macOS 12 -->
    <tr>
      <td>
        <img
          src="https://raw.githubusercontent.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/main/assets/monterey.png"
          width=22
          hspace=2
          align="top"
        />
        macOS Monterey
      </td>
      <td style="text-align: center;">✅</td>
      <td>Supported</td>
      <td>12.3 Beta 5 (21E5227a)</td>
      <td><code>(Latest)</code></td>
    </tr>
  <!-- macOS 11 -->
    <tr>
      <td>
        <img
          src="https://raw.githubusercontent.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/main/assets/bigsur.png"
          width=25
          hspace=2
          align="top"
        />
        macOS Big Sur
      </td>
      <td style="text-align: center;">🚧</td>
      <td>Untested</td>
      <td>11.0.1 Release (Build 20B29)</td>
      <td><code>(Latest)</code></td>
    </tr>
<!-- macOS 11 -->
    <tr>
      <td>
        <img
          src="https://raw.githubusercontent.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/main/assets/catalina.png"
          width=25
          hspace=2
          align="top"
        />
        macOS Catalina
      </td>
      <td style="text-align: center;">🚧</td>
      <td>Untested</td>
      <td>10.15.4 Beta 1 (19E224G)</td>
      <td><code>(Latest)</code></td>
    </tr>
</table>

### Hardware features:
<table>
  <thead>
    <tr>
      <th>Component</th>
      <th>Device</th>
      <th colspan=2>Status</th>
    </tr>
  </thead>
  <tbody>
  <!-- Processor -->
    <tr>
      <td>CPU</td>
      <td>• Intel Core i7-10510U<br>• Intel Core i5-10210U</td>
      <td style="text-align: center;">✅</td>
      <td>Natively supported (since macOS Catalina).</td>
    </tr>
  <!-- Graphics -->
    <tr>
      <td rowspan=2>Graphics</td>
      <td>Intel UHD Graphics 620</td>
      <td style="text-align: center;">✅</td>
      <td>Full acceleration (with DRM).</td>
    </tr>
    <tr>
      <td>Nvidia GeForce MX250 2GB</td>
      <td style="text-align: center;">❌</td>
      <td>Disabled; no macOS support.</td>
    </tr>
  <!-- Displays -->
    <tr>
      <td rowspan=2>Displays</td>
      <td>14" Primary Display<br>(IPS, 1920x1080 @ 60 Hz)</td>
      <td style="text-align: center;">✅</td>
      <td>Fully supported (with backlight control).</td>
    </tr>
    <tr>
      <td>12.6" Screenpad Plus Display<br>(IPS, 1920x515 @ 60 Hz)</td>
      <td style="text-align: center;">🚧</td>
      <td>Work in progress.</td>
    </tr>
  <!-- Interfaces -->
    <tr>
      <td rowspan=5>Interfaces</td>
      <td rowspan=2>Touchscreen<br>(Primary Display)<br>(Screenpad Plus Display)</td>
      <td style="text-align: center;">🚧</td>
      <td>Work in progress.</td>
    </tr>
    <tr>
      <td style="text-align: center;">🚧</td>
      <td>Work in progress.</td>
    </tr>
    <tr>
      <td>Built-in Keyboard</td>
      <td style="text-align: center;">✅</td>
      <td>Fully supported (with media keys).</td>
    </tr>
    <tr>
      <td>Built-in Trackpad</td>
      <td style="text-align: center;">✅</td>
      <td>Fully supported (with multi-touch gestures)</td>
    </tr>
    <tr>
      <td>(Physical) Trackpad Buttons</td>
      <td style="text-align: center;">🚧</td>
      <td>Work in progress.</td>
    </tr>
  <!-- Audio -->
    <tr>
      <td rowspan=2>Audio<br>(Realtek ALC294)</td>
      <td>Built-in speakers</td>
      <td style="text-align: center;">✅</td>
      <td>Fully supported (with volume control).</td>
    </tr>
    <tr>
      <td>Built-in microphone</td>
      <td style="text-align: center;">❌</td>
      <td>Not working.</td>
    </tr>
  <!-- Camera -->
    <tr>
      <td>Camera</td>
      <td>Windows Hello HD Camera</td>
      <td style="text-align: center;">❌</td>
      <td>Not working.</td>
    </tr>
  <!-- Wi-Fi + Bluetooth -->
    <tr>
      <td>Wi-Fi</td>
      <td rowspan=2>Intel AX201<br>(Wi-Fi 6 + Bluetooth 5.0)</td>
      <td rowspan=2 style="text-align: center;">✅</td>
      <td rowspan=2>Fully supported (with limited Continuity support).</td>
    </tr>
    <tr>
      <td>Bluetooth</td>
    </tr>
  <!-- Storage -->
    <tr>
      <td>Storage</td>
      <td>Intel 660p NVMe SSD</td>
      <td style="text-align: center;">✅</td>
      <td>Fully supported (with power management).</td>
    </tr>
  <!-- Ports -->
    <tr>
      <td>Ports</td>
      <td>(Left)<br>• 1x 4.5mm DC-in (19V, 3.42A)<br>• 1x HDMI 1.4<br>• 1x USB 3.1 Gen 2 Type-A<br>• 1x USB 3.1 Gen 2 Type-C<br>(Right)<br>• 1x USB 3.1 Gen 1 Type-A<br>• 1x 3.5 mm Audio combo jack<br>• 1x MicroSD card reader</td>
      <td style="text-align: center;">✅</td>
      <td>Fully supported.</td>
    </tr>
  <!-- Battery and Power -->
    <tr>
      <td rowspan=2>Battery</td>
      <td>Built-in Battery</td>
      <td style="text-align: center;">✅</td>
      <td>Fully supported (with power reading).</td>
    </tr>
    <tr>
      <td>AC Power Adapter</td>
      <td style="text-align: center;">✅</td>
      <td>Fully supported (with charge limit features).</td>
    </tr>
  </tbody>
</table>

Software features:
- [x] Battery indication
- [x] Touchscreen w/ multitouch gestures (screenpad-plus is a WIP)
- [x] Brightness control (screenpad-plus screen is a WIP)
- [ ] Stylus pen (untested; can work but without pressure data)
- [x] Sleep/wake
- [x] iCloud
- [x] Continuity (only Handoff and Universal Clipboard)
