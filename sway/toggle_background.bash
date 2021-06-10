#!/usr/bin/env bash
status=$(alacritty-colorscheme status)
if [ "$status" == "gruvbox_dark.yaml" ]; then
  BACKGROUND=light
  export BACKGROUND
  alacritty-colorscheme apply gruvbox_light.yaml
  gsettings set org.gnome.desktop.interface gtk-theme "Adwaita"
  sed -i "/background=/c\set background=light" ~/.config/nvim/init.vim
else
  BACKGROUND=dark
  export BACKGROUND
  alacritty-colorscheme apply gruvbox_dark.yaml
  gsettings set org.gnome.desktop.interface gtk-theme "Nordic"
  sed -i "/background=/c\set background=dark" ~/.config/nvim/init.vim
fi
