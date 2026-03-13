#!/bin/zsh
#
# Bootstrap script for setting up a new OSX machine
#
# Param 1: New hostname
#
# This should be idempotent so it can be run multiple times.
#
# Notes:
#
# - If installing full Xcode, it's better to install that first from the app
#   store before running the bootstrap script. Otherwise, Homebrew can't access
#   the Xcode libraries as the agreement hasn't been accepted yet:
#
#   sudo xcodebuild -license accept
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

# Accept XCode license
echo "Accepting XCode license..."
sudo xcodebuild -license accept

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
    ghostty
    # google-chrome
    google-cloud-sdk
    google-drive
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
brew install --cask ${CASKS[@]}

echo "Installing fonts..."
brew tap homebrew/cask-fonts
FONTS=(
    font-fira-code
    font-fira-mono
    font-fira-sans
    font-clear-sans
)
brew install ${FONTS[@]}

echo "Cleaning up brew files..."
brew cleanup

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

#echo "Installing global npm packages..."
#GLOBAL_NPM_PACKAGES=(
#)
#npm install ${GLOBAL_NPM_PACKAGES[@]} -g

echo "Configuring OSX..."

# Set host name
NEWHOST = "${1:-MBP}"
sudo scutil --set HostName $NEWHOST

# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# TODO: Set default terminal
# TODO: Remap CAPS_LOCK to ESC

echo "Installing Vim plugins..."
vim +'PlugInstall --sync' +qa

echo "Creating folder structure..."

[[ ! -d Code ]] && mkdir Code

# TODO: Configure Dropbox

echo "Bootstrapping complete 🤙"
