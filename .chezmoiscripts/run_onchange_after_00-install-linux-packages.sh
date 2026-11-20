#!/usr/bin/env bash
set -euo pipefail

SUDO=""
if [[ "${EUID:-$(id -u)}" -ne 0 ]]; then
  if command -v sudo >/dev/null 2>&1; then
    SUDO="sudo"
  else
    echo "Error: root privileges or sudo required to install system packages" >&2
    exit 1
  fi
fi

$SUDO apt-get update -qq
$SUDO env DEBIAN_FRONTEND=noninteractive apt-get install -y -qq ca-certificates curl fish git libatomic1 tmux vim

if ! command -v mise >/dev/null 2>&1; then
  $SUDO install -dm 755 /etc/apt/keyrings
  curl -fsSL https://mise.jdx.dev/gpg-key.pub | $SUDO tee /etc/apt/keyrings/mise-archive-keyring.asc >/dev/null
  $SUDO chmod 644 /etc/apt/keyrings/mise-archive-keyring.asc
  arch="$(dpkg --print-architecture)"
  printf 'deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.asc arch=%s] https://mise.jdx.dev/deb stable main\n' "$arch" | $SUDO tee /etc/apt/sources.list.d/mise.list >/dev/null
  $SUDO apt-get update -qq
  $SUDO env DEBIAN_FRONTEND=noninteractive apt-get install -y -qq mise
fi
