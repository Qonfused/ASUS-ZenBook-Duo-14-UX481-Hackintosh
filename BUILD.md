### Building this project

(WIP)

Execute these commands at the root of the project:
```sh
# Run build pipeline for the UX481FA/FL EFI
bash ./scripts/build.sh

# --- or ---

# Build the UX481FA/FL EFI
bash ./scripts/lib/oc-build/build.sh -c ./src/build.yml

# Apply VoodooI2CHID Info.plist patch
bash ./scripts/lib/patch-voodooi2chid.sh
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

You can verify the output build structure with the below scripts:
```sh
# Verify build output for the UX481FA/FL EFI
bash ./scripts/validate-efi.sh
```