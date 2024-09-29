#!/usr/bin/env bash 

get_terminal_height() {
    tput lines
}

get_terminal_width() {
	tput cols
}

draw_vertical_bars() {
    local terminal_height=$(get_terminal_height)
    local terminal_width=$(get_terminal_width)
	local bar_width=$((terminal_width / 8))
    local first_bar_color="\033[47m"  
    local second_bar_color="\033[43m" 
    local third_bar_color="\033[46m"  
    local fourth_bar_color="\033[42m" 
    local fifth_bar_color="\033[45m"  
    local sixth_bar_color="\033[41m"  
    local seventh_bar_color="\033[44m"
    local eight_bar_color="\033[40m"  

    for ((i = 1; i <= terminal_height; i++)); do
        printf "${first_bar_color}%-${bar_width}s\033[0m" " "  # print the main bars
        printf "${second_bar_color}%-${bar_width}s\033[0m" " " 
        printf "${third_bar_color}%-${bar_width}s\033[0m" " "  
        printf "${fourth_bar_color}%-${bar_width}s\033[0m" " " 
        printf "${fifth_bar_color}%-${bar_width}s\033[0m" " "  
        printf "${sixth_bar_color}%-${bar_width}s\033[0m" " "  
        printf "${seventh_bar_color}%-${bar_width}s\033[0m" " "
        printf "${eight_bar_color}%-${bar_width}s\033[0m\n" " "
    done
        printf "${eight_bar_color}%-${bar_width}s\033[0m" " "  # print the second row of color blocks
        printf "${seventh_bar_color}%-${bar_width}s\033[0m" " " 
        printf "${sixth_bar_color}%-${bar_width}s\033[0m" " " 
        printf "${fifth_bar_color}%-${bar_width}s\033[0m" " " 
        printf "${fourth_bar_color}%-${bar_width}s\033[0m" " "
        printf "${third_bar_color}%-${bar_width}s\033[0m" " " 
        printf "${second_bar_color}%-${bar_width}s\033[0m" " "
        printf "${first_bar_color}%-${bar_width}s\033[0m\n" " "    
		printf "${seventh_bar_color}%-$((terminal_width - 6 ))s\033[0m\n" " "  # Print the last full width bar
}

clear && tput reset
draw_vertical_bars

