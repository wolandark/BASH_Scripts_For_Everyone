#!/bin/bash

# Written By Woland

# A helper script for sshuttle

#Dpendency:
#         sshuttle
#         Add your servers to the optioans array. The syntax is ip:port

# https://github.com/wolandark
# https://github.com/wolandark/BASH_Scripts_For_Everyone

PS3="Select the server you wish to connect to: "
options=(
1.1.1.1:22
2.2.2.2:22
)

default_subnet="0/0"

select choice in "${options[@]}"; 
do

echo -e "\nEnter subnet. Default 0/0\nPress Enter to confirm or input subnet"
read -r subnet

if [[ $subnet =~ ^[Yy]$ || -z $subnet ]];
then
    subnet="$default_subnet"
fi

echo -e "\nDo you wish to tunnel DNS too?\n Answer y, yes or Enter to confirm"
read -r ans
if [[ $ans == "y" || $ans == "yes" || -z $ans ]]; 
then
    echo "sshuttle -r '$choice' '$subnet' --dns"
    sshuttle -r "$choice" "$subnet" --dns
else
    echo "sshuttle -r '$choice' '$subnet'"
    sshuttle -r "$choice" "$subnet"
fi
break
done
