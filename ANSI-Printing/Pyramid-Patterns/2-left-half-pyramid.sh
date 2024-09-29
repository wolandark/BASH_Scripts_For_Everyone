#!/usr/bin/env bash 

main()
{
	rows=5;

	for((i=0; i < rows; i++)); do
		for ((j=0; j < rows - i - 1; j++)) do
			echo -n " "
		done

		for((j=0; j <= i; j++)); do
			echo -n "*"
		done
		echo ""
	done
}
main
