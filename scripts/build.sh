#!/usr/bin/env bash
# shellcheck disable=SC1091,SC2164

## @file
# EFI build script for the UX481FA/UX481FL
#
# Copyright (c) 2023, Cory Bennett. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
##

# Change CWD for imports
__PWD__=$(pwd); cd "$(realpath "$(dirname "${BASH_SOURCE[0]}")"/../)"

source ./scripts/lib/constants.sh


# Run build script
bash ./scripts/lib/oce-build/build.sh -c "$CONFIG"

# Patch SMBIOS serial data
if printf '%s\n' "$@" | grep -Fxq -- '--skip-serial'; then
  echo "Skipping SMBIOS serial generation..."
else bash ./scripts/lib/oce-build/scripts/patch-serial.sh -c "$CONFIG"; fi