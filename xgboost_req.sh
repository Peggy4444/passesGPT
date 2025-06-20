#!/usr/bin/env bash
set -euo pipefail

echo "Installing dice-ml==0.11 (no deps)…"
pip install dice-ml==0.11 --no-deps

echo "Installing raiutils==0.4.2…"
pip install raiutils==0.4.2

echo "Installing jsonschema==4.23.0…"
pip install jsonschema==4.23.0
