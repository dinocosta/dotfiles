#!/bin/bash

# This is a script which should automate the fresh install of a new
# copy of MacOS. It installs and configures the machine to my own personal
# needs.

# -------------------------------------------------------------------------
# Helpers
# -------------------------------------------------------------------------
#
# This sections contains helper functions and variables to be used
# throughout the installer.
#
# -------------------------------------------------------------------------

# Colors definitions.
GREEN='\033[1;32m'
BLUE='\033[1;34m'
RED='\033[1;91m'
RESET='\033[0m'

# Dotfiles location.
DOTFILES=~/Developer/dotfiles

function pp {
  echo -e "$1[$SECTION]${RESET} $2"
}

function pp_info {
  pp $BLUE "$1"
}

function pp_success {
  pp $GREEN "$1"
}

function pp_error {
  pp $RED "$1"
}

function dirlink {
  (cd $HOME && ln -s "$DOTFILES/$1" "$2")
}

# Function to verify if a given app is already installed.
# If the app is not yet installed install it using the provided argument.
function install_app {
  if [ ! -d "/Applications/$1.app" ]; then
    pp_info "Installing $1..."
    eval $2
    pp_success "Succesfully installed $1."
  else
    pp_success "$1 is already installed."
  fi
}

# Increase key repetition speed. These changes will only take effect
# after logging out and back in.
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

# -------------------------------------------------------------------------
# Development
# -------------------------------------------------------------------------

SECTION="Development"

# Create developer folder.
pp_info "Setting up Developer directory..."
mkdir -p ~/Developer
pp_success "Developer directory succesfully created."

# Command line tools.
if [[ "$(xcode-select -p)" == "" ]]; then
  pp_info "Installing command line tools..."
  touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
  PROD=$(softwareupdate -l |
    grep "\*.*Command Line" |
    head -n 1 | awk -F"*" '{print $2}' |
    sed -e 's/^ *//' |
    tr -d '')
  softwareupdate -i "$PROD" -v;
  pp_success "Finished installing command line tools."
else
  pp_success "Command line tools already installed."
fi

# Brew/Homebrew.
# The `brew analytics off` prevents brew from gathering analytics.
if ! command -v brew > /dev/null 2>&1; then
	pp_info "Installing Brew..."
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew analytics off
	pp_success "Finished installing Brew."
else
	pp_success "Brew already installed"
fi

# Tmux.
if ! command -v tmux > /dev/null 2>&1; then
  pp_info "Installing TMUX..."
  brew install tmux
  pp_success "TMUX successfully installed."
else
  pp_success "TMUX already installed."
fi

# ZSH.
if [[ "$(which zsh)" != "/usr/local/bin/zsh" ]]; then
  pp_info "Installing ZSH..."
  brew install zsh
  pp_success "ZSH installed."
else
  pp_success "ZSH is already installed."
fi

# Python 2.7.
if [[ "$(which python)" != "/usr/local/bin/python" ]]; then
	pp_info "Installing system python 2.7 for NeoVim..."
	brew install python@2
	pp_success "Successfully installed Python 2.7."
else
	pp_success "Python 2.7 already installed."
fi

# Python 3.
if [[ "$(which python3)" != "/usr/local/bin/python3" ]]; then
	pp_info "Installing system python 3 for NeoVim..."
	brew install python
	pp_success "Successfully installed Python 3."
else
	pp_success "Python 3 already installed."
fi

# Alacritty.
if [ -d "/Applications/Alacrity.app" ]; then
	pp_info "Installing Alacritty..."
	brew cask install alacritty
	pp_success "Succesfully installed Alacritty."
else
	pp_success "Alacritty is already installed."
fi

# NeoVim.
if ! command -v nvim > /dev/null 2>&1; then
  pp_info "Installing NeoVim..."
	brew install neovim
  pip3 install neovim
  pp_success "NeoVim successfully installed."
else
  pp_success "NeoVim already installed."
