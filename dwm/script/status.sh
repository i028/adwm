



while true
do
	oVol=`amixer get Master | awk -F '[][]' 'END{print $2}'`
	oMute=`amixer get Master | sed -n '$p' | cut -d] -f3 | cut -d[ -f2`
	oDate=`date -d now +"%R / %m/%d"`
	xsetroot -name "Arch / Vo:${oVol} / Mu:${oMute^^} / ${oDate} "
	sleep 3s
done &