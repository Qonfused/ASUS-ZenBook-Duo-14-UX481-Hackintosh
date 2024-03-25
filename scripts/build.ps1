## @file
# EFI build script for the UX481FA/UX481FL
#
# Copyright (c) 2023, Cory Bennett. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
##

[CmdletBinding(PositionalBinding=$false)]
param (
  [string]$pwd = "$((Get-Item "$PSScriptRoot\..").FullName)",
  # Script arguments
  [parameter(ValueFromRemainingArguments)][string[]]$arguments
)

icm `
  -ScriptBlock $([Scriptblock]::Create($(iwr 'https://raw.githubusercontent.com/Qonfused/OCE-Build/main/ci/bootstrap.ps1'))) `
  -ArgumentList (@("build -c $pwd $patches") + $arguments)
