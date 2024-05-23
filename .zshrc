export ZSH=~/.oh-my-zsh
# disable oh-my-zsh themes for pure prompt
ZSH_THEME=""
alias lg="lazygit"
alias cppcompile="g++ -std=c++14"
alias g="git"
alias zed="open -a /Applications/Zed.app -n"
source $ZSH/oh-my-zsh.sh
export ZPLUG_HOME=$(brew --prefix)/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug "mafredri/zsh-async", from:github
zplug "agkozak/zsh-z"
zplug load
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

eval $(thefuck --alias)
eval "$(starship init zsh)"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
