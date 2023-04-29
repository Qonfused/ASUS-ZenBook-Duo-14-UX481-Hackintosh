#!/usr/bin/env bash
#shellcheck disable=SC1091,SC2164

## @file
# EFI validation script for the UX481FA/UX481FL
#
# Copyright (c) 2023, Cory Bennett. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
##

# Change CWD for imports
__PWD__=$(pwd); cd "$(realpath "$(dirname "${BASH_SOURCE[0]}")")"

source ./lib/constants.sh

CONFIG="$__PWD__/$CONFIG"

# Change CWD for imports
cd "$__PWD__"; cd "$(realpath "$(dirname "${BASH_SOURCE[0]}")")/lib/oc-build"

source ./bin/yq/imports.sh
source ./lib/config.sh
source ./lib/constants.sh

cd "$BUILD_DIR" || exit 1


# Validate that folder structure is proper
if [[ ! -e 'EFI/BOOT/BOOTx64.efi' || \
      ! -e 'EFI/OC/ACPI'          || \
      ! -e 'EFI/OC/Drivers'       || \
      ! -e 'EFI/OC/Kexts'         || \
      ! -e 'EFI/OC/Resources'     || \
      ! -e 'EFI/OC/Tools'         || \
      ! -e 'EFI/OC/config.plist'  || \
      ! -e 'EFI/OC/OpenCore.efi'
]]; then ((errors++)); echo "EFI folder structure is malformed"; fi

# Validate if all folders are populated and configured
while read -r dir; do
  case $dir in
    */ACPI)
      INCLUDE="$(cfg 'include.acpi | keys | .[] | select(. != "*/*" )')"
      IS_EXCLUDED() { cfg "exclude.acpi.\"$1\""; }
      ext='aml' ;;
    */Drivers)
      INCLUDE="$(cfg 'include.drivers[] | select(. != "*/*" )')"
      IS_EXCLUDED() { cfg "exclude.drivers | select(. == \"$1\")"; }
      ext='efi' ;;
    */Kexts)
      INCLUDE="$(cfg 'include.kexts | keys | .[] | select(. != "*/*" )')"
      IS_EXCLUDED() { cfg "exclude.acpi.\"$1\""; }
      ext='kext' ;;
    */Tools)
      INCLUDE="$(cfg 'include.tools[] | select(. != "*/*" )')"
      IS_EXCLUDED() { cfg "exclude.tools | select(. == \"$1\")"; }
      ext='efi' ;;
    *) continue ;;
  esac
  
  while read -r key; do
    if [[ -z $key ]]; then continue; fi
    # Check if file is present
    if [[ -z $(IS_EXCLUDED "$key") && ! -e "$dir/$key.$ext" ]]; then
      ((errors++)); echo "File '$key.$ext' missing from $dir."
    fi
    # Check if entry in config.plist exists
    entry=$(grep -oz "<key>Comment</key>\n[^\<]*<string>$key</string>" <<< "$(cat EFI/OC/config.plist)")
    if [[ -z $entry ]]; then
      # Handle null bytes
      entry=$(grep -oz "<key>Comment</key>[^\<]*<string>$key</string>" <<< "$(cat EFI/OC/config.plist)" | tr -d '\0')
      if [[ $entry ]]; then continue; fi
      # Report missing entries
      ((errors++)); echo "Entry for '$key.$ext' missing from config.plist"
    fi
  done <<< "$INCLUDE"
done <<< "$(find EFI/OC -mindepth 1 -maxdepth 1 -type d 2>&1)"

# Check config.plist with ocvalidate
output=$("$OCVALIDATE" EFI/OC/config.plist | sed '/^NOTE:/d; /^$/d; $d')
if [[ -n $output ]]; then
  ((errors+="$(wc -l <<< "$output")"-0)); echo "$output"
fi

if [[ $errors -gt 0 ]]; then exit 1; fi