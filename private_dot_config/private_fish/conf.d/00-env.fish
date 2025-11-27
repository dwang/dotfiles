set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state

set -gx EDITOR code --wait

set -gx PYTHON_HISTORY $XDG_STATE_HOME/python/history
set -gx SSH_AUTH_SOCK ~/.bitwarden-ssh-agent.sock
