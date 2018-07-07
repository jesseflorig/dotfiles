# .dotfiles

This is my personal repo for my dotfiles. Current configs:

 - `.zshrc` ZSH config
 - `.vimrc` VIM config
 - `.tmux.conf` TMUX config
 - `.tmux.scripts` TMUX scripts for automating project workspaces

## Management

My `.zshrc` file contains the alias `dotfiles` for managing the GIT repo from the `~` directory (it assumes the dotfiles repo has been cloned to `~/.dotfiles`). Thus, you can use the following syntax in your `~` directory:

 - `dotfiles status`
 - `dotfiles commit`
 - `dotfiles push`
 - etc


