% Function/predicate that solves the puzzle
% It takes 81 values as input and prints the solved puzzle
% An unknown value is seen as an underscore
% This will run the solve predicate function given 81 values as 
% input and if the solve is true/successful then the next clause will be executed to print the solved puzzle
sudoku(R1C1, R1C2, R1C3, R1C4, R1C5, R1C6, R1C7, R1C8, R1C9,
	R2C1, R2C2, R2C3, R2C4, R2C5, R2C6, R2C7, R2C8, R2C9,
	R3C1, R3C2, R3C3, R3C4, R3C5, R3C6, R3C7, R3C8, R3C9,
	R4C1, R4C2, R4C3, R4C4, R4C5, R4C6, R4C7, R4C8, R4C9,
	R5C1, R5C2, R5C3, R5C4, R5C5, R5C6, R5C7, R5C8, R5C9,
	R6C1, R6C2, R6C3, R6C4, R6C5, R6C6, R6C7, R6C8, R6C9,
	R7C1, R7C2, R7C3, R7C4, R7C5, R7C6, R7C7, R7C8, R7C9,
	R8C1, R8C2, R8C3, R8C4, R8C5, R8C6, R8C7, R8C8, R8C9,
	R9C1, R9C2, R9C3, R9C4, R9C5, R9C6, R9C7, R9C8, R9C9) :- 
	write('Solving...'), nl, %prints Solving...
	printProblem(R1C1, R1C2, R1C3, R1C4, R1C5, R1C6, R1C7, R1C8, R1C9, % prints the initial problem
	R2C1, R2C2, R2C3, R2C4, R2C5, R2C6, R2C7, R2C8, R2C9,
	R3C1, R3C2, R3C3, R3C4, R3C5, R3C6, R3C7, R3C8, R3C9,
	R4C1, R4C2, R4C3, R4C4, R4C5, R4C6, R4C7, R4C8, R4C9,
	R5C1, R5C2, R5C3, R5C4, R5C5, R5C6, R5C7, R5C8, R5C9,
	R6C1, R6C2, R6C3, R6C4, R6C5, R6C6, R6C7, R6C8, R6C9,
	R7C1, R7C2, R7C3, R7C4, R7C5, R7C6, R7C7, R7C8, R7C9,
	R8C1, R8C2, R8C3, R8C4, R8C5, R8C6, R8C7, R8C8, R8C9,
	R9C1, R9C2, R9C3, R9C4, R9C5, R9C6, R9C7, R9C8, R9C9),
	write('Solution:'), nl, %prints Solution:
	solve(R1C1, R1C2, R1C3, R1C4, R1C5, R1C6, R1C7, R1C8, R1C9, % calls the solve function on the board
	R2C1, R2C2, R2C3, R2C4, R2C5, R2C6, R2C7, R2C8, R2C9,
	R3C1, R3C2, R3C3, R3C4, R3C5, R3C6, R3C7, R3C8, R3C9,
	R4C1, R4C2, R4C3, R4C4, R4C5, R4C6, R4C7, R4C8, R4C9,
	R5C1, R5C2, R5C3, R5C4, R5C5, R5C6, R5C7, R5C8, R5C9,
	R6C1, R6C2, R6C3, R6C4, R6C5, R6C6, R6C7, R6C8, R6C9,
	R7C1, R7C2, R7C3, R7C4, R7C5, R7C6, R7C7, R7C8, R7C9,
	R8C1, R8C2, R8C3, R8C4, R8C5, R8C6, R8C7, R8C8, R8C9,
	R9C1, R9C2, R9C3, R9C4, R9C5, R9C6, R9C7, R9C8, R9C9),
	printSolution(R1C1, R1C2, R1C3, R1C4, R1C5, R1C6, R1C7, R1C8, R1C9, % if solve is true eventually, prints the solution 
	R2C1, R2C2, R2C3, R2C4, R2C5, R2C6, R2C7, R2C8, R2C9,
	R3C1, R3C2, R3C3, R3C4, R3C5, R3C6, R3C7, R3C8, R3C9,
	R4C1, R4C2, R4C3, R4C4, R4C5, R4C6, R4C7, R4C8, R4C9,
	R5C1, R5C2, R5C3, R5C4, R5C5, R5C6, R5C7, R5C8, R5C9,
	R6C1, R6C2, R6C3, R6C4, R6C5, R6C6, R6C7, R6C8, R6C9,
	R7C1, R7C2, R7C3, R7C4, R7C5, R7C6, R7C7, R7C8, R7C9,
	R8C1, R8C2, R8C3, R8C4, R8C5, R8C6, R8C7, R8C8, R8C9,
	R9C1, R9C2, R9C3, R9C4, R9C5, R9C6, R9C7, R9C8, R9C9).

