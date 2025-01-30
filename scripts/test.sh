#!/bin/sh

script=$(readlink -f "$0")
root=$(dirname "$script")
cd "$root/.."

exec xpanes -s -c "meson test -C build-v{} $@" {3..7}
