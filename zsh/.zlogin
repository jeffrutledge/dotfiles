if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  if pacman -Qs i3-wm > /dev/null
  then
    exec startx
  else
    echo "Not executing startx, i3-wm not installed."
  fi
fi