% Solves the puzzle by making sure the values are all valid
% This checks the rows, columns, and 3x3 squares
% Uses a predicate to check if the values are valid
% Each clause is a row, col, or 3x3 square to be checked
solve(R1C1, R1C2, R1C3, R1C4, R1C5, R1C6, R1C7, R1C8, R1C9,
	R2C1, R2C2, R2C3, R2C4, R2C5, R2C6, R2C7, R2C8, R2C9,
	R3C1, R3C2, R3C3, R3C4, R3C5, R3C6, R3C7, R3C8, R3C9,
	R4C1, R4C2, R4C3, R4C4, R4C5, R4C6, R4C7, R4C8, R4C9,
	R5C1, R5C2, R5C3, R5C4, R5C5, R5C6, R5C7, R5C8, R5C9,
	R6C1, R6C2, R6C3, R6C4, R6C5, R6C6, R6C7, R6C8, R6C9,
	R7C1, R7C2, R7C3, R7C4, R7C5, R7C6, R7C7, R7C8, R7C9,
	R8C1, R8C2, R8C3, R8C4, R8C5, R8C6, R8C7, R8C8, R8C9,
	R9C1, R9C2, R9C3, R9C4, R9C5, R9C6, R9C7, R9C8, R9C9 ):-
	isValid(R1C1, R1C2, R1C3, R1C4, R1C5, R1C6, R1C7, R1C8, R1C9), % First row
	isValid(R2C1, R2C2, R2C3, R2C4, R2C5, R2C6, R2C7, R2C8, R2C9), % Second row
	isValid(R3C1, R3C2, R3C3, R3C4, R3C5, R3C6, R3C7, R3C8, R3C9), % Third row
	isValid(R4C1, R4C2, R4C3, R4C4, R4C5, R4C6, R4C7, R4C8, R4C9), % Fourth row
	isValid(R5C1, R5C2, R5C3, R5C4, R5C5, R5C6, R5C7, R5C8, R5C9), % Fifth row
	isValid(R6C1, R6C2, R6C3, R6C4, R6C5, R6C6, R6C7, R6C8, R6C9), % Sixth row
	isValid(R7C1, R7C2, R7C3, R7C4, R7C5, R7C6, R7C7, R7C8, R7C9), % Seventh row
	isValid(R8C1, R8C2, R8C3, R8C4, R8C5, R8C6, R8C7, R8C8, R8C9), % Eighth row
	isValid(R9C1, R9C2, R9C3, R9C4, R9C5, R9C6, R9C7, R9C8, R9C9), % Ninth row
	isValid(R1C1, R2C1, R3C1, R4C1, R5C1, R6C1, R7C1, R8C1, R9C1), % First column
	isValid(R1C2, R2C2, R3C2, R4C2, R5C2, R6C2, R7C2, R8C2, R9C2), % Second column
	isValid(R1C3, R2C3, R3C3, R4C3, R5C3, R6C3, R7C3, R8C3, R9C3), % Third column
	isValid(R1C4, R2C4, R3C4, R4C4, R5C4, R6C4, R7C4, R8C4, R9C4), % Fourth column
	isValid(R1C5, R2C5, R3C5, R4C5, R5C5, R6C5, R7C5, R8C5, R9C5), % Fifth column
	isValid(R1C6, R2C6, R3C6, R4C6, R5C6, R6C6, R7C6, R8C6, R9C6), % Sixth column
	isValid(R1C7, R2C7, R3C7, R4C7, R5C7, R6C7, R7C7, R8C7, R9C7), % Seventh column
	isValid(R1C8, R2C8, R3C8, R4C8, R5C8, R6C8, R7C8, R8C8, R9C8), % Eighth column
	isValid(R1C9, R2C9, R3C9, R4C9, R5C9, R6C9, R7C9, R8C9, R9C9), % Ninth column
	isValid(R1C1, R1C2, R1C3, R2C1, R2C2, R2C3, R3C1, R3C2, R3C3), % Top Left block
	isValid(R1C4, R1C5, R1C6, R2C4, R2C5, R2C6, R3C4, R3C5, R3C6), % Top Middle block
	isValid(R1C7, R1C8, R1C9, R2C7, R2C8, R2C9, R3C7, R3C8, R3C9), % Top Right block
	isValid(R4C1, R4C2, R4C3, R5C1, R5C2, R5C3, R6C1, R6C2, R6C3), % Left block
	isValid(R4C4, R4C5, R4C6, R5C4, R5C5, R5C6, R6C4, R6C5, R6C6), % Middle block
	isValid(R4C7, R4C8, R4C9, R5C7, R5C8, R5C9, R6C7, R6C8, R6C9), % Right block
	isValid(R7C1, R7C2, R7C3, R8C1, R8C2, R8C3, R9C1, R9C2, R9C3), % Bottom Left block
	isValid(R7C4, R7C5, R7C6, R8C4, R8C5, R8C6, R9C4, R9C5, R9C6), % Bottom Middle block
	isValid(R7C7, R7C8, R7C9, R8C7, R8C8, R8C9, R9C7, R9C8, R9C9). % Bottom Right block

