

# darkHour is the hour to switch to dark mode in 24 hours time
darkHour=DARK_HOUR_GOES_HERE
lightHour=LIGHT_HOUR_GOES_HERE

hour=$(date +%H)

if (( $lightHour < $darkHour ))
then
    if (( $lightHour <= $hour && $hour <= $darkHour ))
    then
        mode=light
    else
        mode=dark
    fi
else 
    if (( $darkHour <= $hour && $hour <= $lightHour ))
    then
        mode=dark
    else
        mode=light
    fi
fi

if [ $mode = light ]
then
    # set light mode
    osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to false'
else
    # set dark mode
    osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'
fi

