int NUM_MOVES = 250;
int moveCount;
int popSize=20;
String GenNum="1";
Rocket r;
PVector target;
Population a;
Individual targer;

void setup() {
  size(500, 500);
  target= new PVector(400, 250);
  a=new Population(popSize);
  targer=new Individual(true);
  a.randGenerate();
  moveCount=0;
  println("Generation: " + GenNum);
}

void draw() {
  background(255);
  stroke(0);
  fill(255, 0, 0);
  rect(target.x, target.y, 20, 20);
  if (moveCount < NUM_MOVES) {
    a.Runs();
    a.display(false);
    moveCount++;
  } else {
    a.setFitness(target);
    a.avgFit();
    a.display(true);
    a.highlight();
  }
}
void keyPressed() {
  if (key=='g') {
    GenNum+=1;
    moveCount=0;
    a=a.matingSeason();
    a.setFitness(target);
    println("Generation: " + GenNum);
    println("Total Fitness: "  + a.totFitness);
    println("Average Fitness: " + a.avgFit());
  }
  if (key=='z') {
    moveCount=0;
    a.randGenerate();
    println("Generation No 1");
  }
}
  void runAgain() {
    delay(2000);
    moveCount=0;
    a=a.matingSeason();
  }
