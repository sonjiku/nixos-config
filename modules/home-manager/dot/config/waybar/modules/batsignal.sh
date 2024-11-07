#! /usr/bin/env sh

# Get percentage
percentage=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "percentage" | awk '{gsub("%",""); print $2}')
# Check if charging
plugged="$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep 'state' | awk '{print $2}')"
energy_consumption=$(printf "%.2fW" "$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep 'energy-rate' | awk '{print $2}')")
time_left="$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep 'time' | awk '{gsub(":"," in");print $3" "$4" "$5" "$6}')" 
if [ -z "$time_left" ]; then
    time_left=""
else
    time_left=$(echo "$time_left" | sed -rE 's:(.)(.*):\U\1\L\2:')
fi

# Set warning levels
bat_d=10
bat_c=15
bat_w=20
bat_l=40
bat_g=80

# Provide class for styling
if [ "$plugged" = "discharging" ]; then
    charging_state="Discharging"
    if [ "$percentage" -le "$bat_d" ]; then
        class="danger"
    elif [ "$percentage" -le "$bat_c" ]; then
        class="critical"
    elif [ "$percentage" -le "$bat_w" ]; then
        class="warning"
    elif [ "$percentage" -le "$bat_l" ]; then
        class="low"
    elif [ "$percentage" -le "$bat_g" ]; then
        class="discharging"
    else
        class="good"
    fi
elif [ "$plugged" = "fully-charged" ]; then
    class="full"
else
    charging_state="Charging"
    class="charging"
fi
if [ "$class" = "full" ]; then
    tooltip="Fully Charged"
else
    tooltip="$charging_state($energy_consumption)\n$time_left"
fi

printf '{"class": "%s", "tooltip": "%s", "percentage": %s}' "$class" "$tooltip" "$percentage"


if command -v batsignal >/dev/null 2>&1 ; then
    if pgrep -x batsignal >/dev/null; then
        sleep 0;
    else
        danger_not="notify-send -c 'device' -u critical '!!!NO BATTERY!!!' '!!!CHARGE THE LAPTOP YOU DONKEY!!!'"
        batsignal -D "$danger_not" -d "$bat_d" -c "$bat_c" -w "$bat_w" >/dev/null &
    fi
else
    notify-send -a "waybar" -c "device" -u "critical" "batsignal" "No batsignal command installed"
fi
