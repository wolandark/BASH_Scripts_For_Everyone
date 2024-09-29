#!/usr/bin/env bash

main()
{
    rows=5;

	for ((i=0; i < rows; i++)) do
		for ((j=0; j < 2 * (rows - i) - 1; j++)) do
            printf " "
		done
		for ((k=0; k < 2 * i + 1; k++)) do
            printf "* "
		done
        printf "\n"
	done
}
 main
