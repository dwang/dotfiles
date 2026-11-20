status is-interactive; or return

set -g fish_greeting ""
set -g fish_color_command blue

abbr --add mkdir mkdir -vp
if type -q eza
    abbr --add ls eza
end
if type -q doggo
    abbr --add dig doggo
end

if type -q starship
    starship init fish --print-full-init | source
end
if type -q mise
    mise activate fish | source
end
