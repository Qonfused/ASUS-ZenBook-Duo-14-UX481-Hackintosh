#!/bin/bash
set -eo pipefail

overrides=(*.plist)

set +u
displays=$(ioreg -lw0 -r -n display0 | grep -E '  {|ProductID|VendorID|  }' | sed 's/.*= //' | xargs)
for i in "${!overrides[@]}"; do 
  pid=$(/usr/libexec/PlistBuddy -c "print :DisplayProductID" "${overrides[i]}")
  vid=$(/usr/libexec/PlistBuddy -c "print :DisplayVendorID" "${overrides[i]}")
  if [[ -z $(echo $displays | grep "{ $pid $vid }") ]]; then
    unset 'overrides[i]'
  fi
done

if [ ${#overrides[@]} -eq 0 ]; then
  echo "No matching display devices were found."; exit
fi

override_dir="/Library/Displays/Contents/Resources/Overrides"

echo "Creating new overrides directory under $override_dir..."
sudo mkdir -p "$override_dir"

echo -e $'\nThis script will add the below patches to the display overrides directory:'
for i in "${!overrides[@]}"; do
  if [[ $i -eq 0 ]]; then printf $'%-4s %-16s %-8s\n' "#" "Device" "Patch"; fi
  pl="${overrides[i]}"
  name=$(/usr/libexec/PlistBuddy -c "print :DisplayProductName" $pl)
  printf $'%-4s %-16s %-8s\n' "${i+1}" "${name}" "${pl}"
done

read -rep $'\nWould you like to continue? (y/n): ' choice
case "$choice" in y|Y );; *|n|N ) exit;; esac

echo -e $'\nAdding display overrides...'
for i in "${!overrides[@]}"; do
  pl="${overrides[i]}"
  pid=$(/usr/libexec/PlistBuddy -c "print :DisplayProductID" $pl)
  vid=$(/usr/libexec/PlistBuddy -c "print :DisplayVendorID" $pl)
  if [[ -z $(echo $displays | grep "{ $pid $vid }") ]]; then
    entry="DisplayVendorID-%x/DisplayProductID-%x"
    target=$(printf "$override_dir/$entry" $vid $pid)
    sudo cp "$pl" "$target"
    sudo chown root:wheel "$target"
    sudo chmod 0664 "$target"
    echo "--> Created ${pl%.plist} display override."
  fi
done