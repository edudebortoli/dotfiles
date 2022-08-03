set fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end
export PATH="$PATH":"$HOME/.pub-cache/bin"

alias ll="exa --long --header --icons $args"

alias g="git $args" 
