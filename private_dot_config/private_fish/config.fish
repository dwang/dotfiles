status is-interactive; or return

set -g fish_greeting ""
set -g fish_color_command blue

if type -q mise
    mise activate fish | source
end

for plugin in $__fish_config_dir/plugins/*
    if test -d $plugin/functions
        set -p fish_function_path $plugin/functions
    end
    if test -d $plugin/completions
        set -p fish_complete_path $plugin/completions
    end
    for file in $plugin/conf.d/*.fish
        source $file
    end
end

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
