# .dotfiles

This is my personal repo for my dotfiles. Current configs:

 - `.config/ghostty/config` Ghostty terminal emulator config
 - `.zshrc` ZSH shell config
 - `.tmux.conf` TMUX terminal multiplexer config
 - `.tmux.scripts/` TMUX scripts for automating project workspaces
 - `.vimrc` VIM editor config

## Management

My `.zshrc` file contains the alias `dotfiles` for managing the GIT repo from the `$HOME` directory (it assumes the dotfiles repo has been cloned to `$HOME/.dotfiles`). Thus, you can use the following syntax in your `$HOME` directory:
  ```
  dotfiles status
  dotfiles commit
  dotfiles push
  dotfiles checkout -b 'new-branch'
  # etc
  ```

## Setup

As long as you have access to Github, setup should be painless:

  1. Clone the repo to your `$HOME/.dotfiles` directory
  ```
  git clone --bare git@github.com:jesseflorig/dotfiles.git $HOME/.dotfiles
  ```
  2. Checkout the config files from your local repo to your `$HOME` directory
  ```
  git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
  ```
  3. Set your shell to user your config file
  ```
  source $HOME/.zshrc
  ```
  4. Config MacOS and install Brew apps
  ```
  sudo $HOME/bootstrap.sh
  ```

## Workflow

Useful aliases:

  - `zrc` Open the ZSH config file for editing
  - `trc` Open the TMUX config file for editing
  - `src` Reloads the ZSH and TMUX config files
  - `vrc` Open the VIM config file for editing

## Todo

 - [ ] Figure out Brew app backup workflow
 - [ ] Figure out VIM and ZSH plugin backup/install workflow
 - [ ] Use `$EDITOR` instead of hardcoding an editor
 - [ ] Convert `bootstrap.sh` to TUI app

## Inspiration

[This thread](https://news.ycombinator.com/item?id=11070797) started it all. `durdn` took the amazing suggestion from `StreakyCobra` and wrote [this great article](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/).
