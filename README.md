# Set Up Instructions
Clone this repository to ~/.dotfiles
Ensure Required Installations are don 
Move ~/.dotfiles/.xinitrc to ~/.xinitrc
Execute ~/.dotfiles/install.sh



# Individual Links
Linker script takes 3 arguments, type of link as soft/hard, linking file/folder & destination file/folder
./linker.sh -t soft -l ~/.dotfiles/.xinitrc -d ~/.xinitrc


# Required Installations
pacman-contrib for checkupdates
alsa-utils for amixer
pulseaudio pavucontrol for audio
gvim for vim with clipboard
alacritty for terminal
arandr for multiple screen configuration
base-devel for compiling c packages
nvidia nvidia-utils for graphics card
xf86-video-fbdev xorg xorg-xinit nitrogen picom for window manager and compositor
dmenu for menubar
cmatrix neofetch powerline for styling
polybar ttf-font-awesome siji-git mpd for bar 
