#!/bin/bash
set -euo pipefail
RESULTS="$1"
ACTOR="$2"
DEST="$3"
{
  echo ""
  echo "### Analysis"
  echo "Contributor: $ACTOR"
  echo "Vowel counts: $RESULTS"
  echo "Timestamp (UTC): $(date -u '+%Y-%m-%d %H:%M:%S')"
} >> "$DEST"
