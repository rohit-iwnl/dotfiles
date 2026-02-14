if status is-interactive
    # Commands to run in interactive sessions can go here
    # # vi key bindings
    fish_vi_key_bindings

    set -gx EDITOR nvim

    # homebrew
    if test -f /opt/homebrew/bin/brew
        eval "$(/opt/homebrew/bin/brew shellenv)"
    end

    # fnm (node version manager)
    if type -q fnm
        fnm env --use-on-cd --shell fish | source
    end

    # bun
    set --export BUN_INSTALL "$HOME/.bun"
    set --export PATH $BUN_INSTALL/bin $PATH

    #tmuxifier
    set -gx PATH "$HOME/.tmux/plugins/tmuxifier/bin" $PATH

    if type -q starship
        starship init fish | source
    end

    if type -q zoxide
        zoxide init fish | source
    end

    if type -q fnm
        fnm env --use-on-cd --shell fish | source
    end

    if type -q tmuxifier
        eval (tmuxifier init - fish)
    end

end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
