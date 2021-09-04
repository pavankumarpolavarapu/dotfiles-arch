#!/bin/bash

function linker(){
	~/.dotfiles/linker.sh -l "$1" -d "$2"
}
linker ~/.dotfiles/wallpapers ~/Pictures/wallpapers
linker ~/.dotfiles/nitrogen ~/.config/nitrogen
