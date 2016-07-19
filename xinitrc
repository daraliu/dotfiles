source ${HOME}/.remapkbd
if /usr/sbin/lsusb --verbose 2>&1 | grep --quiet "Mouse"; then
    /usr/bin/synclient TouchPadOff="1"
fi
# xrdb -merge ~/.Xresources
nm-applet &
pulseaudio --start &
pasystray &
awesome
