Name: Krishna Dudani
Name: PARTNER NAME (or remove line)
Class Period: 10

# Wordle Design Document

### Game Engine Questions
1. How do we select the target word?
   * Answer here
   Select the target word randomly:
    generate a random integer from 0 to the length-1 of the actual length of the csv file
    using processing random method
    Then, choose the word at that random index as your target word. 
    
    loadTable("data.csv", "header, tsv")
    use this to load actual csv file:
    https://processing.org/reference/loadTable_.html
   

### Game Interface Questions
1. How do we collect input from the user?
   * Answer here
   Use keypressed:
   every single key from a-z will work. 
   *
   That is extremely annoying to code, so maybe make a keypressed function like this:
   keypressed(char a)
   if int(key) is within the range of the ascii values from a to z
          I know a is 96 or 97? z is something like 122 or 123? at least, for lower case. 
   THEN u take that as an input 
   how to store input: char array as DW suggested in class?
   

### Game File List
1. Main driver file:
   * What will this file do
   1st off, we need the actual grid for the wordle.
    void Grid(int targetWordLength ){
    draw grid with targetWord Length * 6 rows
    }
    grid will take up 2/3 of the screen vertically
    keyboard will take up roughly 1/3 instead at the bottom
    
    2nd off, for user input:
    what happens after the keypressed if is triggered?
      First, ensure that the keys that have been entered are less than or equal to the length of the target word
      if it is the target word length already, then do not allow it to be taken as an input anymore. 
      
      We have to record the number of times we have reached the target word threshHold.
      guess counter: add 1 to it each time that the user makes an entire 6 letter guess. 
    
    
2. Other class file
We could actually make a seperate class for the guesses
properties would include index of correct chars with correct placements, 
and index of correct chars with incorrect placements

