# Kibot Dotfiles

Repository ini berisi konfigurasi pribadi untuk environment development.

## Isi Repo

- zsh/.zshrc

- zsh/.p10k.zsh

- nvim/

- alacritty/alacritty.toml

## Restore Zsh

cp zsh/.zshrc ~/.zshrc

cp zsh/.p10k.zsh ~/.p10k.zsh

source ~/.zshrc

## Restore Neovim / LazyVim

rm -rf ~/.config/nvim

mkdir -p ~/.config

cp -r nvim ~/.config/nvim

## Restore Alacritty

Copy file:

alacritty/alacritty.toml

ke:

C:\Users\NAMA_USER\AppData\Roaming\alacritty\alacritty.toml
