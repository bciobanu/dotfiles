export ZSH=$HOME/.oh-my-zsh

HYPHEN_INSENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

ZSH_THEME="agnoster"

plugins=(
  tmux
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source $HOME/.cargo/env

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias vim="nvim"
alias cat="bat"
alias ll="exa -la --color=auto"
alias ch="cat /dev/null > ~/.zsh_history"
alias hgrep="history -fd 0 | grep"
alias weather="curl https://wttr.in/"
alias vimrc="vim ~/.config/nvim/init.vim"
alias zshrc="vim ~/.zshrc"
