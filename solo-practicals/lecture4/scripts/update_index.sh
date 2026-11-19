#!/bin/bash
set -euo pipefail
TASK_OUTPUT="$1"
TEST_OUTPUT="$2"
WORKSPACE="${GITHUB_WORKSPACE:-/workspace}"
python3 /app/scripts/update_index.py "$TASK_OUTPUT" "$TEST_OUTPUT" "$WORKSPACE/solo-practicals/lecture4/index.html"
