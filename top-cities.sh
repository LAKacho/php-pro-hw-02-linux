#!/usr/bin/env bash
set -euo pipefail

file="${1:-users.txt}"

if [[ ! -r $file ]]; then
  echo "Cannot read: $file" >&2
  exit 1
fi

awk 'NR > 1 && NF >= 4 { count[$3]++ } END { for (city in count) print count[city], city }' "$file" \
  | sort -k1,1nr -k2,2 \
  | head -n 3
