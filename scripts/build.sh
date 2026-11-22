#!/usr/bin/env bash
# shellcheck disable=SC1091,SC2164

## @file
# EFI build script for the UX481FA/UX481FL
#
# Copyright (c) 2023, Cory Bennett. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
##

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."

export OCEBUILD_VERSION="${OCEBUILD_VERSION:-v0.2.0}"
source_url="https://raw.githubusercontent.com/Qonfused/OCE-Build"

curl -fsSL "$source_url/$OCEBUILD_VERSION/ci/bootstrap.sh" \
  | bash -s build --cwd src --out ../dist "$@"
