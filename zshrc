export EDITOR=vim
export PATH=$HOME/.bin:$HOME/.local/bin:/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH:/usr/local/bin:/usr/local/sbin:/usr/local/go/bin:./node_modules/.bin

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(
    asdf autojump colored-man-pages vi-mode zsh-syntax-highlighting zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias ls='exa --group-directories-first --color=always'
alias la='ls -la'
alias rm='trash'
alias v='vim'
alias n='nvim'

# Configuration

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# starship
eval "$(starship init zsh)"
