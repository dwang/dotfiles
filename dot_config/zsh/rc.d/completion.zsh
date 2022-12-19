autoload -U compinit
mkdir -p "$XDG_CACHE_HOME/zsh"
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

zstyle ":completion:*" menu select
zstyle ":completion:*" list-colors ""
zstyle ":completion:*" matcher-list "r:|=*" "l:|=* r:|=*"
zstyle ":completion:*" matcher-list "m:{a-zA-Z-_}={A-Za-z_-}" "r:|=*" "l:|=* r:|=*"
zstyle ":completion:*" special-dirs true

setopt AUTO_MENU
setopt ALWAYS_TO_END
setopt COMPLETE_IN_WORD

