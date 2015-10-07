# tictactoe

## instructions
  1. please clone to your local machine
  2. from the terminal, cd into tictactoe/lib 
  
      `$ cd tictactoe/lib`

  3. run the controller with
  
      `$ ruby controller.rb`

  4. follow the instructions and have fun!


##info
  1. win detection: I created four methods for looking for a win: a row check, a column check, a tie check, and a diagonal check. The row check iterates through each row of the board and checks to see if all the spaces are the same and if they are NOT equal to the board space ('_'), and returns the winning value if it exists. The columns check uses the row check, but transposes the board, so essentially the columns become the rows before the row check runs. The next check I run the diagonal check. first I create a range from 1 to the size of the board and collect the diagonal values from the top left to the bottom right. This works nicely because if you have two indices and add one to each, you'll move diagonally through the matrix. Next I get the other diagonal row, by doing the same thing, but starting at the bottom left of the matrix and moving to the top right. If either of these new arrays have only unique values that are not the blank space, then I return the unique value. Finally, I check to see if the board is a tie. Since this is my last check and I know there aren't any winners, I can simply check to see if there are any space values left on the board. If not, it's a tie.
  2. Computer: the computer should be unbeatable. I am using the minimax algorithm recursively to accomplish this. That said, I tried doing this with a 4x4 board and the minimax method took too long to run. Currently I'm only letting use a 3x3 board, but want to look into making a larger board work with the minimax method.

## Things I would focus on with more time
  1. Tests! I didn't write many tests here - just some board rspec tests.  Moving forward, I would write tests for all of my classes. Feel free to run them by
  
    `$ cd tictactoe/spec`
    `$ rspec board_spec.rb`
  
  2. Refactoring. I tried to make this pretty DRY, but there is alway room for improvement.
  3. Creating a run.rb. I think it would make the most sense to have a run.rb file that requires all of my files and kicks off game so you could do 'ruby run.rb' as opposed 'ruby controller.rb'
  4. Update the game so it randomly picks who goes first.
