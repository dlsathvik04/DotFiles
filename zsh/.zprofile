if command -v Hyprland &> /dev/null; then
  if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec Hyprland
  fi
fi


# if command -v sway &> /dev/null; then
#   if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
#       exec sway
#   fi
# fi
