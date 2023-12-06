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

# Run build script
curl -sL https://raw.githubusercontent.com/Qonfused/OCE-Build/main/ci/bootstrap.sh \
  | bash -s build "$@"
