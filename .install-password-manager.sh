#!/usr/bin/env bash

type op >/dev/null 2>&1 && exit

install_homebrew() {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
}

case "$(uname -s)" in
Darwin)
    type brew >/dev/null 2>&1 || install_homebrew
    brew install --cask 1password 1password-cli
    ;;
Linux)
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
    sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" | \
    sudo tee /etc/apt/sources.list.d/1password.list && \
    sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/ && \
    curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | \
    sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol && \
    sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22 && \
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
    sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg && \
    sudo apt update && sudo apt install 1password 1password-cli
    ;;
*)
    echo "unsupported OS"
    exit 1
    ;;
esac
