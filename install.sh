#!/usr/bin/env bash
set -euo pipefail
SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="${HOME}/.copilot/skills"
mkdir -p "$DEST"
for name in pr-approval-pack servicenow-cr-draft change-closure-report; do
  if [[ -e "$DEST/$name" ]]; then
    echo "Refusing overwrite: $DEST/$name" >&2
    echo "Review existing skill and remove/rename it explicitly before reinstalling." >&2
    exit 1
  fi
done
for name in pr-approval-pack servicenow-cr-draft change-closure-report; do
  cp -R "$SOURCE_DIR/skills/$name" "$DEST/$name"
  echo "Installed: $DEST/$name"
done
echo "No workspaces, repositories, CI pipelines, or ServiceNow records were changed."
