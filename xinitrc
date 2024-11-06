[ -f ${HOME}/.xprofile ] && source ${HOME}/.xprofile

redshift &
nm-applet &
xscreensaver &
xfce4-power-manager &
picom -b --config $HOME/.config/picom/picom.conf &
dbus-launch --sh-syntax --exit-with-session awesome
