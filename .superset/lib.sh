# Shared helpers for Superset lifecycle scripts (sourced, not executed).
PORT_FILE=".superset/.port"
PID_FILE=".superset/.server.pid"

port_in_use() { lsof -nP -iTCP:"$1" -sTCP:LISTEN >/dev/null 2>&1; }

# Pick a free port in 8000-8999, starting from a hash of the workspace name
# so each workspace tends to get the same, distinct port.
pick_free_port() {
  local name="${SUPERSET_WORKSPACE_NAME:-$(basename "$PWD")}"
  local start=$(( 8000 + $(printf '%s' "$name" | cksum | cut -d' ' -f1) % 1000 ))
  local i p
  for i in $(seq 0 999); do
    p=$(( 8000 + (start - 8000 + i) % 1000 ))
    port_in_use "$p" || { echo "$p"; return 0; }
  done
  echo "No free port in 8000-8999" >&2; return 1
}
