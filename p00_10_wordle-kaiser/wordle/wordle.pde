// doesn't matter what you do
//make random word generator first
Grid wordleGrid;
int numChances=6;
String target;
void setup() {
  size(500, 500);
  background(0);
  target=Bank("words_reasonable.csv"); //this should be a random word by this point
  println(target);
  wordleGrid=new Grid(numChances, target.length(), target);//the constructor is number of guesses, the number of characters in a guess
  for (int i=0; i< numChances; i++) {
    wordleGrid.userDumbassCounter.get(i).makeGuess("     ");
  }
  textSize(160);
  fill(0);
  wordleGrid.userDumbassCounter.get(0).showUserAttempt();
}
void draw() {
  wordleGrid.display(target);
}
//random word generator structure
String Bank(String file) {
  String[] wordBank= split(loadStrings(file)[0], ',');
  String target= wordBank[int(random(0, wordBank.length))];
  return target;
}
void keyPressed() {
  int currGuess=wordleGrid.currentCharacter.guess;
  if (key==BACKSPACE) {
    wordleGrid.removeChar();
  } else {
    if (Character.isLetter(key) && wordleGrid.currentCharacter.character<5) {
      wordleGrid.guessLetter(key);
    } else if (key==RETURN) {
      if (wordleGrid.currentCharacter.character==5) {//if u r at the max # of characters
        if (wordleGrid.userDumbassCounter.get(currGuess).completedGuess(target, "words_reasonable.csv"))//if the guess has been completed, do all these things:
        wordleGrid.userDumbassCounter.get(currGuess).checkGuess(target, "words_reasonable.csv");
          wordleGrid.currentCharacter.guess+=1;
        wordleGrid.currentCharacter.character=0;
      }
    }
  }
}
