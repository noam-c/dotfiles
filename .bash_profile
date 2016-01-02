# Make prompt more git-friendly
source ~/.git-completion.bash
source ~/.git-prompt.sh

# More thorough ls by default
alias ls="ls -ahl"

export PS1='C:/\w/$(__git_ps1 " [%s]")> ' # ;)
