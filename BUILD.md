### Building this project

(WIP)

Execute these commands at the root of the project:
```sh
# Build the UX481FA EFI
bash ./scripts/oc-build/build.sh -c ./src/UX481FA/build.yml

# Build the UX481FL EFI
bash ./scripts/oc-build/build.sh -c ./src/UX481FL/build.yml
```

### Build project structure
```sh
$root
├── dist                # Contains built EFI and pre/post-install scripts
|   ├── EFI
|   └── scripts
├── scripts
|   └── oc-build
|       └── build.sh    # Build script is executed from here to resolve imports
└── src
    ├── lib             # Contains shared SSDTs and Kexts for all projects
    |   ├── ACPI
    |   └── Kexts
    ├── UX481{FA|FL}    # Contains model specific SSDTs/Kexts and build files
    |   ├── ACPI
    |   ├── Kexts
    |   ├── build.lock  # Lockfile generated after each build
    |   ├── build.yml   # Build file specifying EFI build details
    |   └── config.yml  # Build file specifying config.plist build details
```