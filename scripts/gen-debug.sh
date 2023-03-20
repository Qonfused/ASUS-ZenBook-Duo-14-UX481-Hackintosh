#!/usr/bin/env bash

## @file
# Debug logging script for the UX481FA/UX481FL
#
# Copyright (c) 2023, Cory Bennett. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
##

__PWD__=$(pwd); cd "$(realpath $(dirname "${BASH_SOURCE[0]}"))"

# Prepare /tmp/debug/ directory
cd /tmp/ && rm -fr debug/ >/dev/null 2>&1 && mkdir debug/ && cd debug/


################################################################################
#                           Dump Kernel and System logs                        #
################################################################################

mkdir logs/
dbg() {
  predicate="process == \"$1\""; if [[ -n $2 ]]; then predicate+=" AND $2"; fi
  /usr/bin/log show --last boot \
    --info --debug --predicate "$predicate" \
    --style syslog \
    --source \
    | grep -vE "<compose failure \[UUID\]>$"
}

mkdir logs/kernel/
kernel_dbg() { dbg 'kernel' "senderImagePath CONTAINS \"$1\"" > logs/kernel/$1.log; }

# Log ACPI error messages
kernel_dbg 'AppleACPIPlatform' &
# Log driver messages
kernel_dbg 'AppleIntelCFLGraphicsFramebuffer' &
kernel_dbg 'AppleGraphicsDevicePolicy' &
# Generate source kernel log
dbg 'kernel' > logs/kernel/boot.log; wait

# Copy displaypolicy log files
cp -a /var/log/displaypolicy logs/
# Copy system log
cp /var/log/system.log logs/system.log

################################################################################
#                            Dump diagnostics output                           #
################################################################################

run_exec() { exec="$1"; echo "Executing $exec ..."$'\n\n'"$($exec)"; }

# Dump nvram as plist
/usr/sbin/nvram -x -p > nvram.plist
# Dump systemprofiler as plist
/usr/sbin/system_profiler -xml > sysprof.plist 2>&1

# Run system diagnostic tools
SLE="/System/Library/Extensions"
run_exec $SLE/IOGraphicsFamily.kext/iogdiagnose > logs/iogdiagnose.log
run_exec $SLE/AppleGraphicsControl.kext/Contents/MacOS/AGDCDiagnose > logs/agdcdiagnose.log

################################################################################
#                       Dump IO Registry planes and devices                    #
################################################################################

# Log separate IO registry planes to text and provide source ioreg file
mkdir -p ioreg/devices
run_exec '/usr/sbin/ioreg -lw0' > ioreg/IOServicePlane.txt
run_exec '/usr/sbin/ioreg -lw0 -p IOACPIPlane' > ioreg/IOACPIPlane.txt
run_exec '/usr/sbin/ioreg -rxn IGPU@2' > 'ioreg/devices/IGPU@2.txt'


zip -r -X "$__PWD__/debug.zip" $PWD/ > /dev/null 2>&1