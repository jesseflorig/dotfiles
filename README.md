# .dotfiles

This is my personal repo for my dotfiles. Current configs:

 - `.zshrc` ZSH config
 - `.vimrc` VIM config
 - `.tmux.conf` TMUX config
 - `.tmux.scripts/` TMUX scripts for automating project workspaces

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
  git clone git@github.com:jesseflorig/dotfiles.git $HOME/.dotfiles
  ```
  2. Checkout the config files from your local repo to your `$HOME` directory
  ```
  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
  ```
  3. Set your shell to user your config file
  ```
  source .bashrc # If using Bash (coming soon)
  source .zshrc  # If using ZSH
  ```

## Workflow

Useful aliases:

  - `src` Reloads the ZSH config file
  - `zrc` Open the ZSH config file for editing
  - `vrc` Open the VIM config file for editing

## Todo

 - [ ] Finish Setup instructions
 - [ ] Create a `.bashrc` branch for the networks I don't have access to ZSH
 - [ ] Figure out VIM and ZSH plugin backup/install workflow
 - [ ] Fix config file nomenclature (~ vs $HOME, etc.)
 - [ ] Use `$EDITOR` instead of hardcoding an editor
 - [ ] Add more initial provisioning automation (like Brew/Yum install)

## Inspiration

[This thread](https://news.ycombinator.com/item?id=11070797) started it all. `durdn` took the amazing suggestion from `StreakyCobra` and wrote [this great article](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/).
