export EDITOR=nvim
export PATH=$HOME/.local/bin:/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH:/usr/local/bin:/usr/local/sbin:/usr/local/go/bin:./node_modules/.bin:$HOME/.docker/bin

source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/share/zsh-you-should-use/you-should-use.plugin.zsh

# Aliases
alias ls='eza --group-directories-first --icons --color=always'
alias tree='ls --tree'
alias lt='ls --tree --level 2'
alias lt3='ls --tree --level 3'
alias lt4='ls --tree --level 4'
alias ll='ls -alh'
alias la='ls -la'
alias reload='source ~/.zshrc'
alias cd='z'
alias cat='bat'
alias rm='trash'
alias v='vim'
alias n='nvim'
alias ff='fzf --preview "bat --style=numbers --color=always {}"'
alias fo='fzf --preview "bat --style=numbers --color=always {}" --bind "enter:execute(NVIM_APPNAM=LazyVim nvim {})"'
alias lg='lazygit'
alias df='echo "Using duf instead of df..." && duf'

# homebrew
export HOMEBREW_NO_REQUIRE_TAP_TRUST=1


# when changing directories immediately run an ls
autoload -U add-zsh-hook
_chpwd_auto_ls() {
  ls
}
add-zsh-hook chpwd _chpwd_auto_ls

# Configuration

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zoxide
eval "$(zoxide init zsh)"

# starship
eval "$(starship init zsh)"

#mise
eval "$(mise activate zsh)"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/jason/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# opencode
export PATH=/Users/jason/.opencode/bin:$PATH
