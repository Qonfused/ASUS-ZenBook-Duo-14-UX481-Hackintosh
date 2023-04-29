#!/usr/bin/env bash
# shellcheck disable=SC1091,SC2164

## @file
# Applies display overrides for the UX481FA/UX481FL
#
# Copyright (c) 2023, Cory Bennett. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
##

# Change CWD for imports
__PWD__=$(pwd); cd "$(realpath "$(dirname "${BASH_SOURCE[0]}")"/../)"


OVERRIDES=(docs/resources/display\ overrides/*.plist)
DISPLAYS=$(ioreg -lw0 -r -n display0 | grep -E '  {|ProductID|VendorID|  }' | sed 's/.*= //' | xargs)
for i in "${!OVERRIDES[@]}"; do 
  pid=$(/usr/libexec/PlistBuddy -c "print :DisplayProductID" "${OVERRIDES[i]}")
  vid=$(/usr/libexec/PlistBuddy -c "print :DisplayVendorID" "${OVERRIDES[i]}")
  if [[ -z $(grep "{ $pid $vid }" <<< "$DISPLAYS") ]]; then unset 'OVERRIDES[i]'; fi
done

if [ ${#OVERRIDES[@]} -eq 0 ]; then
  echo "No matching display devices were found."; exit
fi

OVERRIDES_DIR="/Library/Displays/Contents/Resources/Overrides"

echo "Creating new overrides directory under $OVERRIDES_DIR..."
sudo mkdir -p "$OVERRIDES_DIR"

echo -e $'\nThis script will add the below patches to the display overrides directory:'
for i in "${!OVERRIDES[@]}"; do
  if [[ $i -eq 0 ]]; then printf $'%-4s %-16s %-8s\n' "#" "Device" "Patch"; fi
  pl="${OVERRIDES[i]}"
  name=$(/usr/libexec/PlistBuddy -c "print :DisplayProductName" "$pl")
  printf $'%-4s %-16s %-8s\n' "${i+1}" "$name" "$pl"
done

read -rep $'\nWould you like to continue? (y/n): ' choice
case "$choice" in y|Y);; *) exit;; esac

echo -e $'\nAdding display overrides...'
for i in "${!OVERRIDES[@]}"; do
  pl="${OVERRIDES[i]}"
  pid=$(/usr/libexec/PlistBuddy -c "print :DisplayProductID" "$pl")
  vid=$(/usr/libexec/PlistBuddy -c "print :DisplayVendorID" "$pl")
  if [[ -z $(grep "{ $pid $vid }" <<< "$DISPLAYS") ]]; then
    entry="DisplayVendorID-%x/DisplayProductID-%x"
    #shellcheck disable=SC2059,SC2086
    target=$(printf "$OVERRIDES_DIR/$entry" $vid $pid)
    sudo cp "$pl" "$target"
    sudo chown root:wheel "$target"
    sudo chmod 0664 "$target"
    echo "--> Created ${pl%.plist} display override."
  fi
done