import json
import sys
from collections import Counter
from pathlib import Path

def count_vowels(path):
    text = Path(path).read_text(encoding="utf-8").lower()
    counts = Counter(ch for ch in text if ch in "aeiou")
    return {ch: counts[ch] for ch in "aeiou"}

if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit("Usage: frequency.py <data-file>")
    print(json.dumps(count_vowels(sys.argv[1])))
