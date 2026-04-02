$ErrorActionPreference = 'Stop'

# Purpose:
# This script is the full package test shortcut. It rebuilds the Wally archive
# and then immediately unpacks it so the extracted folder always reflects the
# current project state. Use it when you have changed package contents and want
# one command that refreshes both the tarball and the inspection folder.
# Run this from the repo root with .\PackageTests\refresh.ps1

$scriptRoot = $PSScriptRoot

# Rebuild the package archive first.
& (Join-Path $scriptRoot 'build.ps1')
# Then unpack it so the latest package contents are ready to inspect.
& (Join-Path $scriptRoot 'unpack.ps1')