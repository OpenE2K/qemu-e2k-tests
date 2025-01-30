#!/bin/sh

script=$(readlink -f "$0")
root=$(dirname "$script")
cd "$root/.."

exec xpanes -s -c "meson setup --cross-file cross/e2k-v{}.txt --cross-file cross/e2k-linux.txt build-v{}" {3..7}
