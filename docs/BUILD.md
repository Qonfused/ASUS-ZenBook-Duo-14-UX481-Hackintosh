### Building this project

(WIP)

Execute these commands at the root of the project:
```sh
# Build the UX481FA/FL EFI
bash ./scripts/oc-build/build.sh -c ./src/build.yml

# Apply VoodooI2CHID patch
bash ./scripts/patch-voodooi2chid.sh
```

### Build project structure
```sh
$root
├── dist                # Contains built EFI and pre/post-install scripts
|   ├── EFI
|   └── scripts
├── lib                 # Contains shared or universal SSDTs and Kexts
|   ├── ACPI
|   └── Kexts
├── scripts
|   └── oc-build        # Build script is executed from here to resolve imports
|       └── build.sh
└── src                 # Contains model specific SSDTs/Kexts and build files
    ├── ACPI
    ├── Kexts
    ├── build.lock      # Lockfile generated after each build
    ├── build.yml       # Build file specifying EFI build details
    └── config.yml      # Build file specifying config.plist build details
```