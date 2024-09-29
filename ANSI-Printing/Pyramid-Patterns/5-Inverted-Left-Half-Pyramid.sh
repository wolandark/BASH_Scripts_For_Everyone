#!/usr/bin/env bash 

main()
{
	rows=5;

	for ((i=0; i < rows; i++)); do
		for ((j=0; j < 2 * i; j++)); do
			printf " ";
		done

		for ((k=0; k < rows - i; k++)); do
			printf "* "
		done
		printf "\n";
	done
}

main

# This bash script is a simple program that prints a right-aligned triangle pattern using asterisks (*). Here's a step-by-step explanation of the code:

# 1. The `main()` function is defined, which is the entry point of the program.

# 2. The `rows` variable is set to 5, which determines the number of rows in the
# triangle pattern.

# 3. The outer `for` loop iterates `rows` times, with the loop variable `i`
# ranging from 0 to `rows - 1`.

# 4. Inside the outer loop, the first inner `for` loop iterates `2 * i` times,
# with the loop variable `j` ranging from 0 to `2 * i - 1`. This loop prints the
# appropriate number of spaces to right-align the triangle.

# - When `i = 0`, `j` ranges from 0 to 0, and the loop prints 0 spaces.  - When
# `i = 1`, `j` ranges from 0 to 1, and the loop prints 2 spaces.  - When `i = 2`,
# `j` ranges from 0 to 3, and the loop prints 4 spaces.  - And so on, the number
# of spaces printed increases by 2 for each iteration of the outer loop.

# 5. After the first inner loop, the second inner `for` loop iterates `rows - i`
# times, with the loop variable `k` ranging from 0 to `rows - i - 1`. This loop
# prints the appropriate number of asterisks for each row.

# - When `i = 0`, `k` ranges from 0 to 4, and the loop prints 5 asterisks.  -
# When `i = 1`, `k` ranges from 0 to 3, and the loop prints 4 asterisks.  - When
# `i = 2`, `k` ranges from 0 to 2, and the loop prints 3 asterisks.  - And so on,
# the number of asterisks printed decreases by 1 for each iteration of the outer
# loop.

# 6. After the second inner loop, a newline character is printed to move to the
# next row.

# 7. The `main()` function is called to execute the program.

# In the code you provided, the condition for the first inner `for` loop is `for
# ((j=0; j < 2 * i; j++))`. This means that the loop variable `j` starts at 0 and
# continues as long as `j` is less than `2 * i`.

# The reason for this is to create the right-aligned spacing for the triangle
# pattern. The number of spaces needed to right-align the triangle increases by 2
# for each row.

# 	For example:

# 		- When `i = 0`, the condition becomes `j < 2 * 0`, which is `j < 0`.
# 		This means the loop will not execute at all, and there will be no
# 		spaces printed for the first row.  - When `i = 1`, the condition
# 		becomes `j < 2 * 1`, which is `j < 2`. This means the loop will execute
# 		twice, printing 2 spaces for the second row.  - When `i = 2`, the
# 		condition becomes `j < 2 * 2`, which is `j < 4`. This means the loop
# 		will execute 4 times, printing 4 spaces for the third row.

# 		And so on, the number of spaces printed increases by 2 for each row,
# 		creating the right-aligned triangle pattern.
