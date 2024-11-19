export ZSH=~/.oh-my-zsh
# disable oh-my-zsh themes for pure prompt
ZSH_THEME=""
alias zlj='zellij'
alias lg="lazygit"
alias tload="tmuxifier load-session"
alias tkill="tmux kill-server"
alias cppc="g++ -std=c++14"
alias vim="nvim"
alias g="git"
alias gc="git commit -m"
alias leet="nvim leetcode.nvim"
alias gs="git status"
alias neo="neofetch"
alias ga="git add"
alias zed="open -a /Applications/Zed.app -n"
alias cat="bat"
alias ls="lsd"
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

eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function cpp-run() {
    if [ $# -eq 0 ]; then
        echo "Usage: cpp-run <cpp_file>"
        return 1
    fi

    local cpp_file="$1"
    if [[ ! -f "$cpp_file" ]]; then
        echo "File not found: $cpp_file"
        return 1
    fi

    local output_file="${cpp_file%.*}"  # Remove extension to get output filename

    # Compile
    if ! g++ -o "$output_file" "$cpp_file"; then
        echo "Compilation failed."
        return 1
    fi

    # Run
    "./$output_file"
}
kitty-reload() {
    kill -SIGUSR1 $(pidof kitty)
}



# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.tmux/plugins/tmuxifier/bin:$PATH"
export PATH=$PATH:/opt/riscv/bin
export PATH="/opt/homebrew/Cellar/riscv-gnu-toolchain/main/bin:$PATH"
export EDITOR=nvim

eval "$(tmuxifier init -)"
export PATH="/opt/homebrew/opt/binutils/bin:$PATH"
