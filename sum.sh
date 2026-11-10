#!/usr/bin/env bash
set -euo pipefail

number='^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$'

if [[ $# -ne 2 || ! $1 =~ $number || ! $2 =~ $number ]]; then
  echo "Usage: $0 NUMBER NUMBER" >&2
  exit 1
fi

awk -v left="$1" -v right="$2" 'BEGIN { printf "%.15g\n", left + right }'
