#!/bin/bash
set -euo pipefail
python3 /app/scripts/todo.py | tee /tmp/tasks.txt
python3 /app/scripts/todo-test.py 2>&1 | tee /tmp/tests.txt
bash /app/scripts/update_index.sh /tmp/tasks.txt /tmp/tests.txt
echo "Task manager HTML updated."
