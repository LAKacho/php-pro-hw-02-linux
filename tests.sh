#!/usr/bin/env bash
set -euo pipefail

[[ $(./sum.sh 1.5 -7) == '-5.5' ]]
[[ $(./sum.sh -0.25 .5) == '0.25' ]]
if ./sum.sh nope 1 >/dev/null 2>&1; then
  exit 1
fi
[[ $(./top-cities.sh users.txt | head -n 1) == '3 Moscow' ]]
echo 'All tests passed'
