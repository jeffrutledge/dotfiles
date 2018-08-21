# Dotfiles

Uses GNU `stow`.
Directories starting with `_` are not meant to be stowed.

## Usage
Run `stow_group.sh [dotfile group]`.
Dotfile groups can be found in `dotfile_groups`

This sets up `stow` and stows `bin` so there is access to `stow_hook`.
`stow_hook`: runs `pre_install.sh`, stows the directory, runs `post_install.sh`.
