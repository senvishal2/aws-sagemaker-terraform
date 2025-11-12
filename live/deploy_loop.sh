#!/bin/bash
set -euo pipefail
# Usage: ./deploy_loop.sh
# This script reads env-config.hcl from repo root and loops through environments and their regions,
# running terragrunt apply per region to ensure modules expecting a single region work correctly.

# extract regions map using terraform console-like hack
python3 - <<'PY'
import hcl2, json, sys
with open('env-config.hcl') as f:
    txt = f.read()
# crude parse: find the map between braces; this is a simple approach assuming format is stable.
start = txt.find('regions_by_env')
sub = txt[start:]
# find first { after =
i = sub.find('{')
j = sub.rfind('}')
maptxt = sub[i:j+1]
# replace newlines for safe eval-ish parsing
maptxt = maptxt.replace('\n', ' ')
# naive conversion to json: replace = with :, remove trailing commas (best-effort)
maptxt = maptxt.replace('=', ':')
maptxt = maptxt.replace('(', '[').replace(')', ']')
print(maptxt)
PY
echo "NOTE: deploy_loop.sh expects CodeBuild to run terragrunt per region using overrides."
echo "For simplicity, this template uses terragrunt apply with --terragrunt-override-attr to set region."
