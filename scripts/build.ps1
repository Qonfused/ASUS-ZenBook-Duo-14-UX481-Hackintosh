## @file
# EFI build script for the UX481FA/UX481FL
#
# Copyright (c) 2023, Cory Bennett. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
##

[CmdletBinding(PositionalBinding=$false)]
param (
  [parameter(ValueFromRemainingArguments)][string[]]$arguments
)

$ErrorActionPreference = 'Stop'
$previousVersion = $env:OCEBUILD_VERSION

Push-Location (Join-Path $PSScriptRoot '..')
try {
  $env:OCEBUILD_VERSION = if ($previousVersion) {
    $previousVersion
  } else {
    'v0.2.0'
  }
  $sourceUrl = 'https://raw.githubusercontent.com/Qonfused/OCE-Build'
  $bootstrap = Invoke-RestMethod `
    -Uri "$sourceUrl/$env:OCEBUILD_VERSION/ci/bootstrap.ps1"
  $buildArguments = @('build', '--cwd', 'src', '--out', '../dist') + $arguments
  & ([ScriptBlock]::Create($bootstrap)) @buildArguments
} finally {
  Pop-Location
  $env:OCEBUILD_VERSION = $previousVersion
}
