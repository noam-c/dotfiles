#!/bin/sh

mkdir -p ~/dotfiles_old

backup_old() {
	[ -e $1 ]  && cp $1 ~/dotfiles_old/
}

backup_old ~/.bash_profile
backup_old ~/.gitconfig
backup_old ~/.tmux.conf
backup_old ~/.vimrc

# Directory for all machine-specific scripts
mkdir ~/machine

# Directory for SSH keys
mkdir ~/.ssh

SCRIPT_DIR=$(dirname "$0")
ABS_SCRIPT_DIR=$(cd $SCRIPT_DIR; pwd)

ln -Fvs $ABS_SCRIPT_DIR/bash_profile ~/.bash_profile
ln -Fvs $ABS_SCRIPT_DIR/gitconfig ~/.gitconfig
ln -Fvs $ABS_SCRIPT_DIR/vimrc ~/.vimrc
ln -Fvs $ABS_SCRIPT_DIR/tmux.conf ~/.tmux.conf

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install helpful utilities
brew install cmake
brew install dos2unix
brew install htop
brew install hub
brew install iftop
brew install jq
brew install nmap
brew install npm
brew install telnet
brew install tmux
brew install unrar

# VIM settings
brew install macvim --with-override-system-vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cp ./git-prompt.sh ~/.git-prompt.sh
cp ./git-completion.bash ~/.git-completion.bash

# Install VIM plugins
vim +PluginInstall +qall

pushd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --tern-completer
