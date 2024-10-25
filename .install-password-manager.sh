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
*)
    echo "unsupported OS"
    exit 1
    ;;
esac
