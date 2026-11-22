#!/usr/bin/env bash
# shellcheck disable=SC1091,SC2164

## @file
# Copyright (c) 2023, Cory Bennett. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
##

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/../.."

build_config=$(mktemp)
build_lock=$(mktemp)
cp src/build.yml "$build_config"
cp src/build.lock "$build_lock"
restore_config() {
  cp "$build_config" src/build.yml
  cp "$build_lock" src/build.lock
  rm -f "$build_config" "$build_lock"
}
trap restore_config EXIT

while read -r BUILD; do
  # Change the global build target, preserving per-kext RELEASE overrides.
  sed "s/^build: [A-Z]*/build: $BUILD/" "$build_config" > src/build.yml
  # Run build script
  echo "Building \"EFI-$TAG-$BUILD.zip\"..."
  bash scripts/build.sh --clean -v
  cp src/build.lock dist/EFI/build.lock
  # Compress EFI directory
  (cd dist && zip -r -X "../EFI-$TAG-$BUILD.zip" EFI >/dev/null)
done <<< $'RELEASE\nDEBUG'
