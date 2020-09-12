export ZSH=$HOME/.oh-my-zsh

HISTSIZE=10000000
SAVEHIST=10000000
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY

ZSH_THEME="shellder"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"
HYPHEN_INSENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  colored-man-pages
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source ~/.workrc
source ~/.fzf.zsh

alias vim="nvim"
alias cat="bat --theme='Solarized (light)'"
alias ll="exa -la"
alias ch="cat /dev/null > ~/.zsh_history"
alias weather="curl https://wttr.in/"
