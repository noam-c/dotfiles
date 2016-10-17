#!/bin/sh

# Copy bash defaults and git prompt
cp ./.bash_profile ~/
cp ./.git-prompt.sh ~/
cp ./.git-completion.bash ~/

# Copy git settings
cp ./.gitconfig ~/

# VIM settings
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ./.vimrc ~/
vim +PluginInstall +qall

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install tmux
brew install tmux
cp ./.tmux.conf ~/