% Determine if the value is valid by making sure it doesn't already exist in the row, column, or block being passed
% Also checks that the value being 
isValid(A, B, C, D, E, F, G, H, I) :- num(A), num(B), num(C), num(D), num(E), num(F), num(G), num(H), num(I),
A\=B, A\=C, A\=D, A\=E, A\=F, A\=G, A\=H, A\=I,
B\=C, B\=D, B\=E, B\=F, B\=G, B\=H, B\=I,
C\=D, C\=E, C\=F, C\=G, C\=H, C\=I,
D\=E, D\=F, D\=G, D\=H, D\=I,
E\=F, E\=G, E\=H, E\=I,
F\=G, F\=H, F\=I,
G\=H, G\=I,
H\=I.

% takes the 81 elements of the board and calls the print function on each row.
printSolution(R1C1, R1C2, R1C3, R1C4, R1C5, R1C6, R1C7, R1C8, R1C9,
	R2C1, R2C2, R2C3, R2C4, R2C5, R2C6, R2C7, R2C8, R2C9,
	R3C1, R3C2, R3C3, R3C4, R3C5, R3C6, R3C7, R3C8, R3C9,
	R4C1, R4C2, R4C3, R4C4, R4C5, R4C6, R4C7, R4C8, R4C9,
	R5C1, R5C2, R5C3, R5C4, R5C5, R5C6, R5C7, R5C8, R5C9,
	R6C1, R6C2, R6C3, R6C4, R6C5, R6C6, R6C7, R6C8, R6C9,
	R7C1, R7C2, R7C3, R7C4, R7C5, R7C6, R7C7, R7C8, R7C9,
	R8C1, R8C2, R8C3, R8C4, R8C5, R8C6, R8C7, R8C8, R8C9,
	R9C1, R9C2, R9C3, R9C4, R9C5, R9C6, R9C7, R9C8, R9C9 ):-
	print(R1C1, R1C2, R1C3, R1C4, R1C5, R1C6, R1C7, R1C8, R1C9),
	print(R2C1, R2C2, R2C3, R2C4, R2C5, R2C6, R2C7, R2C8, R2C9),
	print(R3C1, R3C2, R3C3, R3C4, R3C5, R3C6, R3C7, R3C8, R3C9),
	print(R4C1, R4C2, R4C3, R4C4, R4C5, R4C6, R4C7, R4C8, R4C9),
	print(R5C1, R5C2, R5C3, R5C4, R5C5, R5C6, R5C7, R5C8, R5C9),
	print(R6C1, R6C2, R6C3, R6C4, R6C5, R6C6, R6C7, R6C8, R6C9),
	print(R7C1, R7C2, R7C3, R7C4, R7C5, R7C6, R7C7, R7C8, R7C9),
	print(R8C1, R8C2, R8C3, R8C4, R8C5, R8C6, R8C7, R8C8, R8C9),
	print(R9C1, R9C2, R9C3, R9C4, R9C5, R9C6, R9C7, R9C8, R9C9).

