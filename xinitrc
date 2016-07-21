source ${HOME}/.remapkbd
# xrdb -merge ~/.Xresources

export _JAVA_AWT_WM_NONREPARENTING=1

nm-applet &
pulseaudio --start &
pasystray &
awesome
