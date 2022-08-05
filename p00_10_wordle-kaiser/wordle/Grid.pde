class Grid {
  //instance
  ArrayList<Guess> userDumbassCounter;
  int wordLength;
  int guessesAllowed;
  IndexLogger currentCharacter;
  boolean gameWon=false;

  //constructor
  //initialize the array of guesses
  Grid(int x, int wordLeng, String target) {
    guessesAllowed=x;
    userDumbassCounter=new ArrayList<>();
    for (int i=0; i<guessesAllowed; i++) {
      userDumbassCounter.add(new Guess(target));
    }
    wordLength=wordLeng;
    currentCharacter=new IndexLogger(0, 0);
  }
  //methods
  void display(String target) {
    int startingX= (width/5)/2;
    float xIncrement=((width*0.8)/wordLength);
    float endY=height/2.0;
    float yIncrement=(endY/guessesAllowed);
    //println(yIncrement);
    //starting Y is just gonna be 0
    fill(255);

    for (int i=0; i< userDumbassCounter.size(); i++) {//rows
      for (int j=0; j<target.length(); j++) {//cols
        rectMode(CORNER);
        Guess currGuess=userDumbassCounter.get(i);
        //now right here u need to check the userAttemptAnalyzer to set the fill color for the rectangle
        for (int k=0; k< currGuess.userAttemptAnalyzer.length; k++) {
          println(currGuess.userAttemptAnalyzer[k]);
        }
        if (currGuess.userAttemptAnalyzer.length==target.length()) {
          if (currGuess.userAttemptAnalyzer[j]==Guess.POG) {
            fill(0, 255, 0);
          } else
            if (currGuess.userAttemptAnalyzer[j]==Guess.BZZT) {
              fill(200);
            } else
              if (currGuess.userAttemptAnalyzer[j]==Guess.REDEEMABLE) {
                fill(255, 255, 0);
              }
        }
        rect(startingX+j*xIncrement, 0+i*yIncrement, xIncrement, yIncrement);
        //println("startX: "+startingX+i*xIncrement);
        //println("StartY: "+0+i*xIncrement);
        //so for each rectangle u actually make, u need a letter:
      }
    } //creates the actual grid
    fill(0);
    for (int i=0; i<userDumbassCounter.size(); i++) {
      for (int j=0; j<userDumbassCounter.get(i).userAttempt.length; j++) { //the difference is that this inner loop only iterates through till userAttemptsize rather than targetLength
        char textToPrint=userDumbassCounter.get(i).userAttempt[j];//indexing the char in each guess of the guess arrayList
        textSize(yIncrement);
        fill(0);
        rectMode(CENTER);
        text(textToPrint, startingX+j*xIncrement+20, 0+(i+0.75)*yIncrement);
      }
    }//draws in the characters for each guess into the grid
  }
  void guessLetter(char x) {
    if (currentCharacter.guess<6 && currentCharacter.character<5) {
      Guess currGuess=userDumbassCounter.get(currentCharacter.guess);// if all the code works, replace this where necesary to make readable*
      String tmp="";
      for (int i=0; i< currGuess.userAttempt.length; i++) {
        tmp+=currGuess.userAttempt[i];
      }
      if (currentCharacter.guess<=guessesAllowed) {
        currGuess.userAttempt[currentCharacter.character]=x; //dacounter's index=guess --> modify user attempt at index to char
        currentCharacter.character+=1;
      }
    }
  }
  //void makeGuess(String target, String file) {
  //  Guess currGuess=userDumbassCounter.get(currentCharacter.guess);// if all the code works, replace this where necesary to make readable*
  //  //1) is the guess completed?
  //  //a) to do the call completed Guess
  //  //2) verify that the guess is a real word:

  //  if (currentCharacter.guess<=guessesAllowed) {
  //    if ((currGuess.completedGuess(target, file))) {//is it a real word first off?
  //      //if it is a real word; now u need to screen for whether or not the game is won:
  //      String tmp="";
  //      for (int i=0; i< currGuess.userAttempt.length; i++) {
  //        tmp+=currGuess.userAttempt[i];
  //      }
  //      currGuess.checkGuess(target, tmp, file);//check the user guess against target word
  //      gameWon=currGuess.winCond();
  //      currentCharacter.guess+=1;//increment guess counter
  //      currentCharacter.character=0;//reset char to 0
  //    } else {
  //      println(currGuess.completedGuess(target, file));
  //      //a)if its not a real word then what u do basically; reset the IndexLoggers char value!
  //      currentCharacter.character=0;
  //    }
  //  }
  //  //then have the guess object call makeGuess
  //}//makeGuess()

  void removeChar() {
    if (userDumbassCounter.get(currentCharacter.guess).userAttempt.length>0 && currentCharacter.character>0) {
      Guess currGuess=userDumbassCounter.get(currentCharacter.guess);// if all the code works, replace this where necesary to make readable*

      currGuess.userAttempt[currentCharacter.character-1]=' ';
      currentCharacter.character-=1;

      println(currentCharacter.character);
    }
  }
}
