#!/bin/bash
set -euo pipefail
WORKSPACE="${GITHUB_WORKSPACE:-/workspace}"
FILE="${FILE:-solo-practicals/lecture3/data.txt}"
RESULTS="$(python3 /app/scripts/frequency.py "$WORKSPACE/$FILE")"
bash /app/scripts/update_readme.sh "$RESULTS" "${GITHUB_USER:-local-user}" "$WORKSPACE/solo-practicals/lecture3/README.md"
echo "Vowel analysis: $RESULTS"
