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
    local -a bar_color=("\033[47m" "\033[43m" "\033[46m" "\033[42m" "\033[45m" "\033[41m" "\033[44m" "\033[40m")
    
    for ((i = 1; i <= terminal_height; i++)); do
        printf "$(printf '%s%%-'"${bar_width}"'s\\033[0m' "${bar_color[@]}")\n" " " " " " " " " " " " " " " " " 
    done
    
    for kk in {7..0..-1}; do
        printf "${bar_color[$kk]}%-${bar_width}s\033[0m" " "
    done
    printf "\n${bar_color[6]}%-$((terminal_width - 6 ))s\033[0m\n" " " 
}
draw_vertical_bars
