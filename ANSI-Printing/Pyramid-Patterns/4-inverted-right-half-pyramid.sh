#!/usr/bin/env bash 

main()
{
	rows=5;

	for((i=0; i < rows; i++)); do
		for((j=0; j < rows - i; j++)); do
			echo -n "*"
		done
		echo ""
	done
}
main
