class Individual {
  int SIDES_GENE_LENGTH=5;
  Gene chromosome[];
  RegularGon Phenotype;
  float fitness;
  //fields
  Individual(Boolean randind) {
    chromosome = new Gene[5];
    if (randind==true) {
      for (int i=0; i< chromosome.length; i++) {
        chromosome[i]=new Gene(5);
      }
      setPhenotype();
    }
  }
  //constructors
  void setPhenotype() {
 
    RegularGon Phenotype;
    for (int i=0; i<chromosome.length; i++) {
      chromosome[i].setValue();
    }
    int rGonSides=chromosome[0].value;
    int rGonLength=chromosome[1].value;
    int rGonSpin=chromosome[2].value;
    int rGonColor=color(chromosome[3].value,chromosome[3].value,chromosome[3].value);
    Phenotype= new RegularGon(rGonSides, rGonLength, float(rGonSpin),rGonColor);
  }
  void Mutate(float rate) {
    for (int i=0; i< chromosome.length; i++) {
      if (int(random(100))<rate) {
        chromosome[i].mutate();
      }
    }
  }
  String toString() {
    String counter="";
    for (int i=0; i<4; i++) {
      return chromosome[i].toString();
    }
    return counter;
  }
  void display(int x, int y, boolean showFitness) {
    Phenotype.display(x, y);
    if (showFitness==true) {
      textSize(50);
      fill(0);
      text("fitness", x,y);      
    }
  }

  //methods
}
