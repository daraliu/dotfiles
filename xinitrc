[ -f ${HOME}/.remapkbd ] && source ${HOME}/.remapkbd
[ -f ${HOME}/.java_gui_fix ] && source ${HOME}/.java_gui_fix

nm-applet &
xscreensaver &
xfce4-power-manager &
awesome
