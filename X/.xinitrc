#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]
then
  xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]
then
  xmodmap $sysmodmap
fi

if [ -f "$userresources" ]
then
  xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]
then
  xmodmap "$usermodmap"
fi

# Remap caps lock to escape
xmodmap -e 'clear Lock' #ensures you're not stuck in CAPS on mode
xmodmap -e 'keycode 0x42=Escape' #remaps the keyboard so CAPS LOCK=ESC

# Bind keys
xbindkeys -p

# Load local i3wm mod variable
i3local=$HOME/.i3wm_mod.local
if [ -f "$i3local" ]
then
  xrdb -merge $i3local
fi

# Set background using feh config
if [ -e ~/.fehbg ]
then
  ~/.fehbg &
fi

# Open i3 if installed
if pacman -Qs i3-wm > /dev/null
then
  unclutter &
  exec i3
else
  echo "Not launching gui, i3-wm not installed."
fi
