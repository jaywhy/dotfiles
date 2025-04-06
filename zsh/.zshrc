# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# Reload with omz reload
export EDITOR=nvim
export PATH=$HOME/.bin:$HOME/.local/bin:/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH:/usr/local/bin:/usr/local/sbin:/usr/local/go/bin:./node_modules/.bin:/Users/jason/Library/Application\ Support/JetBrains/Toolbox/scripts:$HOME/.docker/bin
export PATH="$PATH:/Users/jason/.modular/bin"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME=""

plugins=(
  bundler colored-man-pages git mix ruby rails you-should-use zsh-syntax-highlighting zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias ls='eza --group-directories-first --icons --color=always'
alias tree='ls --tree'
alias lt='ls --tree --level 2'
alias lt3='ls --tree --level 3'
alias lt4='ls --tree --level 4'
alias ll='ls -alh'
alias la='ls -la'
alias j='z'
alias cd='z'
alias cat='bat'
alias rm='trash'
alias v='vim'
alias n='nvim'
alias qc='q chat'
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

#mise
eval "$(mise activate zsh)"

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

fda() {
    local base_dir="${1:-/Users/jason}"
    local dir
    dir=$(fd --type d --exclude 'node_modules' . $base_dir | fzf --preview 'ls -la {}' --border)
    if [ -n "$dir" ]; then
        cd "$dir" || echo "Failed to navigate to $dir"
    else
        echo "No directory selected"
    fi
}

fds() {
    local base_dir="${1}"
    local dir
    dir=$(fd --type d --hidden --exclude 'node_modules' . $base_dir | fzf --preview 'ls -la {}' --border)
    if [ -n "$dir" ]; then
        echo "$dir"
    else
        echo "No directory selected"
    fi
}

fdc() {
    fda ~/code
}

fdo() {
    fda ~/OneDrive
}

fdv() {
    fda ~/OneDrive/NaturaLawn/File\ Cabinet/Vendors
}

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/jason/.lmstudio/bin"

# Added by Windsurf
export PATH="/Users/jason/.codeium/windsurf/bin:$PATH"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
