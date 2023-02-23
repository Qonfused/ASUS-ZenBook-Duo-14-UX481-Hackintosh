#!/usr/bin/env bash

## @file
# config.plist SMBIOS serial patch script.
#
# Copyright (c) 2023, Cory Bennett. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
##

__PWD__=$(pwd); cd "$(realpath $(dirname "${BASH_SOURCE[0]}"))"

source ./constants.sh

# Change CWD for imports
cd $__PWD__; cd "$(realpath $(dirname "${BASH_SOURCE[0]}"))/oc-build"

CONFIG="$__PWD__/$CONFIG"
SERIAL="$__PWD__/$SERIAL"
if [[ ! -f $SERIAL ]]; then exit 0; fi

source ./bin/yq/imports.sh
source ./lib/config.sh
source ./lib/constants.sh
source ./lib/macros.sh
source ./lib/plist.sh

TARGET=$BUILD_DIR/EFI/OC/config.plist


# Build each property specified in a config.yml file
$yq -o=props --unwrapScalar=false <<< "$(cat $SERIAL)" | while read ln; do
  # Skip over linebreaks or comments
  if [[ -z $ln || ${ln:0:1} == '#' ]]; then continue; fi

  # Parse macros and value types
  type=$(__trim__ $(sed 's/.*\"\(.*\)|.*/\1/' <<< "$ln"))
  case $type in
    Data) output="<data>$(__parse_type__ "$ln")</data>" ;;
    String) output="<string>$(__parse_type__ "$ln")</string>" ;;
  esac

  keys=$(__trim__ ${ln%%=*})
  replace_entries "$TARGET" "PlatformInfo.Generic.$keys" "$output"
done