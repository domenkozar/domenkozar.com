#!/usr/bin/env bash

set -euo pipefail

if ! command -v rst2html >/dev/null 2>&1; then
  python3 -m pip install --user "docutils==0.21.2" "Pygments==2.19.2"
  python_user_bin="$(python3 -m site --user-base)/bin"
  export PATH="${python_user_bin}:${PATH}"
fi

exec hugo --cleanDestinationDir --panicOnWarning "$@"
