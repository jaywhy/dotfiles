# Reload with omz reload
export EDITOR=nvim
export PATH=$HOME/.bin:$HOME/.local/bin:/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH:/usr/local/bin:/usr/local/sbin:/usr/local/go/bin:./node_modules/.bin:/Users/jason/Library/Application\ Support/JetBrains/Toolbox/scripts:$HOME/.docker/bin

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(
    asdf bundler colored-man-pages git mix ruby rails vi-mode you-should-use zsh-syntax-highlighting zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias ls='eza --group-directories-first --color=always'
alias tree='ls --tree'
alias lt='ls --tree --level 2'
alias ll='ls -alh'
alias la='ls -la'
alias cd='z'
alias cat='bat'
alias rm='trash'
alias j='z'
alias v='vim'
alias n='nvim'
alias nvim='NVIM_APPNAME=LazyVim nvim'
alias ff='fzf --preview "bat --style=numbers --color=always {}"'
alias fo='fzf --preview "bat --style=numbers --color=always {}" --bind "enter:execute(NVIM_APPNAM=LazyVim nvim {})"'
alias lg='lazygit'

# Configuration

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zoxide
eval "$(zoxide init zsh)"

# starship
eval "$(starship init zsh)"

# eval "$(mise activate)"
#mise
# eval "$(/Users/jason/.local/bin/mise activate zsh)"
