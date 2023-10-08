#!/usr/bin/env bash

# Written By Woland

# A slot machine gane written in bash

# https://github.com/wolandark
# https://github.com/wolandark/BASH_Scripts_For_Everyone


symbols=("@" "#" "&")
values=(10 20 30)
tokens=100
symlen=${#symbols[@]}

ylw() {
  echo -e "\033[1;7;36m$*\033[0m"
}
cyn() {
  echo -e "\033[1;7;34m$*\033[0m"
}
bylw() {
  echo -e "\033[1;7;32m$*\033[0m"
}
brd() {
  echo -e "\033[1;7;31m$*\033[0m"
}

figlet -f slant "Welcome Slot Machine!"

while true; do
    cyn "You have $tokens tokens left"
    bylw "Place your bet: "
    read -r bet

    if [[ $bet -le 0 || $bet -gt $tokens ]]; then
        brd "Invalid bet. Please enter a valid bet."
        continue
    fi

    # Spin the slot machine
    random_sym1=$((RANDOM % symlen))
    random_sym2=$((RANDOM % symlen))
    random_sym3=$((RANDOM % symlen))

    echo "${symbols[random_sym1]} ${symbols[random_sym2]} ${symbols[random_sym3]}"

    # Check for win
    if [ $random_sym1 -eq $random_sym2 ] && [ $random_sym1 -eq $random_sym3 ]; then
        ylw "Congratulations! You won ${values[random_sym1]} tokens."
        tokens=$((tokens + values[random_sym1]))
    else
        brd "Sorry, you didn't win this time."
        tokens=$((tokens - bet))
    fi

    if [ $tokens -le 0 ]; then
        brd "Game over! You're out of tokens."
        break
    fi
done
