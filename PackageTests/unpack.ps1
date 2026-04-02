$ErrorActionPreference = 'Stop'

# Purpose:
# This script extracts the most recently built Wally package into a clean local
# folder so you can inspect the final packaged file layout. Use it after build.ps1
# when you want to confirm what a consumer would effectively receive from the
# published package contents. It deletes any previous extraction to avoid stale
# files making the result misleading. Run this from the repo root with
# .\PackageTests\unpack.ps1

# Read the archive built by build.ps1.
$archivePath = Join-Path $PSScriptRoot 'vluxysf.tar.gz'
# Extract into a clean folder so you can inspect the packaged contents.
$unpackPath = Join-Path $PSScriptRoot 'unpacked'

if (-not (Test-Path $archivePath)) {
    throw "Package archive not found at $archivePath. Run build.ps1 first."
}

if (Test-Path $unpackPath) {
    # Remove the previous extraction so stale files do not hang around.
    Remove-Item $unpackPath -Recurse -Force
}

New-Item -ItemType Directory -Path $unpackPath -Force | Out-Null
# Unpack the generated tar.gz so its file layout can be inspected.
tar -xf $archivePath -C $unpackPath