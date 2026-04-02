$ErrorActionPreference = 'Stop'

# Purpose:
# This script creates the packaged Wally archive for the current project state.
# Use it when you want to produce the same tar.gz payload Wally would publish to
# the registry, so you can inspect it, keep it as a test artifact, or hand it
# off to another script. It only builds the archive and does not extract it.
# Run this from the repo root with .\PackageTests\build.ps1

# Run from the repo root so Wally reads the local wally.toml.
$workspaceRoot = Split-Path -Parent $PSScriptRoot
# Build the publishable archive into PackageTests.
$archivePath = Join-Path $PSScriptRoot 'vluxysf.tar.gz'

Push-Location $workspaceRoot
try {
    # Create the same tarball Wally would publish from this project.
    wally package --output $archivePath
}
finally {
    Pop-Location
}