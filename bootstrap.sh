#!/bin/zsh
# 
# Bootstrap script for setting up a new OSX machine
# 
# This should be idempotent so it can be run multiple times.
#
# Some apps don't have a cask and so still need to be installed by hand. These
# include:
#
# - Twditter (app store)
# - Postgres.app (http://postgresapp.com/)
#
# Notes:
#
# - If installing full Xcode, it's better to install that first from the app
#   store before running the bootstrap script. Otherwise, Homebrew can't access
#   the Xcode libraries as the agreement hasn't been accepted yet.
#
# Reading:
#
# - http://lapwinglabs.com/blog/hacker-guide-to-setting-up-your-mac
# - https://gist.github.com/MatthewMueller/e22d9840f9ea2fee4716
# - https://news.ycombinator.com/item?id=8402079
# - http://notes.jerzygangi.com/the-best-pgp-tutorial-for-mac-os-x-ever/

echo "Starting bootstrapping"

# Check for Oh My Zsh, install if we don't have it
if ! type omz > /dev/null
then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Update Oh My Zsh
omz update

# Check for Homebrew, install if we don't have it
if ! type brew > /dev/null
then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update homebrew recipes
brew update

PACKAGES=(
    awscli
    azure-cli
    git 
    kubernetes-cli
    markdown
    node
    npm
    nvim
    nvm
    postgresql
    python
    python3
    rabbitmq
    serve
    the_silver_searcher
    tmux
    vercel-cli
    zsh-git-prompt
    zsh-syntax-highlighting
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup

echo "Installing cask..."
brew tap homebrew/cask
CASKS=(
    # adobe-creative-cloud
    arduino
    authy
    blender
    discord
    docker
    dropbox
    firefox
    # google-chrome
    google-cloud-sdk
    google-drive
    iterm2
    # microsoft-teams
    obs
    protonvpn
    slack
    spectacle
    spotify
    steam
    visual-studio-code
    vlc
    vmware-fusion
    vmware-horizon-client
)

echo "Installing cask apps..."
brew install ${CASKS[@]}

echo "Installing fonts..."
brew tap homebrew/cask-fonts
FONTS=(
    font-fira-code
    font-fira-mono
    font-fira-sans
    font-clear-sans
)
brew install ${FONTS[@]}

if ! which pip3 > /dev/null
then
    echo "Installing pip..."
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python3 get-pip.py
fi

echo "Installing Python packages..."
PYTHON_PACKAGES=(
    virtualenv
    virtualenvwrapper
)
sudo pip3 install ${PYTHON_PACKAGES[@]}

echo "Installing global npm packages..."
GLOBAL_NPM_PACKAGES=(
    yarn
)
npm install ${GLOBAL_NPM_PACKAGES[@]} -g

echo "Configuring OSX..."

# Set host name
sudo scutil --set HostName MBP21

# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# TODO: Remap CAPS_LOCK to ESC


echo "Configuring iTerm2..."

# TODO: Add iterm2 settings plist to dotfiles project
# Overwrite ~/Library/Prferences/com.googlecode.iterm2.plist

echo "Configuring VSCode..."

# TODO: Add vscode settings to dotfiles project

echo "Creating folder structure..."

[[ ! -d Code ]] && mkdir Code

echo "Bootstrapping complete 🤙"
