export EDITOR=nvim
export PATH=$HOME/.local/bin:/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH:/usr/local/bin:/usr/local/sbin:/usr/local/go/bin:./node_modules/.bin:$HOME/.docker/bin

# opencode
export PATH=/Users/jason/.opencode/bin:$PATH

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/jason/.lmstudio/bin"
# End of LM Studio CLI section

# homebrew
export HOMEBREW_NO_REQUIRE_TAP_TRUST=1

# zsh-defer: run non-essential init after the first prompt paints
# install: git clone https://github.com/romkatv/zsh-defer ~/.zsh-defer
source ~/.zsh-defer/zsh-defer.plugin.zsh

# ---------------------------------------------------------------------------
# Synchronous: prompt + anything likely to be the first command typed
# ---------------------------------------------------------------------------

# starship (deferring it would show a bare prompt that redraws)
eval "$(starship init zsh)"

# zoxide (`cd` is aliased to `z`, so `z` must exist immediately)
eval "$(zoxide init zsh)"

zstyle ':completion:*' menu select

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
alias ..='cd ..'
alias ...='cd ../..'
alias cat='bat'
alias rm='trash'
alias v='vim'
alias n='nvim'
alias y='yazi'
alias ff='fzf --preview "bat --style=numbers --color=always {}"'
alias fo='fzf --preview "bat --style=numbers --color=always {}" --bind "enter:execute(NVIM_APPNAM=LazyVim nvim {})"'
alias lg='lazygit'
alias df='echo "Using duf instead of df..." && duf'

# when changing directories immediately run an ls
autoload -U add-zsh-hook
_chpwd_auto_ls() {
  ls
}
add-zsh-hook chpwd _chpwd_auto_ls

# ---------------------------------------------------------------------------
# Deferred: everything below runs just after the first prompt is drawn.
# For ~50ms after the prompt appears, tab-completion / Ctrl-R / syntax
# highlighting aren't wired up yet.
# ---------------------------------------------------------------------------

# completions (+ Docker CLI completions dir)
zsh-defer -c 'fpath=(/Users/jason/.docker/completions $fpath); autoload -Uz compinit; compinit'

# mise
zsh-defer -c 'eval "$(mise activate zsh)"'

# atuin
zsh-defer -c 'eval "$(atuin init zsh)"'

# fzf
zsh-defer -c '[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh'

# zsh plugins from homebrew (syntax-highlighting must be sourced last)
zsh-defer source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
zsh-defer source $HOMEBREW_PREFIX/share/zsh-you-should-use/you-should-use.plugin.zsh
zsh-defer source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
