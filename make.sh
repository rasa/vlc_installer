#!/usr/bin/env bash

# Copyright (c) 2002-2015, Ross Smith II. MIT licensed.

set -e

set -xv

if [[ -n "$1" ]]; then
	target="$*"
else
	target=publish
fi

# build the 32-bit version: vlc_installer-x.y-win32.zip:
make ${target}

# remove Release/vlc_installer.exe as it uses the same name as the 64-bit installer
make clean

# build the 64-bit version: vlc_installer-x.y-win64.zip:
make FLAVOR=win64 MAKENSIS_OPTS="/DINSTALL_IN_PROGRAMFILES64=1" ${target}
