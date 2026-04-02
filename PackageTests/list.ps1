$ErrorActionPreference = 'Stop'

# Purpose:
# This script previews the exact file list Wally would include if the package
# were built or published right now. Use it when you want to verify that your
# include/exclude rules in wally.toml are correct without rebuilding the archive.
# It does not modify the unpacked folder and is the fastest check before publish.
# Run this from the repo root with .\PackageTests\list.ps1

# Run from the repo root so Wally reads the local wally.toml.
$workspaceRoot = Split-Path -Parent $PSScriptRoot
# This output path is required even when using --list.
$archivePath = Join-Path $PSScriptRoot 'vluxysf.tar.gz'

Push-Location $workspaceRoot
try {
    # Print the exact files Wally would include in the package.
    wally package --list --output $archivePath
}
finally {
    Pop-Location
}