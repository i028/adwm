#! /bin/bash



while true
do
	oVol=`amixer get Master | awk -F '[][]' 'END{print $2}'`
	oMute=`amixer get Master | sed -n '$p' | cut -d] -f3 | cut -d[ -f2`
	oDate=`date -d now +"%R %m/%d"`
	xsetroot -name " / Vo:${oVol} ${oMute^^} / ${oDate} / Arch /"
	sleep 3s
done &
