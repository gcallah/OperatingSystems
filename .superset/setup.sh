#!/usr/bin/env bash
# Superset workspace setup: runs once in the new worktree.
set -euo pipefail
cd "${SUPERSET_WORKSPACE_PATH:-$(git rev-parse --show-toplevel)}"
. .superset/lib.sh
ROOT="${SUPERSET_ROOT_PATH:-}"

# 1. "Dependencies": the utils submodule (non-fatal if offline).
git submodule update --init utils || echo "warn: could not init utils submodule (offline?)"

# 2. Copy untracked env/secret files from the main checkout, never overwriting.
if [ -n "$ROOT" ] && [ -d "$ROOT" ]; then
  for f in "$ROOT"/.env "$ROOT"/.env.* "$ROOT"/.superset/config.local.json; do
    [ -f "$f" ] || continue
    rel="${f#"$ROOT"/}"
    [ -e "$rel" ] || { cp "$f" "$rel" && echo "copied $rel"; }
  done
fi

# 3. Reserve a per-workspace dev-server port (reused on re-run if still free).
if [ -f "$PORT_FILE" ] && ! port_in_use "$(cat "$PORT_FILE")"; then :; else
  pick_free_port > "$PORT_FILE"
fi
echo "Dev server port for this workspace: $(cat "$PORT_FILE")"
