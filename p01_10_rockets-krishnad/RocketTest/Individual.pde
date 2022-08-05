class Individual {

  static final int ANGLE_GENE = 8;
  static final int MAG_GENE=8;


  Rocket phenotype;
  Gene[] vector_a;
  Gene[] vector_m;
  float fitness;


  Individual(boolean random) {

    vector_a = new Gene[NUM_MOVES];
    vector_m=new Gene[NUM_MOVES];
    if (random) {
      for (int i=0; i< vector_a.length; i++) {
        vector_a[i]=new Gene(ANGLE_GENE);
        vector_m[i]=new Gene(MAG_GENE);
      }

      setPhenotype();
    }
  }//constructor

  void setPhenotype() {
    float[] mag=new float[NUM_MOVES];
    float[] engel=new float[NUM_MOVES];
    PVector[] vitale= new PVector[NUM_MOVES];
    for (int i=0; i<mag.length; i++) {
      mag[i]=vector_m[i].getVal()/2550.0;
      engel[i]=vector_a[i].getVal()/255.0*(2*PI);
    }
    for (int i=0; i<engel.length; i++) {
      vitale[i]=new PVector(cos(engel[i]), sin(engel[i]));
    }
    phenotype=new Rocket(vitale, mag, NUM_MOVES);
  }

  Individual mate(Individual waifu) {
    Individual child = new Individual(true);
    int a=int(random(0, 100));
    if (a<50) {
      for (int i=0; i< NUM_MOVES; i++) {
        child.vector_a[i]=new Gene(waifu.vector_a[i]);
        child.vector_m[i]=new Gene(waifu.vector_m[i]);
      }
      for (int i=1; i< NUM_MOVES; i++) {
        child.vector_a[i]=new Gene(vector_a[i]);
        child.vector_m[i]=new Gene(vector_m[i]);
      }
    } else {
      for (int i=0; i< NUM_MOVES; i++) {
        child.vector_a[i]=new Gene(waifu.vector_a[i]);
        child.vector_m[i]=new Gene(waifu.vector_m[i]);
      }
    }
    child.setPhenotype();
    return child;
  }//mate
  void setFitness(PVector target) {
    fitness=1;
    float calculator= sqrt(pow(phenotype.position.x - target.x, 2) + pow(phenotype.position.y - target.y, 2)) / 1000.;
    fitness=fitness-calculator;
    if (phenotype.position.x>width
      ||
      phenotype.position.x < 0
      ||
      phenotype.position.y > height
      ||
      phenotype.position.y < 0) {
      fitness=0;
    }
  }
  void mutate(float rate) {
    for (int g=0; g < NUM_MOVES; g++) {
      if (random(1) < rate) {
        vector_a[g].mutate();
        vector_m[g].mutate();
        setPhenotype();
      }
    }
  }//mutate

  void display(boolean showFitness) {
    phenotype.display();
    if (showFitness) {

      //println(fitness);
      textSize(15);
      fill(0);
      textAlign(CENTER);
      text(fitness, phenotype.position.x, phenotype.position.y);
    }
  }//display()

  String toString() {
    String s = "";
    for (int i=0; i<vector_a.length; i++) {
      s+= vector_a[i] + "\n";
    }
    for (int i=0; i<vector_m.length; i++) {
      s+= vector_m[i] + "\n";
    }
    return s;
  }//toString()
  void Run() {
    phenotype.run();
  }
}//Individual
