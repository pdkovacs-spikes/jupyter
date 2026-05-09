#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

uv venv
uv pip install -r requirements.txt
