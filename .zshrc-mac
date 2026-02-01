# ----------------------------------------------
# POWERLEVEL10K
# ----------------------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ----------------------------------------------
# FUNCTION
# ----------------------------------------------
fcd() {
    local dir
    dir=$(find ${1:-.} -type d -not -path '*/\.*' 2> /dev/null | fzf +m) && cd "$dir"
}

# ----------------------------------------------
# PATHS
# ----------------------------------------------
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export PATH="$PATH:$HOME/Library/Android/sdk/cmdline-tools/latest/bin"

# ----------------------------------------------
# THEMES
# ----------------------------------------------
ZSH_THEME="powerlevel10k/powerlevel10k"

# ----------------------------------------------
# PLUGINS
# ----------------------------------------------
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

# ----------------------------------------------
# SOURCE
# ----------------------------------------------
source $ZSH/oh-my-zsh.sh

# ----------------------------------------------
# # CONFIG
# ----------------------------------------------
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
  else
    export EDITOR='nvim'
  fi

# ----------------------------------------------
# ALIASES
# ----------------------------------------------
alias zrc="nvim ~/.zshrc"
alias ..='cd ..'
alias ...='cd ../..'

# ----------------------------------------------
# INITIALIZATION
# ----------------------------------------------
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init zsh)"

# ----------------------------------------------
# NVM SETUP
# ----------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ----------------------------------------------

