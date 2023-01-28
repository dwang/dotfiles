function zle-line-init() {
    echoti smkx
}
function zle-line-finish() {
    echoti rmkx
}

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

zle -N zle-line-init
zle -N zle-line-finish
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey -e

bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "${terminfo[kcbt]}" reverse-menu-complete
