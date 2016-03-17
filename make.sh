#!/usr/bin/env bash

# Copyright (c) 2002-2016, Ross Smith II. MIT licensed.

set -e

set -xv

if [[ -n "$1" ]]; then
	target="$1"
else
	target=publish
fi

if [[ -n "$2" ]]; then
	FLAVOR=win64
	MAKENSIS_OPTS="/DINSTALL_IN_PROGRAMFILES64=1" 
else
	FLAVOR=win32
	MAKENSIS_OPTS="" 
fi

# FLAVOR=win64 MAKENSIS_OPTS="/DINSTALL_IN_PROGRAMFILES64=1" 
	
make ${target} FLAVOR=${FLAVOR} MAKENSIS_OPTS="${MAKENSIS_OPTS}" 
