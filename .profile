# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/dlsathvik04/flutter/flutter/bin

export PATH=$PATH:$HOME/.local/bin
export PATH="$PATH:/opt/nvim-linux64/bin"

export ANDROID_SDK_ROOT=/home/dlsathvik04/android-sdk
export ANDROID_HOME=/home/dlsathvik04/android-sdk
export PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin"
. "$HOME/.cargo/env"

if command -v sway &> /dev/null; then
  if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
      exec sway
  fi
fi


