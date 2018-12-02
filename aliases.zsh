alias grep='rg --color=auto'
alias ll='exa -la --color=auto'
alias cat='bat'
alias zip='zip -9mr'
alias gp='/Applications/PariGP.app/Contents/Resources/bin/gp'
alias subl='open -a /Applications/Sublime\ Text.app/'
alias vim='/usr/local/bin/nvim'
alias ch='cat /dev/null > ~/.zsh_history'
export TIME_STYLE=long-iso
export BLOCK_SIZE="'1"

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

# C++ single file compilation
get_name() {
  echo _$(echo $1 | cut -f 1 -d '.')
}

safe_compile() {
  clang++ -pipe -g -std=c++17 -Wall -Wextra -Wfloat-equal -Wfatal-errors \
     -Wdisabled-optimization -D_GLIBCXX_ASSERTIONS -D_FORTIFY_SOURCE=2 \
     -fasynchronous-unwind-tables -fstack-protector -fstack-protector-strong \
     -fexceptions -fsanitize=undefined,address -fno-omit-frame-pointer -fpie \
     -Wl,-pie -Werror=format-security \
     -Wl,-stack_size,0xd0000000 -lm $1 -o $(get_name $1)
}

debug() {
  safe_compile $1
  lldb ./$(get_name $1)
}

safe_run() {
  safe_compiler $1
  ./$(get_name $1)
}

run() {
  clang++ -g -std=c++17 -O2 -Wall -Wextra -Wfatal-errors -Wl,-stack_size,0xd0000000 -lm $1 -o $(get_name $1)
  time ./$(get_name $1)
}

alias -s log=less
alias -s html=open
