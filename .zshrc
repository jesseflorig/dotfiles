################################################################################
# zshrc @ jesse
################################################################################

# Options
setopt prompt_subst
unsetopt correct_all

# Variables
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.7

# PATH
export PATH="/usr/local/bin:/usr/local/sbin"
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:"$PATH
export PATH="/usr/local/opt:"$PATH
export PATH="~/Library:"$PATH
export PATH="~/Library/Android/sdk/tools:"$PATH
export PATH="~/Library/Android/sdk/platform-tools:"$PATH

# Exports
export EDITOR=nvim
export GOPATH=$HOME/Repos/go
export MANPATH=/usr/local/man:$MANPATH
export NVM_DIR=$HOME/.nvm
export TERM=xterm-256color
export WORKON_HOME=~/.virtualenvs
export ZSH=/Users/jesse/.oh-my-zsh

# AWS
export AWS_DEFAULT_PROFILE=default

# Sources
source $(brew --prefix nvm)/nvm.sh
source ~/.oh-my-zsh/oh-my-zsh.sh

# Third party Plugins (You will need to git clone these to your plugins directory)
source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.oh-my-zsh/plugins/zsh-git-prompt/zshrc.sh

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
    MBP)
      echo 💻
      ;;
    *)
      echo \@$1
      ;;
  esac
}

path_emoji(){
  case $1 in
    /)
      echo 🌱
      ;;
    /Users/jesse)
      echo 🏠
      ;;
    /Users/jesse/Repos)
      echo 🌎
      ;;
    /Users/jesse/Repos/belch)
      echo 🤮
      ;;
    /Users/jesse/Repos/prime)
      echo 🖖
      ;;
    /Users/jesse/Repos/papi)
      echo 🌮
      ;;
    /Users/jesse/Repos/dataviser)
      echo 🤖
      ;;
    /Users/jesse/Repos/dataviser/server)
      echo 🐉
      ;;
    /Users/jesse/Repos/dataviser/client)
      echo 🐲
      ;;
    /Users/jesse/Repos/go/src/github.com/jesseflorig)
      echo 🐨
      ;;
    *)
      echo %~
      ;;
  esac
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
alias htb="sudo openvpn --config ~/Downloads/jesseflorig.ovpn"
alias updatedb="sudo /usr/libexec/locate.updatedb"

## Configs
alias hrc="vi ~/.hyper.js"  # Modify the Hyper Terminal config
alias src="source ~/.zshrc" # Reload the Zsh config
alias trc="vi ~/.tmux.conf" # Modify the Tmux config
alias vrc="vi ~/.vimrc"     # Modify the Vim config
alias zrc="vi ~/.zshrc"     # Modify the Zsh config

## Dotfiles management
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias dotfilesinit="dotfiles config --local status.showUntrackedFiles no"

## Directories
alias docs="cd ~/Dropbox/Documents"
alias goroot="cd $GOPATH/src/github.com/jesseflorig"
alias repos="cd ~/Repos"
alias downloads="cd ~/Downloads"
alias zplug="cd ~/.oh-my-zsh/plugins"

## Git
alias gb="git branch"
alias gd="git diff"
alias gs="git status"

## Picard
alias bdoc="cd ~/Repos/bdoc"

## Dataviser
alias dvinit="~/.tmux.scripts/dataviser.sh"
alias sshdv="ssh bastion01"
alias dvr="cd ~/Repos/dataviser"
alias dvs="cd ~/Repos/dataviser/server"
alias dvse="dvs && source ~/Repos/dataviser/server/venv/bin/activate"
alias dvsu="dvse && ~/Repos/dataviser/server/bin/setup.sh"
alias dvss="dvse && ~/Repos/dataviser/server/bin/run.sh"
alias dvsm="./bin/run.sh -t migrate_sql"
alias dvsb="dropdb dataviser && createdb dataviser && dvse && ~/Repos/dataviser/server/bin/run.sh -t bootstrap"
alias dvsl="~/Repos/dataviser/server/bin/lint.sh"
alias dvst="~/Repos/dataviser/server/bin/test.sh"
alias dvc="cd ~/Repos/dataviser/client"
alias dvcu="dvc && npm i"
alias dvcs="dvc && npm start"
alias dvct="dvc && npm test"
alias dvcc="dvc && npx jest --clearCache"
alias dvcl="dvc && npm run lint"

## TMUX
alias tmake="tmux new -s $1"
alias tkill="tmux kill-session -t $1"
alias tls="tmux ls"
alias ta="tmux attach -t $1"
alias ts="tmux switch -t $1"

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

PROMPT='${ue}${he}$(path_emoji $(pwd))${ps}'
RPROMPT='$(git_super_status "%s")'

# Init Commands
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # Load NVM
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # Load NVM BASH completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
