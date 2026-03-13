################################################################################
# zshrc @ jesse
################################################################################

# Options
setopt prompt_subst
unsetopt correct_all

# Variables
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.7
GIT_PROMPT_EXECUTABLE='shell'

# PATH
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin"
export PATH="/usr/local/bin:/usr/local/sbin:"$PATH
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:"$PATH
export PATH="/usr/local/opt:"$PATH
export PATH="/usr/local/go/bin:"$PATH
export PATH=$HOME"/Library:"$PATH
export PATH=$HOME"/Library/Android/sdk/tools:"$PATH
export PATH=$HOME"/Library/Android/sdk/platform-tools:"$PATH
export PATH=$HOME"/.local/bin:"$PATH
export PATH=$HOME"/.bun/bin:"$PATH
export PATH=$HOME"/.platformio/penv/bin:"$PATH
export PATH=$HOME"/.oh-my-zsh/plugins/zsh-git-prompt:"$PATH

# Exports
export EDITOR=nvim
export GOPATH=$HOME/Code/go
export MANPATH=/usr/local/man:$MANPATH
export NVM_DIR=$HOME/.nvm
export TERM=xterm-256color
export WORKON_HOME=$HOME/.virtualenvs
export ZSH=/Users/jesse/.oh-my-zsh

# AWS
export AWS_DEFAULT_PROFILE=default

# FNM
eval "$(fnm env --use-on-cd --shell zsh)"

# Sources
source $(brew --prefix nvm)/nvm.sh
source $HOME/.oh-my-zsh/oh-my-zsh.sh

# Third party Plugins (You will need to git clone these to your plugins directory)
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.oh-my-zsh/plugins/zsh-git-prompt/zshrc.sh

# Plugins
plugins=(
  brew
  git
  golang
  history
  node
  npm
  pip
  python
  tmux
  vim-interaction
  virtualenvwrapper
  yarn
)

# Helper Functions
user_emoji(){
  case $1 in
    jesse)
      echo 😎
      ;;
    root)
      echo 🦄
      ;;
    *)
      echo $1
      ;;
  esac
}

host_emoji(){
  case $1 in
    MBP21)
      echo 💻
      ;;
    *)
      echo \@$1
      ;;
  esac
}

path_emoji(){
  emoji_dir=${PWD}
  emoji_dir=${emoji_dir/\/Users\/jesse\/Code/🌎}
  emoji_dir=${emoji_dir/\/Users\/jesse/🏠}
  emoji_dir=${emoji_dir/#\//🌱}
  echo $emoji_dir
}

chrome(){ # Open file in Google Chrome
  open -a "Google Chrome" $1
}

brave(){ # Open file in Brave
  open -a "Brave" $1
}

# Aliases

## Commands
alias vi="nvim"
alias ll="ls -alh" # show all with human readable sizes
alias lls="ll -S"  # sort by file size
alias lt="ll -t"   # sort by last modified
alias llr="ll -R"  # recursive w/ subdirectories
alias cfg="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias htb="sudo openvpn --config $HOME/Downloads/jesseflorig.ovpn"
alias updatedb="sudo /usr/libexec/locate.updatedb"

## Configs
alias grc="vi $HOME/.config/ghostty/config"                      # Modify the Ghostty config
alias zrc="vi $HOME/.zshrc"                                      # Modify the Zsh config
alias trc="vi $HOME/.tmux.conf"                                  # Modify the Tmux config
alias src="source $HOME/.zshrc && tmux source-file $HOME/.tmux.conf" # Reload the Zsh config
alias vrc="vi $HOME/.vimrc"                                      # Modify the Vim config
alias sshrc="vi $HOME/.ssh/config"                               # Modify the SSH config
alias brc="vi $HOME/bootstrap.sh"                                # Modify the Bootstrap script
alias bootstrap=". $HOME/bootstrap.sh"                           # Run the Bootstrap script

## Dotfiles management
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias dotfilesinit="dotfiles config --local status.showUntrackedFiles no"

## Directories
alias docs="cd $HOME/Dropbox/Documents"
alias goroot="cd $GOPATH/src/github.com/jesseflorig"
alias repos="cd $HOME/Code"
alias downloads="cd $HOME/Downloads"
alias zplug="cd $HOME/.oh-my-zsh/plugins"

## Git
alias gb="git branch"
alias gd="git diff"
alias gs="git status"
alias ga="git add ."
alias gc="git commit -am"

## TMUX
alias tmake="tmux new -s $1"
alias tkill="tmux kill-session -t $1"
alias tls="tmux ls"
alias ta="tmux attach -t $1"
alias ts="tmux switch -t $1"

## MICROK8S
alias mk="microk8s $1"
alias kc="kubectl $1"

## ESP IDF Dev
alias idfinit=". $HOME/esp/esp-idf/export.sh && ESPPORT=/dev/cu.usbserial-0001"
alias idf="idf.py"
alias idfc="idf.py menuconfig"
alias idfb="idf.py build"
alias idfbb="idf.py fullclean && idf build"
alias idfflash="idf.py -p $ESPPORT flash"
alias idferase="idf.py -p $ESPPORT erase-flash"
alias idfmon="idf.py -p $ESPPORT monitor"
alias idfflashmon="idf.py -p $ESPPORT flash monitor"

## Misc
alias cht="curl cht.sh"
alias restart="sudo shutdown -r now"
alias esrun="repos && cd elasticsearch/bin && elasticsearch"

# Variables
ZSH_THEME="mh"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

local rc="%{$reset_color%}"        # reset color
local un="%{$fg[cyan]%}%n${rc}"    # user name
local hn="%{$fg[magenta]%}%m${rc}" # host name
local wd="%{$fg[yellow]%}%~${rc}"  # working directory
local ps=" "                       # prompt string

local ue=$(user_emoji $(whoami))
local he=$(host_emoji $(hostname -s))

PROMPT='${ue}${he}:$(path_emoji $(pwd))${ps}'
RPROMPT='$(git_super_status)'

# Init Commands
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # Load NVM
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # Load NVM BASH completion
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# bun completions
[ -s "/Users/jesse/.bun/_bun" ] && source "/Users/jesse/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
