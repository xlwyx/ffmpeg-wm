#!/usr/bin/env bash

# detectamos mágicamente el Width y el Height
WIDTH=$(xrandr -q | grep -w Screen | awk '{print $8}')
HEIGHT=$(xrandr -q | grep -w Screen | awk '{print $10}' | sed 's/,//')
# consultamos la fecha para agregarselo al nombre del video así no se borra
# y queda más profesional y prestigioso XD
DATE=$(date "+%y_%m_%d_%H_%M_%S")

INRES=$WIDTH"x"$HEIGHT
# OUTRES es la salida lo hice en ingles por que el ingles vende...
# si quieres que sea hd cambias a 1920x1080 el OUTRES y listo
OUTRES="1280x720"
DISPLAY=$(echo $DISPLAY)
FPS="30"

ffmpeg -f x11grab -s "$INRES" -r "$FPS" -i $DISPLAY.0 -f alsa -ac 2 \
-i default -vcodec libx264 -s "$OUTRES" \
-acodec libmp3lame -ab 128k -ar 44100 \
-threads 0 -f mp4 ~/Videos/PrestigiusVideus_$DATE.mp4
