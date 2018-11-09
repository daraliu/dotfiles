[ -f ${HOME}/.remapkbd ] && source ${HOME}/.remapkbd
[ -f ${HOME}/.java_gui_fix ] && source ${HOME}/.java_gui_fix

nm-applet &
pasystray &
xscreensaver &
awesome
