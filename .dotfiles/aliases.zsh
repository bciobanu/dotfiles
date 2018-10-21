alias grep='rg --color=auto'
alias ll='exa -la --color=auto'
alias cat='bat'
alias zip='zip -9mr'
alias gp='/Applications/PariGP.app/Contents/Resources/bin/gp'
alias subl='open -a /Applications/Sublime\ Text.app/'
alias vim='/usr/local/bin/vim'
alias ch='cat /dev/null > ~/.zsh_history'
export TIME_STYLE=long-iso
export BLOCK_SIZE="'1"

run() {
    NAME=_$(echo $1 | cut -f 1 -d '.')
    clang++ -g -std=c++17 -O2 -Wall -Wextra -Wfatal-errors -Wl,-stack_size,0xd0000000 -lm $1 -o $NAME
    time ./$NAME
}

alias reload='source ~/.zshrc'
alias netest='ping 8.8.8.8'
alias hgrep='history -fd 0 | grep'

alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"

alias e="exit"
alias h='history -fd -500'

analyze_history(){
    cut -f2 -d";" ~/.zsh_history | sort | uniq -c | sort -nr | head -n 30
}
analyze_commands(){
    cut -f2 -d";" ~/.zsh_history | cut -d' ' -f1 | sort | uniq -c | sort -nr | head -n 30
}

alias -s log=less
alias -s html=open
