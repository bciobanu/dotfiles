export PATH="/Library/TeX/texbin:$PATH"
export ZSH=$HOME/.oh-my-zsh

HISTSIZE=10000000
SAVEHIST=10000000
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY

ZSH_THEME="shellder"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"
HYPHEN_INSENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

source $ZSH/oh-my-zsh.sh
source $HOME/.cargo/env
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

plugins=(
  colored-man-pages
  tmux
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source ~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

alias vim="nvim"
alias cat="bat"
alias ll="exa -la"
alias ch="cat /dev/null > ~/.zsh_history"
alias hgrep="history -fd 0 | grep"
alias weather="curl https://wttr.in/"
alias vimrc="vim ~/.config/nvim/init.vim"
alias zshrc="vim ~/.zshrc"
