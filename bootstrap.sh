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

ln -Fvs $ABS_SCRIPT_DIR/bash/bash_profile ~/.bash_profile
ln -Fvs $ABS_SCRIPT_DIR/git/gitconfig ~/.gitconfig
ln -Fvs $ABS_SCRIPT_DIR/git-prompt.sh ~/.git-prompt.sh
ln -Fvs $ABS_SCRIPT_DIR/git-completion.bash ~/.git-completion.bash
ln -Fvs $ABS_SCRIPT_DIR/vim/vimrc ~/.vimrc
ln -Fvs $ABS_SCRIPT_DIR/tmux/tmux.conf ~/.tmux.conf

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install helpful utilities
brew install cmake
brew install csvkit
brew install direnv
brew install dos2unix
brew install htop
brew install hub
brew install iftop
brew install jq
brew install nmap
brew install npm
brew install telnet
brew install the_silver_searcher
brew install tmux
brew install unrar

# Fish Setup
mkdir -p ~/.config/fish/conf.d
mkdir -p ~/.config/powerline-shell
ln -Fvs $ABS_SCRIPT_DIR/fish/config.fish ~/.config/fish/config.fish
ln -Fvs $ABS_SCRIPT_DIR/fish/functions ~/.config/fish/functions

brew install fish
pip install powerline-shell
ln -Fvs $ABS_SCRIPT_DIR/fish/powerline-config.json ~/.config/powerline-shell/config.json

# Fish by default
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

# VIM settings
brew install macvim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install VIM plugins
vim +PluginInstall +GoInstallBinaries +qall