fi

# Chunkwm.
if ! command -v chunkwm > /dev/null 2>&1; then
  pp_info "Installing chunkwm..."
  brew tap koekeishiya/formulae
  brew install chunkwm
  brew services start chunkwm
  pp_success "Successfully installed chunkwm."
else
  pp_success "chunkwm already installed."
fi

# skhd.
if ! command -v skhd > /dev/null 2>&1; then
  pp_info "Installing skhd..."
  brew install koekeishiya/formulae/skhd
  brew services start skhd
  pp_success "Successfully installed skhd."
else
  pp_success "skhd already installed."
fi


# Docker.
install_app "Docker" "brew cask install docker"

# Postman.
install_app "Postman" "brew cask install postman"

# asdf.
if ! command -v asdf > /dev/null 2>&1; then
  pp_info "Installing asdf..."
  brew install asdf
  pp_success "Successfully installed asdf."
else
  pp_success "asdf already installed."
fi

# oh-my-zsh.
if [ ! -d "$HOME/.oh-my-zsh" ]; then
	pp_info "Installing oh-my-zsh..."
  sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	pp_success "Succesfully installed oh-my-zsh."
else
	pp_success "oh-my-zsh is already installed."
fi

# virtualenvwrapper.
if ! command -v virtualenvwrapper > /dev/null 2>&1; then
  pp_info "Installing virtualenvwrapper..."
  pip install virtualenvwrapper
  pp_success "Successfully installed virtualenvwrapper."
else
  pp_success "virtualenvwrapper already installed."
fi

# Silver Searcher.
if ! command -v ag > /dev/null 2>&1; then
  pp_info "Installing The Silver Searcher/AG..."
  brew install the_silver_searcher
  pp_success "Successfully installed The Silver Searcher/AG."
else
  pp_success "The Silver Searcher/AG already installed."
fi

# Ctags.
if [[ "$(which ctags)" != "/usr/local/bin/ctags" ]]; then
  pp_info "Installing ctags..."
  brew install ctags
  pp_success "Successfully installed ctags."
else
  pp_success "ctags already installed."
fi


# -------------------------------------------------------------------------
# Configurations & Dotfiles
# -------------------------------------------------------------------------

SECTION="Configuration"

# Clone dotfiles.
pp_info "Cloning dotfiles from Github..."
git clone https://github.com/joaofcosta/dotfiles.git $DOTFILES
pp_success "Succesfully cloned dotfiles."

# Link Alacritty configuration.
pp_info "Updating Alacritty configuration..."
rm -rf ~/.config/alacritty
dirlink alacritty ~/.config
pp_success "Alacritty configuration updated."

# tmux Plugin manager.
pp_info "Installing tmux plugin manager..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
pp_success "Tmux plugin manager successfully installed."

# Link TMUX configuration.
pp_info "Updating TMUX configuraiton..."
rm $HOME/.tmux.conf
ln -s $DOTFILES/tmux.conf $HOME/.tmux.conf
pp_success "TMUX configuration updated."

# Vim Plug.
pp_info "Installing Vim/NeoVim Plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pp_success "Vim Plug successfully installed."

# Link NeoVim configuration.
pp_info "Updating NeoVim configuraiton..."
rm -rf ~/.config/nvim
dirlink nvim ~/.config
pp_success "NeoVim configuration updated."

# Link ZSH configuration.
pp_info "Updating ZSH configuraiton..."
rm $HOME/.zshrc
ln -s $DOTFILES/zsh/.zshrc $HOME/.zshrc
pp_success "ZSH configuration updated."

# Link chunkwm configuration.
pp_info "Updating chunkwm configuraiton..."
rm $HOME/.chunkwmrc
rm -rf $HOME/.chunkwm_plugins
ln -s $DOTFILES/chunkwm/.chunkwmrc $HOME/.chunkwmrc
dirlink chunkwm/.chunkwm_plugins ~
pp_success "chunkwm configuration updated."

