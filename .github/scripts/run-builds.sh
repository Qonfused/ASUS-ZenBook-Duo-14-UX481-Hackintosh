#!/usr/bin/env bash

## @file
# Copyright (c) 2023, Cory Bennett. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
##

source ./scripts/lib/constants.sh
source ./scripts/lib/oc-build/lib/macros.sh

while read -r BUILD; do
  # Set build type in config to target build version
  REPLACE="$(sed "s/oc-build: [A-Z]*/oc-build: $BUILD/" src/build.yml)"
  echo "$REPLACE" > src/build.yml
  # Run build script
  echo "Building \"EFI-$TAG-$BUILD.zip\"..."
  bash scripts/lib/oc-build/build.sh -c "$CONFIG"
  # Compress EFI directory
  (cd dist && zip -r -X "../EFI-$TAG-$BUILD.zip" EFI >/dev/null)
done <<< $'RELEASE\nDEBUG'