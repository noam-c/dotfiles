# Make prompt more git-friendly
source ~/.git-completion.bash
source ~/.git-prompt.sh

# Add machine-specific aliases (e.g. project directory names)
source ~/machine/aliases.sh

# Use clang instead of g++ for C/C++
export CC=clang
export CXX=clang++

# More thorough ls by default
alias ls="ls -ahlrt"
alias git="hub"

export PS1='C:/\w/$(__git_ps1 " [%s]")> ' # ;)

# Alias hub as git
eval "$(hub alias -s)"
