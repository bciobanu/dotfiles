# Make core utils better
alias grep='grep --color=auto'
alias ls='exa -laT'
alias ll='exa -la'
alias cat='bat'
export TIME_STYLE=long-iso # makes YYYY-MM-DD in the ls output
export BLOCK_SIZE="'1" # makes 1,000,000 for big sizes

# Common commands
alias reload='source ~/.zshrc'
alias netest='ping 8.8.8.8'
alias hgrep='history -fd 0 | grep'

# Important files
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"

# Shorthands
alias e="exit"
alias h='history -fd -500'
alias subl="open -a /Applications/Sublime\ Text.app/"
alias gp="/Applications/PariGP.app/Contents/Resources/bin/gp"

run() {
    SOURCE=_$(echo $1 | cut -f 1 -d '.')
    clang++ -std=c++17 -O2 -Wall -Wextra -Wfatal-errors $1 -o $SOURCE -lm
    time ./$SOURCE
}

# Analyze history data
analyze_history(){
    cut -f2 -d";" ~/.zsh_history | sort | uniq -c | sort -nr | head -n 30
}
analyze_commands(){
    cut -f2 -d";" ~/.zsh_history | cut -d' ' -f1 | sort | uniq -c | sort -nr | head -n 30
}

# Suffix aliases
alias -s log=less
alias -s html=open
