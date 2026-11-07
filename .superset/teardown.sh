#!/usr/bin/env bash
# Superset teardown: stop the dev server started by run.sh and release the port.
cd "${SUPERSET_WORKSPACE_PATH:-$(git rev-parse --show-toplevel)}" || exit 0
. .superset/lib.sh
if [ -f "$PID_FILE" ]; then
  pid="$(cat "$PID_FILE")"
  if kill -0 "$pid" 2>/dev/null && ps -p "$pid" -o command= | grep -q http.server; then
    kill "$pid" && echo "stopped dev server (pid $pid)"
  fi
fi
rm -f "$PID_FILE" "$PORT_FILE"
exit 0
