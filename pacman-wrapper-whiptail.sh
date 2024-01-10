#!/bin/sh 

# Written By Woland

#Desc
# simple curses pacman wrapper in bash

#Dependency:
#          libnewt 

# https://github.com/wolandark
# https://github.com/wolandark/BASH_Scripts_For_Everyone

EXIT="Exit"

show_menu() {
    whiptail --title "Arch Linux Pacman Operations Menu" --menu "Choose an option" 20 78 7 \
    "1" "Update system with pacman" \
    "2" "Update system with paru (AUR included)" \
    "3" "Clean package cache with pacman" \
    "4" "Search for a package" \
    "5" "List explicitly installed packages" \
    "6" "List installed dependency packages" \
    "7" "Get information about a package" \
    "8" "List the contents of a package" \
    "$EXIT" "Exit the script" 3>&1 1>&2 2>&3
}

update_pacman() {
    echo "Updating system with pacman..."
    sudo pacman -Syu
}

update_paru() {
    echo "Updating system with paru (including AUR)..."
    paru -Syu
}

clean_cache() {
    echo "Cleaning package cache with pacman..."
    sudo pacman -Scc
}

search_package() {
    PACKAGE=$(whiptail --inputbox "Enter package name to search" 8 78 --title "Search for a package" 3>&1 1>&2 2>&3)
    if [ $? -eq 0 ]; then
        pacman -Ss "$PACKAGE"
    fi
}

list_explicitly_installed() {
    echo "Listing explicitly installed packages..."
    pacman -Qe
}

list_installed_deps() {
    echo "Listing installed dependency packages..."
    pacman -Qd
}

get_package_info() {
    PACKAGE=$(whiptail --inputbox "Enter package name to get information" 8 78 --title "Package Information" 3>&1 1>&2 2>&3)
    if [ $? -eq 0 ]; then
        pacman -Qi "$PACKAGE"
    fi
}

list_package_contents() {
    PACKAGE=$(whiptail --inputbox "Enter package name to list contents" 8 78 --title "List Package Contents" 3>&1 1>&2 2>&3)
    if [ $? -eq 0 ]; then
        pacman -Ql "$PACKAGE"
    fi
}

while true; do
    CHOICE=$(show_menu)
    case $CHOICE in
        1)
            update_pacman
            ;;
        2)
            update_paru
            ;;
        3)
            clean_cache
            ;;
        4)
            search_package
            ;;
        5)
            list_explicitly_installed
            ;;
        6)
            list_installed_deps
            ;;
        7)
            get_package_info
            ;;
        8)
            list_package_contents
            ;;
        "$EXIT")
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
    read -p "Press [Enter] key to continue..."
done

exit 0
