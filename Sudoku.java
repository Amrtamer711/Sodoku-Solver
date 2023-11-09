public class SudokuSolver {
    int[][] board = new int[9][9];

    public SudokuSolver(int[][] grid) {
        this.board = grid; // class instance variable which is the board being stored so can work on class
                           // directly
    }

    public void solve() {
        if (try_number(0, 0)) // try at first position
        {
            printBoard(); // if successful, print board
        } else {
            System.out.print("No solution can  be found."); // if not, inform user of no solution
        }
    }

    public boolean try_number(int row, int column) {
        if (row == 9) // checking if all board has been completed
        {
            return true; // base case
        }
        if (column == 9) // checking if we should move on to next row
        {
            return try_number(row + 1, 0); // move to next column of same row
        }
        if (this.board[row][column] != 0) // checking if position already filled to skip it
        {
            return try_number(row, column + 1); // skipping position
        }
        for (int i = 1; i <= 9; i++) {
            if (this.board[row][column] == 0) // checking position is empty to fill
            {
                if (check(row, column, i)) // checking if the number from 1-9 selected is valid in that position
                {
                    this.board[row][column] = i; // if valid, put in position
                    if (try_number(row, column + 1))
                        return try_number(row, column + 1); // if valid, after entering, progress and check that further
                                                            // positions complete successfully
                    this.board[row][column] = 0; // if further positions unsuccessful, reset position
                }
            }
        }
        return false;
    }

    public boolean check(int row, int column, int num) {
        for (int i = 0; i < 9; i++) {
            if (this.board[row][i] == num || this.board[i][column] == num) // checks if number is in row or column of
                                                                           // position
            {
                return false; // return invalid, so must pick another number if number is in row or column
            }
        }
        int boxStartRow = row - row % 3; // finding starting row of number the box is in
        int boxStartColumn = column - column % 3; // finding starting column of the number the box is in
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                if (this.board[boxStartRow + i][boxStartColumn + j] == num) // checking number is unique in its box
                {
                    return false; // if not unique, return invalid
                }
            }
        }
        return true;
    }

    public void printBoard() { // function to visualize board
        for (int i = 0; i < 9; i++) {
            if (i % 3 == 0) {
                System.out.println("++---+---+---++---+---+---++---+---+---++");
                System.out.println("++---+---+---++---+---+---++---+---+---++");
            }
            System.out.print("|| ");
            for (int j = 0; j < 9; j++) {
                System.out.print(this.board[i][j] + " ");
                if (j % 3 == 2)
                    System.out.print("|| ");
                else
                    System.out.print("| ");
            }
            System.out.println();
        }
        System.out.println("++---+---+---++---+---+---++---+---+---++");
        System.out.println("++---+---+---++---+---+---++---+---+---++");
    }

    public static void main(String[] args) {
        int[][] board = {
                { 5, 3, 0, 0, 7, 0, 0, 0, 0 },
                { 6, 0, 0, 1, 9, 5, 0, 0, 0 },
                { 0, 9, 8, 0, 0, 0, 0, 6, 0 },
                { 8, 0, 0, 0, 6, 0, 0, 0, 3 },
                { 4, 0, 0, 8, 0, 3, 0, 0, 1 },
                { 7, 0, 0, 0, 2, 0, 0, 0, 6 },
                { 0, 6, 0, 0, 0, 0, 2, 8, 0 },
                { 0, 0, 0, 4, 1, 9, 0, 0, 5 },
                { 0, 0, 0, 0, 8, 0, 0, 7, 9 }
        };
        // example board
        SudokuSolver main = new SudokuSolver(board);
        main.printBoard(); // board before solving
        System.out.println("");
        main.solve(); // solve and display function
    }
}
