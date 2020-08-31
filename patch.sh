#!/usr/bin/env sh

set -euo pipefail
set -x
sha256sum -c sha256sums.txt
spk unpack sharelatex-old.spk

# Copy in assets from cdns:
cp -r cdn-vendor sharelatex-old/web/public/
cp -r cdn-vendor-patched sharelatex-old/web/public/

# Patch the stylesheets to point to the local copies of cdn assets.
cd sharelatex-old && patch -p1 < ../stylesheets.patch

# These will get re-created by spk pack:
rm -f sharelatex-old/sandstorm-manifest
rm -f sharelatex-old/sandstorm-http-bridge-config
