
re='^[0-9]+$'


while true
do
    echo "What time would you like light mode to begin? 24-hour time: \r\n[0-23]:"
    read hourOfLight
    if ! [[ $hourOfLight =~ $re ]] ; then
        echo "Please enter a number"
        continue
    fi
    if (( 0 <= $hourOfLight && $hourOfLight <= 23 ))
    then
        break
    fi
done


while true
do
    echo "What time would you like dark mode to begin? 24-hour time: \r\n[0-23]:"
    read hourOfDarkness
    if ! [[ $hourOfDarkness =~ $re ]] ; then
        echo "Please enter a number"  
        continue
    fi
    if (( 0 <= $hourOfDarkness && $hourOfDarkness <= 23 ))
    then
        break
    fi
done


# Create unique cron folder
mkdir ~/.rom-cron

# Move script over
cat switch_lightdark.sh \
    | sed "s/DARK_HOUR_GOES_HERE/$hourOfDarkness/" \
    | sed "s/LIGHT_HOUR_GOES_HERE/$hourOfLight/" \
    > ~/.rom-cron/themeswitcher.sh


mv com.romolo.launched.switchtheme.plist ~/Library/LaunchAgents

launchctl load -w ~/Library/LaunchAgents/com.romolo.launched.switchtheme.plist