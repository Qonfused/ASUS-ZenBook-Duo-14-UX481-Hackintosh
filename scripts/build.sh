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
source ./scripts/lib/oc-build/lib/macros.sh


# Run build script
bash ./scripts/lib/oc-build/build.sh -c "$CONFIG"

# Patch SMBIOS serial data
if printf '%s\n' "$@" | grep -Fxq -- '--skip-serial'; then
  echo "Skipping SMBIOS serial generation..."
elif [[ ! -f ./src/.serialdata ]]; then bash ./scripts/lib/gen-serial.sh; fi
bash ./scripts/lib/patch-serial.sh