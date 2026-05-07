#!/usr/bin/env sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
SOURCE="${SCRIPT_DIR}/codex-up"
TARGET_DIR="${HOME}/.local/bin"
TARGET="${TARGET_DIR}/codex-up"

mkdir -p "${TARGET_DIR}"
cp "${SOURCE}" "${TARGET}"
chmod 755 "${TARGET}"

case ":${PATH}:" in
  *":${TARGET_DIR}:"*) ;;
  *)
    echo "Installed codex-up to ${TARGET}"
    echo
    echo "Add this to your shell config if codex-up is not found:"
    echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
    exit 0
    ;;
esac

echo "Installed codex-up to ${TARGET}"
echo "Run it with: codex-up"
