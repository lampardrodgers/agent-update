#!/usr/bin/env sh
set -eu

REPO_RAW_BASE="https://raw.githubusercontent.com/lampardrodgers/agent-update/main"
TARGET_DIR="${HOME}/.local/bin"
TARGET="${TARGET_DIR}/agent-up"

mkdir -p "${TARGET_DIR}"

SCRIPT_DIR=""
if [ -n "${0:-}" ] && [ -f "$0" ]; then
  SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
fi

if [ -n "${SCRIPT_DIR}" ] && [ -f "${SCRIPT_DIR}/agent-up" ]; then
  cp "${SCRIPT_DIR}/agent-up" "${TARGET}"
else
  curl -fsSL "${REPO_RAW_BASE}/agent-up" -o "${TARGET}"
fi

chmod 755 "${TARGET}"
echo "Installed agent-up to ${TARGET}"

case ":${PATH}:" in
  *":${TARGET_DIR}:"*)
    echo "Run it anywhere with: agent-up"
    ;;
  *)
    echo
    echo "Add this to your shell config (~/.zshrc or ~/.bashrc) if agent-up is not found:"
    echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
    ;;
esac