# Link skhd configuration.
pp_info "Updating skhd configuraiton..."
rm $HOME/.skhdrc
ln -s $DOTFILES/.skhdrc $HOME/.skhdrc
pp_success "skhd configuration updated."

# Add asdf plugins.
pp_info "Adding asdf plugins..."
asdf plugin-add elixir
asdf plugin-add erlang
asdf plugin-add ruby
pp_success "Succesfully added asdf plugins."

# zsh-syntax-highlighting.
if [ ! -d "/usr/local/share/zsh-syntax-highlighting" ]; then
  pp_info "Installing zsh-syntax-highlighting..."
  brew install zsh-syntax-highlighting
  pp_success "Succesfully installed zsh-syntax-highlighting."
else
  pp_success "zsh-syntax-highlighting already installed."
fi

# zsh-autosuggestions
if [ ! -d "/usr/local/share/zsh-autosuggestions" ]; then
  pp_info "Installing zsh-autosuggestions..."
  brew install zsh-autosuggestions
  pp_success "Succesfully installed zsh-autosuggestions."
else
  pp_success "zsh-autosuggestions already installed."
fi

# install geometry theme.
pp_info "Installing geometry ZSH theme..."
(cd $HOME/.oh-my-zsh/custom/themes && git clone https://github.com/geometry-zsh/geometry.git)
pp_success "Succesfully installed geomtry ZSH theme."

# git.
pp_info "Configuring git..."
ln -s $DOTFILES/git/gitignore ~/.gitignore
ln -s $DOTFILES/git/gitconfig ~/.gitconfig
pp_info "Git configure succesfully."

# Link karabiner configurations.
pp_info "Updating Karabiner configuration..."
dirlink karabiner ~/.config
pp_success "Karabiner configuration updated."

# -------------------------------------------------------------------------
# App Store Apps
# -------------------------------------------------------------------------
#
# This section is reserved for installation of apps that were to be
# installed using Apple's App Store.
#
# -------------------------------------------------------------------------

SECTION="Applications"

# App Store CLI.
if ! command -v mas > /dev/null 2>&1; then
	pp_info "Installing App Store CLI..."
  brew install mas
	pp_success "Finished installing App Store CLI."
else
	pp_success "App Store CLI already installed"
fi

# Todoist.
install_app "Todoist" "mas install 585829637"

# Slack.
install_app "Slack" "mas install 803453959"

# Postico.
install_app "Postico" "brew cask install postico"

# Spark.
install_app "Spark" "mas install 1176895641"

# Google Chrome.
install_app "Google Chrome" "brew cask install google-chrome"

# Amphetamine.
install_app "Amphetamine" "mas install 937984704"

# Notion.
install_app "Notion" "brew cask install notion"

# App Cleaner.
install_app "AppCleaner" "brew cask install appcleaner"

# Caption.
install_app "Caption" "brew cask install caption"

# MacDown.
install_app "MacDown" "brew cask install macdown"

# iTerm2.
install_app "iTerm" "brew cask install iterm2"

# Spotify.
install_app "Spotify" "brew cask install spotify"

# The Unarchiver.
install_app "The Unarchiver" "brew cask install the-unarchiver"

# WhatsApp.
install_app "WhatsApp" "brew cask install whatsapp"

# Transmission.
install_app "Transmission" "brew cask install transmission"

# Karabiner Elements.
install_app "Karabiner-Elements" "brew cask install karabiner-elements"

# eqMac2.
install_app "eqMac2" "brew cask install eqmac"

# GFX Card Status.
install_app "gfxCardStatus" "brew cask install gfxcardstatus"

# 1Password.
install_app "1Password 7" "mas install 1333542190"

# VLC.
install_app "VLC" "brew cask install vlc"

# Logitech Options.
install_app "Logi Options" "brew cask install homebrew/cask-drivers/logitech-options"

# StarUML.
install_app "StarUML" "brew cask install staruml"
