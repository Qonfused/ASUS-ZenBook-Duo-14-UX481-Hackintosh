#!/usr/bin/env bash

## @file
# VoodooI2CHID patch script for the UX481FA/UX481FL
#
# Copyright (c) 2023, Cory Bennett. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
##

# Change CWD for imports
__PWD__=$(pwd); cd "$(realpath $(dirname "${BASH_SOURCE[0]}")/../../)"

source ./scripts/lib/oc-build/lib/plist.sh


# Apply VoodooI2CHID patch
plist="./dist/EFI/OC/Kexts/VoodooI2CHID.kext/Contents/Info.plist"

driver='VoodooI2CHIDDevice Precision Touchpad HID Event Driver'
recursive_add_entries "$plist" "IOKitPersonalities.$driver.IOPropertyMatch"
entry=\
"<dict>
  <key>ProductID</key>
  <integer>12545</integer>
</dict>"
replace_entries "$plist" "IOKitPersonalities.$driver.IOPropertyMatch" "$entry"

driver='VoodooI2CHIDDevice Touchscreen HID Event Driver'
recursive_add_entries "$plist" "IOKitPersonalities.$driver.IOPCIMatch"
entry=\
"<string>0x2C5604f3&amp;0x2C2304f3</string>"
replace_entries "$plist" "IOKitPersonalities.$driver.IOPCIMatch" "$entry"