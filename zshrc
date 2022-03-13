export EDITOR=vim
export PATH=$PATH:$HOME/.bin:$HOME/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/usr/local/go/bin:./node_modules/.bin

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(
    git colored-man-pages zsh-syntax-highlighting zsh-autosuggestions colorize dirhistory
)

####################################################
# Aliases
####################################################

alias ..='cd ..'
alias ...="cd ../.."
alias ....="cd ../../../"
alias .....="cd ../../../.."
alias l="ls -lAh"
alias ll="ls -l"
alias la='ls -A'
alias o='open'
alias rf='rmtrash'
alias v='vim'
alias vi='vim'

####################################################
# Configuration
####################################################

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
# Make some commands not show up in history
export HISTIGNORE="ls:ls *"

source $ZSH/oh-my-zsh.sh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd --type f"
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_ALT_C_COMMAND="fd -t d . $HOME"

# autojump
[ -f $(brew --prefix)/etc/profile.d/autojump.sh ] && . $(brew --prefix)/etc/profile.d/autojump.sh

# rbenv
# eval "$(rbenv init -)"

# Go
# export GOPATH="$HOME/code/go"

# flutter
# export PATH="$PATH:/Users/jason/code/flutter/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh