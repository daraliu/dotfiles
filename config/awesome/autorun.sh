#!/bin/sh
# See https://wiki.archlinux.org/title/Awesome#Autostart

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

run "nm-applet"
exec picom --experimental-backends --config ~/.config/picom/picom.conf &

