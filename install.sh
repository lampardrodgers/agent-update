#!/usr/bin/env sh
set -eu

REPO_RAW_BASE="https://raw.githubusercontent.com/lampardrodgers/codex-update/main"
TARGET_DIR="${HOME}/.local/bin"

mkdir -p "${TARGET_DIR}"

SCRIPT_DIR=""
if [ -n "${0:-}" ] && [ -f "$0" ]; then
  SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
fi

install_bin() {
  bin_name="$1"
  target="${TARGET_DIR}/${bin_name}"

  if [ -n "${SCRIPT_DIR}" ] && [ -f "${SCRIPT_DIR}/${bin_name}" ]; then
    cp "${SCRIPT_DIR}/${bin_name}" "${target}"
  else
    curl -fsSL "${REPO_RAW_BASE}/${bin_name}" -o "${target}"
  fi

  chmod 755 "${target}"
  echo "Installed ${bin_name} to ${target}"
}

install_bin "agent-up"
install_bin "codex-up"

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
