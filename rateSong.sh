#!/bin/sh

# Command description
# Get android events
# Uses base16
# $> adb shell getevent -l

# Emulate tap
# Uses base10
# $> adb shell input tap <x> <y>

if [ $# != 2 ]
then
    echo "Usage: rateSong.sh <playlistLength> <starRating>"
    exit
fi

playlistLength=$1
rating=$2

xStep=82

ratingX=(0 367 449 531 612 694)

ratingY=1273

nextButtonX=783
nextButtonY=1520

counter=1

while [ $counter -le $playlistLength ]
do
    # Tap rating
    adb shell input tap ${ratingX[$rating]} $ratingY

    #Tap next
    adb shell input tap $nextButtonX $nextButtonY

    echo "Rated Song " + $counter
    counter=`expr $counter + 1`
done
exit