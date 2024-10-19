#!/usr/bin/env bash 
# 
# Matrix Digital Rain
# Written by Woland https://github.com/wolandark
# https://github.com/wolandark/BASH_Scripts_For_Everyone
#
# Dependency:
#          Use a font that supports katakana characters such as IBM Plex
#          Preferably Use Xterm or Xterm Compatible Terminal
#

# Include terminfo.sh To Store Initial BG and FG Colors
source terminfo.sh # Only works well in xterm, uxterm, rxvt, konsole, st

# Init LINES COLUMNS With A No-Op
shopt -s checkwinsize || return 1; (:;:)

# Setup Term, Hide Cursor, Switch To Alt Screen and Set Colors
echo -ne "\033[?25l"
echo -ne "\x1b[?1049h"
echo -ne "\033]11;#000000\007"
echo -ne "\033]10;#00FF00\007"

Rows=$LINES
Columns=$COLUMNS
Rows=$((Rows -1))

Alphabets=("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z" "0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "۱" "۲" "۳" "۴" "۵" "۶" "۷" "۸" "۹" "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z" "ア" "イ" "ウ" "エ" "オ" "カ" "キ" "ク" "ケ" "コ" "サ" "シ" "ス" "セ" "ソ" "タ" "チ" "ツ" "テ" "ト" "ナ" "ニ" "ヌ" "ネ" "ノ" "ハ" "ヒ" "フ" "ヘ" "ホ" "マ" "ミ" "ム" "メ" "モ" "ヤ" "ユ" "ヨ" "ラ" "リ" "ル" "レ" "ロ" "ワ" "ヰ" "ヱ" "ヲ" "ン" " ")

# Track Prev X Pos
declare -A previous_X

while :; do
    (
    X=$((RANDOM % (Columns / 2) * 2))
    if [[ -n ${previous_X[$X]} ]]; then
        :
    else
      # Make Prev X Occupied
        previous_X[$X]=1
    fi

    Y=$((RANDOM%Rows))

    for ((i = 1; i <= Rows; i++)); do
        CharIndex=$((RANDOM % ${#Alphabets[@]}))
        Char=${Alphabets[CharIndex]}

        # White Bold Green Dim
        echo -e "\033[$((i-1));${X}H\033[2;32m$Char\033[22m\033[$i;${X}H\033[1;37m$Char\033[22m"
        sleep 0.1

        if (( i >= Y )); then
            echo -e "\033[$((i-Y));${X}H "
        fi
    done

    for ((i = i - Y; i <= Rows; i++)); do
        echo -e "\033[$i;${X}f "
        sleep 0.1
    done
    ) &

    read -rt 0.1 -n 1 key
    if [[ $key == "q" ]]; then
        pkill -P $$
        # Restore Main Screen, Terminal Colors and Cursor
        echo -ne "\x1b[?1049l"
        echo -ne "\x1B[?25h"
        echo -ne "\033]11;"$output_hex_bg"\007"
        echo -ne "\033]10;"$output_hex_fg"\007"
        exit
    fi
    sleep 0.05
done
