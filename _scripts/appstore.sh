#!/bin/sh

# Function to check if apps are installed and install them if not
install_from_appstore() {
    local apps=("$@")  # Accept the app list as arguments

    for app in "${apps[@]}"; do
        local appid="${app%%:*}"
        local appname="${app##*:}"

        # Check if the app is already installed
        if mas list | grep -q "$appid"; then
            echo "$appname is already installed."
        else
            echo "Installing $appname..."
            mas install "$appid"
        fi
    done
}

# List of apps to install with their IDs and names
app_list=(
    "302584613:Kindle"
    "1018301773:AdBlock Pro"
    # "441258766:Magnet"
    "1352778147:Bitwarden"
)

# Run the function with the app list as argument
install_from_appstore "${app_list[@]}"

echo "\nApp installation completed."
