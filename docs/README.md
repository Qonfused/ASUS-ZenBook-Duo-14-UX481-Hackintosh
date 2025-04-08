<h1 align="center">ASUS ZenBook Duo 14 UX481 Hackintosh</h1>
<br>
<p align="center">
  <img
      src="https://raw.githubusercontent.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/main/docs/assets/README/UX481.png"
      alt="UX481FL"
      class="center"
      width=500px
    >
  <br>
  A <b>Hackintosh</b> project for the <b>ASUS ZenBook Duo 14"</b> built on top of the <a href="https://github.com/acidanthera/OpenCorePkg">OpenCore</a> bootloader and <a href="https://github.com/Qonfused/OCE-Build">OCE-Build</a> build manager.
</p>

<div align="center">

  <a href="/LICENSE">![License](https://img.shields.io/github/license/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh?label=⚖%20License&labelColor=3f4551&color=9dc4d0)</a>
  <a href="/docs/CHANGELOG.md">![SemVer](https://img.shields.io/badge/SemVer-v0.6.0-important?logo=SemVer&labelColor=3f4551)</a>
  <a href="">![Supported Models](https://img.shields.io/badge/Supported%20Models-UX481FA%20%7C%20UX481FL-important?labelColor=3f4551)</a>
  <a href="https://github.com/acidanthera/OpenCorePkg/releases">![OpenCore](https://img.shields.io/badge/OpenCore-1.0.4-0c7dbe?logo=Osano&logoColor=0298e1&labelColor=3f4451)</a>
  <a href="https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/actions/workflows/oce-build.yml">![OCE Build](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/actions/workflows/oce-build.yml/badge.svg?branch=main)</a>

</div>

## ⚡Quick Links

- [Current Progress](#%EF%B8%8F-current-progress)
  - [macOS Version Support](#macos-version-support)
  - [Hardware Features](#hardware-features)
  - [Software Features](#software-features)
- [Getting Started](#-getting-started)
  - [1. Clone this repository using git](#1-clone-this-repository-using-git)
  - [2. Build this repository using OCE-Build](#2-build-this-repository-using-oce-build)
  - [3. Using this EFI with macOS](#3-using-this-efi-with-macos)
- [Contributing](#-contributing)
- [License](#%EF%B8%8F-license)
- [Credits](#-credits)

## ⚙️ Current Progress

> [!NOTE]
> This repository is still a work in progress.

See this repository's [task board](https://github.com/users/Qonfused/projects/2/views/4) and [issues page](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/issues) for current progress. Upcoming or planned changes are also tracked on a [roadmap board](https://github.com/users/Qonfused/projects/2/views/9).

Refer to the [CHANGELOG](/docs/CHANGELOG.md) or [SemVer board](https://github.com/users/Qonfused/projects/2/views/11) for changes implemented per release version.

### macOS Version Support:
<table>
  <thead>
    <tr>
      <th>macOS Version</th>
      <th colspan=2>Status</th>
      <th>Minimum version</th>
      <th>Maximum version</th>
    </tr>
  </thead>
  <tbody>
  <!-- macOS 15 -->
    <tr>
      <td>
        <img
          src="https://raw.githubusercontent.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/main/docs/assets/README/sequoia.png"
          width=25
          hspace=2
          align="top"
        />
        Sequoia
      </td>
      <td style="text-align: center;">🚧</td>
      <td>In Preview.</td>
      <td><code>(None)</code></td>
      <td><a href="https://www.apple.com/macos/macos-sequoia-preview/"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 14 -->
    <tr>
      <td>
        <img
          src="https://raw.githubusercontent.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/main/docs/assets/README/sonoma.png"
          width=25
          hspace=2
          align="top"
        />
        Sonoma
      </td>
      <td style="text-align: center;">✅</td>
      <td>Fully Supported.</td>
      <td><code>(None)</code></td>
      <td><a href="https://apps.apple.com/us/app/macos-sonoma/id6450717509"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 13 -->
    <tr>
      <td>
        <img
          src="https://raw.githubusercontent.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/main/docs/assets/README/ventura.png"
          width=25
          hspace=2
          align="top"
        />
        Ventura
      </td>
      <td style="text-align: center;">✅</td>
      <td>Fully Supported.</td>
      <td><code>(None)</code></td>
      <td><a href="https://apps.apple.com/us/app/macos-ventura/id1638787999"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 12 -->
    <tr>
      <td>
        <img
          src="https://raw.githubusercontent.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/main/docs/assets/README/monterey.png"
          width=22
          hspace=2
          align="top"
        />
        Monterey
      </td>
      <td style="text-align: center;">✅</td>
      <td>Fully Supported.</td>
      <td><code>(None)</code></td>
      <td><a href="https://apps.apple.com/us/app/macos-monterey/id1576738294"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 11 -->
    <tr>
      <td>
        <img
          src="https://raw.githubusercontent.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/main/docs/assets/README/bigsur.png"
          width=25
          hspace=2
          align="top"
        />
        Big Sur
      </td>
      <td style="text-align: center;">✅</td>
      <td>Fully Supported.</td>
      <td><code>(None)</code></td>
      <td><a href="https://apps.apple.com/us/app/macos-big-sur/id1526878132"><code>(Latest)</code></a></td>
    </tr>
<!-- macOS 10.15 -->
    <tr>
      <td>
        <img
          src="https://raw.githubusercontent.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/main/docs/assets/README/catalina.png"
          width=25
          hspace=2
          align="top"
        />
        Catalina
      </td>
      <td style="text-align: center;">✅</td>
      <td>Fully Supported.</td>
      <td><a href="https://support.apple.com/kb/DL2051?locale=en_US"><code>10.15.7 (19H1419)</code></a></td>
      <td><a href="https://apps.apple.com/sg/app/macos-catalina/id1466841314"><code>(Latest)</code></a></td>
    </tr>
</table>


### Hardware Features:
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
      <td>Work in progress (with backlight control).</td>
    </tr>
  <!-- Interfaces -->
    <tr>
      <td rowspan=6>Interfaces</td>
      <td>Built-in Keyboard</td>
      <td style="text-align: center;">✅</td>
      <td>Fully supported (with media keys and backlight control).</td>
    </tr>
    <tr>
      <td>Built-in Trackpad</td>
      <td style="text-align: center;">✅</td>
      <td>Fully supported (GPIO pinned with multi-touch gestures)</td>
    </tr>
    <tr>
      <td>(Physical) Trackpad Buttons</td>
      <td style="text-align: center;">✅</td>
      <td>Fully supported.</td>
    </tr>
    <tr>
      <td rowspan=2>Touchscreen<br>(Primary Display)<br>(Screenpad Plus Display)</td>
      <td style="text-align: center;">✅</td>
      <td rowspan=2>Fully supported (GPIO pinned with multi-touch gestures)</td>
    </tr>
    <tr>
      <td style="text-align: center;">✅</td>
    </tr>
    <tr>
      <td>Capacitive Stylus</td>
      <td style="text-align: center;">🚧</td>
      <td>Work in progress (works without pressure data).</td>
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
      <td style="text-align: center;">✅</td>
      <td>Fully supported.</td>
    </tr>
  <!-- Camera -->
    <tr>
      <td>Camera</td>
      <td>Windows Hello HD Camera</td>
      <td style="text-align: center;">🚧</td>
      <td>Work in progress.</td>
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
      <td>Fully supported (with hotplug and charge limit feature).</td>
    </tr>
  </tbody>
</table>


### Software Features:
<table>
  <thead>
    <tr>
      <th>Type</th>
      <th>Feature</th>
      <th colspan=2>Status</th>
    </tr>
  </thead>
  <tbody>
  <!-- iServices -->
    <tr>
      <td colspan=2>iServices (iCloud)</td>
      <td style="text-align: center;">✅</td>
      <td>Fully supported.</td>
    </tr>
  <!-- Continuity -->
    <tr>
      <td rowspan=6>Continuity</td>
      <td>AirDrop</td>
      <td style="text-align: center;">❌</td>
      <td>Unsupported.</td>
    <tr>
    <tr>
      <td>AirPlay to Mac</td>
      <td style="text-align: center;">✅</td>
      <td>Supported.</td>
    <tr>
      <td>Sidecar</td>
      <td style="text-align: center;">❌</td>
      <td>Unsupported.</td>
    <tr>
      <td>Handoff</td>
      <td style="text-align: center;">✅</td>
      <td>Supported.</td>
    </tr>
    <tr>
      <td>Continuity Camera</td>
      <td style="text-align: center;">❌</td>
      <td>Unsupported.</td>
    </tr>
    <tr>
      <td>Universal Clipboard</td>
      <td style="text-align: center;">✅</td>
      <td>Supported.</td>
    </tr>
    <tr>
      <td>Universal Control</td>
      <td style="text-align: center;">❌</td>
      <td>Unsupported.</td>
    </tr>
  <!-- Sleep + Wake -->
    <tr>
      <td rowspan=2>Sleep / Wake</td>
      <td>Sleep</td>
      <td style="text-align: center;">✅</td>
      <td>Supported.</td>
    </tr>
    <tr>
      <td>Hibernation</td>
      <td style="text-align: center;">✅</td>
      <td>Supported.</td>
    </tr>
  <!-- Battery meter -->
    <tr>
      <td colspan=2>Battery Indication</td>
      <td style="text-align: center;">✅</td>
      <td>Fully supported.</td>
    </tr>
</table>

## ✨ Getting Started
[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=521847844)

### 1. Clone this repository using Git

To clone this repository locally, run the below command:
```sh
git clone https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh
cd ASUS-ZenBook-Duo-14-UX481-Hackintosh
```

### 2. Build this repository using OCE-Build

This project uses [OCE-Build](https://github.com/Qonfused/OCE-Build) to automatically version and build this repository's EFI.

To build this project's EFI, run either of the below commands at the root of the project:
```powershell
# In PowerShell
scripts/build.ps1

# In Bash/WSL
scripts/build.sh
```

> [!IMPORTANT]
> To run powershell scripts, you may need to set your execution policy using:
> ```powershell
> Set-ExecutionPolicy RemoteSigned
> ```

You can also download [OCE-Build](https://github.com/Qonfused/OCE-Build/releases) and run the `ocebuild build` command from the root of the project.

### 3. Using this EFI with macOS

To enable **iServices** functionality, you can:
1. Generate SMBIOS data with [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS)
  - Follow the Dortania [iServices guide](https://dortania.github.io/OpenCore-Post-Install/universal/iservices.html#using-gensmbios) to generate new SMBIOS data for your machine.
2. For local builds of this EFI, patch *existing* SMBIOS data automatically.
  - This is automatically patched each time you run a build using the **.serialdata** file (using existing data or data generated by GenSMBIOS).
  - Refer to the [**.serialdata.example**](/src/.serialdata.example) file for an example of the entry format.

Refer to the [Install Guide](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/wiki/Install-Guide) and [Post-Install Guide](https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/wiki/Post-Install-Guide) for installation instructions.

## 🔥 Contributing
Contributions of any size to this project are always welcome!

Refer to [CONTRIBUTING.md](/docs/CONTRIBUTING.md) for instructions (and tips) on making contributions to this project.

## ⚖️ License
[BSD 3-Clause License](/LICENSE).

## 🌟 Credits
- [@shiecldk](https://github.com/shiecldk) for their continued contributions and work in the original [Zenbook Pro Duo 15" (UX582) OpenCore configuration and guide](https://github.com/shiecldk/ASUS-ZenBook-Pro-Duo-15-OLED-UX582-Hackintosh) that inspired this project.
- [@UsedDiscord](https://github.com/UsedDiscord) for their contributions and direction helping investigate screenpad and trackpad functionality.
- [@1Revenger](https://github.com/1Revenger1) for their contributions in fixing trackpad buttons and multi-touchscreen inputs in VoodooI2CHID.
- [@wern-apfel](https://github.com/wern-apfel) for their contributions helping to enable ATKD WMI functionality.
