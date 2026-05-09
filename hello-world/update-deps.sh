#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

# Strip version pins to get package names, upgrade each to latest, then freeze.
packages=$(sed -E 's/[[:space:]]*([#;].*)?$//; s/([<>=!~]=?|===).*$//' requirements.txt | grep -v '^$')

uv venv
# shellcheck disable=SC2086
uv pip install --upgrade $packages
uv pip freeze > requirements.txt
