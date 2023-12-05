#!/usr/bin/env bash
# shellcheck disable=SC1091,SC2164

## @file
# Copyright (c) 2023, Cory Bennett. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
##

# Change CWD for imports
__PWD__=$(pwd); cd "$(realpath "$(dirname "${BASH_SOURCE[0]}")/../../")"

while read -r BUILD; do
  # Set build type in config to target build version
  REPLACE="$(sed "s/build: [A-Z]*/build: $BUILD/" src/build.yml)"
  echo "$REPLACE" > src/build.yml
  # Run build script
  echo "Building \"EFI-$TAG-$BUILD.zip\"..."
  bash scripts/build.sh -v
  # Compress EFI directory
  (cd dist && zip -r -X "../EFI-$TAG-$BUILD.zip" EFI >/dev/null)
done <<< $'RELEASE\nDEBUG'
