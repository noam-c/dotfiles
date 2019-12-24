# Remove welcome message
set fish_greeting

# Use clang instead of g++ for C/C++
set -x CC clang
set -x CXX clang++

# More thorough ls by default
alias ls "ls -ahlrt"

# Alias hub as git
hub alias -s | source

# Set up direnv for directory-specific environment variables
direnv hook fish | source
