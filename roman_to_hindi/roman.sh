#!/bin/bash
# vim: foldmethod=marker

function romanToArabic {
    local input=$1
    local result=0
    local prevChar=""
    local currChar=""
    local currValue=0
    local prevValue=0

    for ((i=0; i<${#input}; i++)); do
        currChar="${input:i:1}"

        case $currChar in
            "I") currValue=1 ;;
            "V") currValue=5 ;;
            "X") currValue=10 ;;
            "L") currValue=50 ;;
            "C") currValue=100 ;;
            "D") currValue=500 ;;
            "M") currValue=1000 ;;
            *) continue ;;
        esac
		# Comment{{{
		# For numbers such as IV
		# The loop first executes the else block
		# since there is no prevValue yet.
		# so 1 is added to the result variable 
		# but in the case of IV and such the second iteration 
		# executes the if block, and so we have to substract 2 
		# from the result variable. 1 for the incorrect addition 
		# and 1 for the current number.
		# }}}
        if ((prevValue < currValue)); then
            result=$((result + currValue - 2 * prevValue))
        else
            result=$((result + currValue))
        fi

        prevChar="$currChar"
        prevValue="$currValue"
    done

    echo "$result"
}

if [[ -z "$1" ]]; then
    echo "Usage: $0 <inputFile_or_romanNumerals>"
    exit 1
fi

if [[ -f "$1" ]]; then
    inputFile="$1"

    while IFS= read -r line; do
        eval "line=$(echo "$line" | sed -E 's/([IVXLCDM]+)/$(romanToArabic "\1")/g')"
        echo "$line"
    done < "$inputFile" > "$inputFile.tmp"

    mv "$inputFile.tmp" "$inputFile"

    echo "Roman numerals converted in $inputFile"
else
    romanNumerals="$1"
    arabicNumber=$(romanToArabic "$romanNumerals")
    echo "Roman numerals '$romanNumerals' converted to: $arabicNumber"
fi
