#!/usr/bin/env bash

## @file
# EFI build script for the UX481FA/UX481FL
#
# Copyright (c) 2023, Cory Bennett. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
##

# Change CWD for imports
__PWD__=$(pwd); cd "$(realpath $(dirname "${BASH_SOURCE[0]}")/../)"

source ./scripts/lib/constants.sh
source ./scripts/lib/oc-build/lib/macros.sh


# Run build script
bash ./scripts/lib/oc-build/build.sh -c $CONFIG

# Patch SMBIOS Serial data
bash ./scripts/lib/patch-serial.sh