# Powerlevel10k Instant Prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8

# Plugins
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
export ARCHFLAGS="-arch $(uname -m)"

# Settings
eval "$(zoxide init zsh)"
export CHROME_EXECUTABLE=/usr/bin/vivaldi

# Aliases
alias zshrc="nvim ~/.zshrc"
alias github="cd Documents/GitHub"
alias pomostudy="pomodoro 'study'"
alias pomowork="pomodoro 'work'"
alias pomobreak="pomodoro 'break'"

# Pomodoro Timer
declare -A pomo_options
pomo_options["study"]="30"
pomo_options["work"]="45"
pomo_options["break"]="10"

pomodoro () {
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
    val=$1
    echo $val | lolcat
    timer ${pomo_options["$val"]}m
    notify-send "Pomodoro" "'$val' session done"
  fi
}

