import html
import re
import sys
from pathlib import Path

tasks = Path(sys.argv[1]).read_text(encoding="utf-8")
tests = Path(sys.argv[2]).read_text(encoding="utf-8")
dest = Path(sys.argv[3])
todo = tasks.split("ToDo Tasks:", 1)[1].split("Done Tasks:", 1)[0].strip()
done = tasks.split("Done Tasks:", 1)[1].strip()
contents = dest.read_text(encoding="utf-8")
for name, value in [("todo", todo), ("done", done), ("tests", tests)]:
    pattern = rf'(<pre id="{name}">).*?(</pre>)'
    contents, count = re.subn(
        pattern, lambda m: m.group(1) + html.escape(value) + m.group(2),
        contents, flags=re.S)
    if count != 1:
        raise RuntimeError(f"Missing or duplicated HTML placeholder: {name}")
dest.write_text(contents, encoding="utf-8")
