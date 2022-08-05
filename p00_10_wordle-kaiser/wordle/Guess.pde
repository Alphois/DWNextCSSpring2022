class Guess {
  //static ints/MODES
  static final int BZZT=0;
  static final int REDEEMABLE=1;
  static final int POG=2;
  //instance
  char[] userAttempt;
  int[] userAttemptAnalyzer;
  String target;
  boolean completedGuess=false;
  //constructor
  Guess(String targ) {
    target=targ;
    userAttempt=new char[target.length()];
    userAttemptAnalyzer=new int[target.length()];
  }

  //methods
  void makeGuess(String userCompletedGuess) { // bottlenecks the guess length to what the user has said so far
    for (int i=0; i<userCompletedGuess.length(); i++) {
      userAttempt[i]=userCompletedGuess.charAt(i);
    }
  }//this method may not actually be needed
  void showUserAttempt() {
    for (int i=0; i<userAttempt.length; i++) {
      print(userAttempt[i]);
    }
    println(" ");
  }
  boolean completedGuess(String target, String file) { //IS THE GUESS ACTUALLY A REAL WORD?
    String[] validWords= split(loadStrings(file)[0], ',');
    boolean tmp=false;
    int tmpCounter=0;
    String tmpString="";
    for (int i=0; i<userAttempt.length; i++) {
      tmpString+=userAttempt[i];
    }
    for (int i=0; i< validWords.length; i++) {
      if (tmpString.equals(validWords[i])) {
        tmpCounter+=1;
      }
    }

    if (tmpCounter==1) {
      tmp=true; //if u find that the given guess is any of the words in the words.csv file
    }
    if (userAttempt.length==target.length()&& tmp==true) {// if userAttempt is the same as target length and tmp boolean shows that userattempt is a real word, set completed Guess to true
      completedGuess=true;
    }
    println(completedGuess);
    return completedGuess; 
  }

  void checkGuess(String target, String file) {// is the guess CORRECT?
  String userCompletedGuess="";
    for (int i=0; i< target.length(); i++) {
      userCompletedGuess+=userAttempt[i];
      } 
    for (int i=0; i< target.length(); i++) {
      if ((target.charAt(i))==(userCompletedGuess.charAt(i)) && completedGuess(target, file)) {
        userAttemptAnalyzer[i]=POG;
      } else {
        for (int j=0; j<target.length(); j++) {
          if (j!=i && (userCompletedGuess.indexOf(target.charAt(i))!=-1) && completedGuess(target, file)) { //if the indices of the letter are not the same (aka what the outer for loop was for)
            userAttemptAnalyzer[i]=(REDEEMABLE);
          } else
            if (completedGuess(target,file)) {
              userAttemptAnalyzer[i]=(BZZT);
            }
        }
        //inner for Loop, runs iff there is no match between user guess and target Guess
      }
    }//outer for Loop
  }
  void checkGuess(String target, String userCompletedGuess, String file) {// is the guess CORRECT?
    for (int i=0; i< target.length(); i++) {
      if ((target.charAt(i))==(userCompletedGuess.charAt(i)) && completedGuess(target, file)) {
        userAttemptAnalyzer[i]=POG;
      } else {
        for (int j=0; j<target.length(); j++) {
          if (j!=i && (userCompletedGuess.indexOf(target.charAt(i))!=-1) && completedGuess(target, file)) { //if the indices of the letter are not the same (aka what the outer for loop was for)
            userAttemptAnalyzer[i]=(REDEEMABLE);
          } else
            if (completedGuess(target,file)) {
              userAttemptAnalyzer[i]=(BZZT);
            }
        }
        //inner for Loop, runs iff there is no match between user guess and target Guess
      }
    }//outer for Loop
  }
  void checkGuess(String target, ArrayList<Character> userCompleteGuessChar) {// same method as above, but it allows the method to take a char arrayList
    String userCompletedGuess="";
    for (int i=0; i< userCompleteGuessChar.size(); i++) {
      userCompletedGuess+=userCompleteGuessChar.get(i);
    }
    for (int i=0; i< target.length(); i++) {
      if ((target.charAt(i))==(userCompletedGuess.charAt(i))) {
        userAttemptAnalyzer[i]=(POG);
      } else {
        for (int j=0; j<target.length(); j++) {
          if (j!=i && (userCompletedGuess.indexOf(target.charAt(i))!=-1)) { //if the indices of the letter are not the same (aka what the outer for loop was for)
            userAttemptAnalyzer[i]=(REDEEMABLE);
          } else {
            userAttemptAnalyzer[i]=(BZZT);
          }
        }//inner for Loop, runs iff there is no match between user guess and target Guess
      }
    }//outer for Loop
  }
  boolean winCond() {
    int counter=0;
    for (int i=0; i< userAttemptAnalyzer.length; i++) {
      if (userAttemptAnalyzer[i]!=POG) {
        counter+=1;
      }
    }
    return (counter==0);
  }
}
