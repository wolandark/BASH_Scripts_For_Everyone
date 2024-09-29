#!/usr/bin/env bash 

main()
{
    rows=5;

	for ((i=0; i < rows; i++)); do

		for ((j=0; j < i; j++)); do
            printf " "
		done

		for ((k=0; k < rows; k++)); do
            printf "*";
		done
        printf "\n";
	done
}

main
