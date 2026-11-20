set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state

set -gx EDITOR code --wait

set -gx PYTHON_HISTORY $XDG_STATE_HOME/python/history
set -gx SSH_AUTH_SOCK ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

set -gx HOMEBREW_PREFIX /opt/homebrew
set -gx HOMEBREW_CELLAR /opt/homebrew/Cellar
set -gx HOMEBREW_REPOSITORY /opt/homebrew
fish_add_path -gmP /opt/homebrew/bin /opt/homebrew/sbin
if test -n "$MANPATH"
    set -gx MANPATH (string replace -r '^:*(.*?):*$' ':$1' -- "$MANPATH")
end
if not set -q INFOPATH
    set -gx INFOPATH /opt/homebrew/share/info ''
else if not contains /opt/homebrew/share/info $INFOPATH
    set -gx INFOPATH /opt/homebrew/share/info $INFOPATH
end

set -gx MISE_FISH_AUTO_ACTIVATE 0
if not status is-interactive; and test -d $XDG_DATA_HOME/mise/shims
    fish_add_path -gP $XDG_DATA_HOME/mise/shims
end
