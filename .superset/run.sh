#!/usr/bin/env bash
# Superset run: serve the static site on this workspace's port.
set -euo pipefail
cd "${SUPERSET_WORKSPACE_PATH:-$(git rev-parse --show-toplevel)}"
. .superset/lib.sh

PORT="$(cat "$PORT_FILE" 2>/dev/null || true)"
if [ -z "$PORT" ] || port_in_use "$PORT"; then
  PORT="$(pick_free_port)"; echo "$PORT" > "$PORT_FILE"
fi
echo "$$" > "$PID_FILE"
echo "Serving on http://localhost:$PORT/"
exec python3 -m http.server "$PORT" --bind 127.0.0.1
