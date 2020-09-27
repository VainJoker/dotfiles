#!/bin/bash

# Dependencies:alsa-utils,xbacklight
dwm_resources () {
    # Used and total memory
    MEMUSED=$(free -h | awk '(NR == 2) {print $3}')
    MEMTOT=$(free -h |awk '(NR == 2) {print $2}')
    # CPU temperature
    CPU=$(sysctl -n hw.sensors.cpu0.temp0 | cut -d. -f1)
    # Used and total storage in /home (rounded to 1024B)
    STOUSED=$(df -h | grep '/home$' | awk '{print $3}')
    STOTOT=$(df -h | grep '/home$' | awk '{print $2}')
    STOPER=$(df -h | grep '/home$' | awk '{print $5}')

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "💻 MEM %s/%s CPU %s STO %s/%s: %s" "$MEMUSED" "$MEMTOT" "$CPU" "$STOUSED" "$STOTOT" "$STOPER"
    else
        printf " MEM %s/%s" "$MEMUSED" "$MEMTOT" 
        # printf "STA | MEM %s/%s CPU %s STO %s/%s: %s" "$MEMUSED" "$MEMTOT" "$CPU" "$STOUSED" "$STOTOT" "$STOPER"
    fi
    printf "%s\n" "$SEP2"
}

dwm_alsa () {
    VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$VOL" -eq 0 ]; then
            printf "🔇"
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
            printf "🔈 %s%%" "$VOL"
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            printf "🔉 %s%%" "$VOL"
        else
            printf "🔊 %s%%" "$VOL"
        fi
    else
        if [ "$VOL" -eq 0 ]; then
            printf "MUTE"
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
            printf "VOL %s%%" "$VOL"
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            printf "VOL %s%%" "$VOL"
        else
            printf "VOL %s%%" "$VOL"
        fi
    fi
    printf "%s\n" "$SEP2"
}

dwm_transmission () {
    TORRENT=$(transmission-remote -l | sed '2q;d' | sed 's/\(.\) /\1/g')
    ID=$(printf "%s" "$TORRENT" | awk '{print $1;}')
    STATUS=$(printf "%s" "$TORRENT" | awk '{print $8;}')
    ETA=$(printf "%s" "$TORRENT" | awk '{print $4;}')
    NAME=$(printf "%s" "$TORRENT" | awk '{for(i=9;i<=NF;++i)print $i}' | tr -d "\n" | head -c 20; printf "...")
    DONE=$(printf "%s" "$TORRENT" | awk '{print $2;}')
    UP=$(printf "%s" "$TORRENT" | awk '{print $5;}')
    DOWN=$(printf "%s" "$TORRENT" | awk '{print $5;}')
case "$STATUS" in
                "Idle")
                    printf "IDLE %s | %s %s ⬆%s ⬇%s" "$NAME" "$DONE" "$ETA" "$UP" "$DOWN"
                    ;;
                "Seeding")
                    printf "SEEDING %s | ⬆%s ⬇%s" "$NAME" "$UP" "$DOWN"
                    ;;
                "Downloading")
                    printf "DOWNLOADING %s | %s %s ⬆%s ⬇%s" "$NAME" "$DONE" "$ETA" "$UP" "$DOWN"
                    ;;
            esac
printf "%s\n" "$SEP2"
}

dwm_transmission



dwm_backlight () {
    printf "%sBL%.0f%s\n" "$SEP1" "$(xbacklight)" "$SEP2"
}

xsetroot -name VainJoker
feh --bg-scale /home/vainjoker/Pictures/wallpaper.jpg
compton --config /home/vainjoker/.config/compton/compton.conf -b
# picom --config .config/picom/picom.conf -b
# dwm_resources
sleep 1s
fcitx &
while true ; do
    xsetroot -name "$( acpi -b | awk '{ print $3, $4 }' | tr -d ',' )""   ""$(dwm_backlight)""   ""$(dwm_alsa)""   ""$(dwm_resources)""   ""$(  date +"%F %R" )"
    sleep 1m
done &

