[ -f ${HOME}/.remapkbd ] && source ${HOME}/.remapkbd
[ -f ${HOME}/.java_gui_fix ] && source ${HOME}/.java_gui_fix

nm-applet &
redshift &
xscreensaver &
xfce4-power-manager &
awesome
# compton -b --config $HOME/.config/compton/compton.conf &
# awesome
