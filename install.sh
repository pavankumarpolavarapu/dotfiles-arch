#!/bin/bash

function linker(){
	~/.dotfiles/linker.sh -t "$1" -l "$2" -d "$333"
}
linker soft ~/.dotfiles/wallpapers ~/Pictures/wallpapers
linker soft ~/.dotfiles/nitrogen ~/.config/nitrogen
linker soft ~/.dotfiles/bspwm ~/.config/bspwm
linker soft ~/.dotfiles/sxhkd ~/.config/sxhkd
linker soft ~/.dotfiles/.bashrc ~/.bashrc
linker soft ~/.dotfiles/.xinitrc ~/.xinitrc
linker soft ~/.dotfiles/.vimrc ~/.vimrc
linker soft ~/.dotfiles/.gitconfig ~/.gitconfig
linker soft ~/.dotfiles/polybar ~/.config/polybar
linker soft ~/.dotfiles/.tmux.conf ~/.tmux.conf
