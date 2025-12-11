#!/bin/bash

if ! command -v acpi &> /dev/null; then
    echo "acpi is not installed. Installing..."
    
    if command -v apt-get &> /dev/null; then
        sudo apt-get update && sudo apt-get install -y acpi
    elif command -v apt &> /dev/null; then
        sudo apt update && sudo apt install -y acpi
    elif command -v dnf &> /dev/null; then
        sudo dnf install -y acpi
    elif command -v yum &> /dev/null; then
        sudo yum install -y acpi
    elif command -v pacman &> /dev/null; then
        sudo pacman -S --noconfirm acpi
    elif command -v zypper &> /dev/null; then
        sudo zypper install -y acpi
    else
        echo "Unable to install acpi automatically. Please install it manually."
        exit 1
    fi
    
    echo "acpi installed successfully!"
fi

get_battery_info() {
    local info=$(acpi -b)
    local percentage=$(echo "$info" | grep -oP '\d+(?=%)')
    local status=$(echo "$info" | grep -oP '(Charging|Discharging|Full|Unknown)')
    local time=$(echo "$info" | grep -oP '\d{2}:\d{2}:\d{2}')
    
    echo "$percentage|$status|$time"
}

echo "Battery monitoring started (press Ctrl+C to exit)"
echo ""

while true; do
    IFS='|' read -r percentage status time <<< "$(get_battery_info)"
    
    if [ "$status" = "Charging" ]; then
        if [ -n "$time" ]; then
            msg="🔋 Battery: ${percentage}% - Charging (${time} until full)"
        else
            msg="🔋 Battery: ${percentage}% - Charging"
        fi
    elif [ "$status" = "Discharging" ]; then
        if [ -n "$time" ]; then
            msg="🔋 Battery: ${percentage}% - Discharging (${time} remaining)"
        else
            msg="🔋 Battery: ${percentage}% - Discharging"
        fi
    elif [ "$status" = "Full" ]; then
        msg="🔋 Battery: ${percentage}% - Full"
    else
        msg="🔋 Battery: ${percentage}% - Unknown status"
    fi
    
    printf "\r%-80s" "$msg"
    
    sleep 0.5
done
