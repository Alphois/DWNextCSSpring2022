int POP_ROWS = 6;
int POP_COLS = 7;
int POPULATION_SIZE = POP_COLS * POP_ROWS;

//A shape should always fit within a MAX_SIZE x MAX_SIZE square
int MAX_SIZE = 100;
//This allows us to account for the gridlines that will be drawn
int OFFSET = 1;

//Max number of sides for a RegularGon
int MAX_SIDES = 20;
//Max number of points for a PathShape
int MAX_POINTS = 10;

//Used when we need to check what kind of PathShape to use
int REGS = 0;
int TRIS = 1;
int PATHS = 2;

//Array of PathShapes to work with
PathShape population[];


/* ============================
 ============================ */
/*
void settings() {
 size(POP_COLS*MAX_SIZE + (POP_COLS-1)*OFFSET,
 POP_ROWS*MAX_SIZE + (POP_ROWS-1)*OFFSET);
 }
 */

void setup() {
  //this is calculated based on POP_COLS, POP_ROWS, MAX_SIZE and OFFSET
  size(706, 605);
  background(0);

  population = new PathShape[POPULATION_SIZE];
  populate(REGS);
}//setup

/* ============================
 ============================ */
void draw() {
  background(0);
  drawGrid();
  drawPop();
}

/* ============================
 Loop through the population array and call
 display on each object.
 ============================ */
void drawPop() {
  for (int i=0; i< POPULATION_SIZE; i++) {
    population[i].display();
  }
}//drawPop


/* ============================
 Generate a random RegularGon with the following constraints:
 
 It should have at least 3 sides and at most MAX_SIDES sides.
 The RegularGon should fit inside a single MAX_SIZE x MAX_SIZE square.
 The radius of the RegularGon should be at least 5.
 ============================ */
RegularGon makeRegularGon(int left_x, int top_y) {
  int radius=int(random(5, MAX_SIZE/2));
  int sides= int(random(3, MAX_SIDES));
  int x=left_x + MAX_SIZE/2;
  int y=top_y + MAX_SIZE/2;
  return new RegularGon(left_x, top_y, radius, sides);
}//makeRegularGon


/* ============================
 Generate a random TriangleGon with the following constraints:
 
 The TriangleGon should fit inside a single MAX_SIZE x MAX_SIZE square.
 You should create the TriangleGon by generating 3 random points that
 satisfy the condition above.
 ============================ */
TriangleGon makeTriangleGon(int left_x, int top_y) {
  TriangleGon tg = new TriangleGon();
  int sides=3;
  int radius;
  int x=left_x + MAX_SIZE/2;
  int y=top_y + MAX_SIZE/2;
  return RegularGon;
}//makeTriangleGon

/* ============================
 Generate a random PathShape with the following constraints:
 
 The PathShape should fit inside a single MAX_SIZE x MAX_SIZE square
 and have at most MAX_POINTS vertices.
 You should create the PathShape by generating random points that
 satisfy the conditions above.
 ============================ */
PathShape makePathShape(int left_x, int top_y) {
  PathShape ps = new PathShape();
  int right_x=left_x + MAX_SIZE-5;
  int bottom_y=top_y + MAX_SIZE-5;
  int numPoints=int(random(3, MAX_POINTS));
  for (int i=0; i< population.length; i++) {
    population[i].display();
  }
  return ps;
}//makePathShape

/* ============================
 A valid TriangleGon has an area of at least 300.
 Returns true/false based on that condition.
 ============================ */
boolean isValidTriGon(PathShape tg) {

  return true;
}

/* ============================
 A valid PathShape is one where the centroid is within
 the MAX_SIZE x MAX_SIZE box with (left_x, top_y) as
 the top-left corder.
 Returns true/false based on that condition.
 ============================ */
boolean isValidPathShape(PathShape ps, int left_x, int top_y) {
  return true;
}

/* ============================
 Fills the population array by calling
 makeShape with the correct parameters.
 ============================ */
void populate(int type) {
}//populate

/* ============================
 Calls the correct shape making and isValid
 method for the given shape type and position.
 
 The coordinates should represent the top-left
 corener of a MAX_SIZE x MAX_SIZE square that
 will contain the shape.
 
 RegularGons made according to the instructions for
 makeRegularGon are always valid.
 ============================ */
PathShape makeShape(int type, int left_x, int top_y) {
  boolean valid = false;
  PathShape ps = null;
  if (type==PATHS) {
    ps=new PathShape(left_x,top_y, 
  }
  while (!valid) {
  }//regenerate Shapes
  return ps;
}


/* ============================
 ============================ */
void drawGrid() {
  stroke(255);
  for (int i=1; i < POP_COLS; i++) {
    int x = i * (MAX_SIZE + OFFSET);
    line(x, 0, x, height-1);
  }//row dividers

  for (int i=1; i < POP_ROWS; i++) {
    int y = i * (MAX_SIZE + OFFSET);
    line(0, y, width-1, y);
  }//column dividers
}//drawGrid


void keyPressed() {
  if (key == 'r') {
    populate(REGS);
  } else if (key == 't') {
    populate(TRIS);
  } else if (key == 'p') {
    populate(PATHS);
  }
}
