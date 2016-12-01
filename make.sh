#!/usr/bin/env bash

# Copyright (c) 2002-2016, Ross Smith II. MIT licensed.

set -e

if [[ ! "$1" =~ win(32|64) ]]; then
	echo "$0: Usage: $0 [win32 | win64] target(s)"
	exit 1
fi

FLAVOR=$1
shift

if [[ -n "$1" ]]; then
	target="$*"
else
	target=publish
fi

make ${target} FLAVOR=${FLAVOR}
