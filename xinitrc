#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

eval $(/usr/bin/gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

mkdir -p "$HOME"/.local/share/keyrings

# Wallpaper
nitrogen --restore &

fcitx5 &

# Transparent
picom -b &


#set statusbar
#while true
#do
#   if acpi -a | grep off-line > /dev/null; then
#       xsetroot -name "Bat. $( acpi -b | awk '{ print $4 " " $5 }' | tr -d ',' )     | Vol. $(amixer get Master | tail -1 | awk '{ print $5}' | tr -d '[]') | $(date +    "%a, %b %d %R")"
#   else
#      xsetroot -name " Arch Vol:$(amixer get Master | tail -1 | awk '{ print $5}'     | tr -d '[]') $(date +"%R ")"
#   fi
#   sleep 1s
#done &


while true
do
	oVol=`amixer get Master | awk -F '[][]' 'END{print $2}'`
	oMute=`amixer get Master | sed -n '$p' | cut -d] -f3 | cut -d[ -f2`
	oDate=`date -d now +"%R / %m/%d"`
	xsetroot -name " Arch / Vo:${oVol} / Mu:${oMute^^} / ${oDate} "
	sleep 3s
done &


exec dwm