% Function to print a row of the board taking 9 values.
% Adds borders and spacing for readability
print(A, B, C, D, E, F, G, H, I) :- 
write(' | '), write(A), write('  '), write(B), write('  '), write(C),
write(' | '),  write(D), write('  '), write(E), write('  '), write(F),
write(' | '),  write(G), write('  '), write(H), write('  '), write(I), write(' | '), nl.

% prints the initial problem board of 81 elements, somewhich can uninstantiated so special care is needed.
% printInit prints each row
printProblem(R1C1, R1C2, R1C3, R1C4, R1C5, R1C6, R1C7, R1C8, R1C9,
R2C1, R2C2, R2C3, R2C4, R2C5, R2C6, R2C7, R2C8, R2C9,
R3C1, R3C2, R3C3, R3C4, R3C5, R3C6, R3C7, R3C8, R3C9,
R4C1, R4C2, R4C3, R4C4, R4C5, R4C6, R4C7, R4C8, R4C9,
R5C1, R5C2, R5C3, R5C4, R5C5, R5C6, R5C7, R5C8, R5C9,
R6C1, R6C2, R6C3, R6C4, R6C5, R6C6, R6C7, R6C8, R6C9,
R7C1, R7C2, R7C3, R7C4, R7C5, R7C6, R7C7, R7C8, R7C9,
R8C1, R8C2, R8C3, R8C4, R8C5, R8C6, R8C7, R8C8, R8C9,
R9C1, R9C2, R9C3, R9C4, R9C5, R9C6, R9C7, R9C8, R9C9 ):-
printInit(R1C1, R1C2, R1C3, R1C4, R1C5, R1C6, R1C7, R1C8, R1C9),
printInit(R2C1, R2C2, R2C3, R2C4, R2C5, R2C6, R2C7, R2C8, R2C9),
printInit(R3C1, R3C2, R3C3, R3C4, R3C5, R3C6, R3C7, R3C8, R3C9),
printInit(R4C1, R4C2, R4C3, R4C4, R4C5, R4C6, R4C7, R4C8, R4C9),
printInit(R5C1, R5C2, R5C3, R5C4, R5C5, R5C6, R5C7, R5C8, R5C9),
printInit(R6C1, R6C2, R6C3, R6C4, R6C5, R6C6, R6C7, R6C8, R6C9),
printInit(R7C1, R7C2, R7C3, R7C4, R7C5, R7C6, R7C7, R7C8, R7C9),
printInit(R8C1, R8C2, R8C3, R8C4, R8C5, R8C6, R8C7, R8C8, R8C9),
printInit(R9C1, R9C2, R9C3, R9C4, R9C5, R9C6, R9C7, R9C8, R9C9).

% prints 9 elements as a row of a table, adds borders and spacing, uses a special printValueHelper function
printInit(A, B, C, D, E, F, G, H, I) :- 
write(' | '), printValueHelper(A), write('  '), printValueHelper(B), write('  '), printValueHelper(C), 
write(' | '), printValueHelper(D), write('  '), printValueHelper(E), write('  '), printValueHelper(F),
write(' | '), printValueHelper(G), write('  '), printValueHelper(H), write('  '), printValueHelper(I), write(' | '), nl.

% takes care of uninstantiated elements by printing an 'x' instead, else it prints the number
printValueHelper(X) :-
  (var(X) -> write('x') ; write(X)).

% Define the universe of discourse
num(1). num(2). num(3). num(4). num(5). num(6). num(7). num(8). num(9).
