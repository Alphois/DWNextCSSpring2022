class Gene {

  int geneLength;
  int genotype[];
  //useful to have the value as an instance
  //variable so we don't have to repeatedly
  //convert the array to a number.
  int value;

  /*
    Generate a new gene of the given length.
   Initilize geneLength and the array accordingly.
   Randomly populate the gene with 1s or 0s.
   
   Call setValue() once the array has been populated.
   */
  Gene(int gl) {
    geneLength = gl;
    genotype = new int[geneLength];
    for (int i=0; i < geneLength; i++) {
      genotype[i] = int(random(2));
    }//random loop
  }//constructor

  /*
    Create a new Gene that is a copy of the
   parameter. Remember that arrays behave
   like objects, so you cant do this:
   genotype = g.genotype.
   */
  Gene(Gene g) {
    geneLength = g.geneLength;
    genotype = new int[g.geneLength];
    arrayCopy(g.genotype, genotype);
  }

  void setValue() {
    value = 0;
    for (int i=0; i < geneLength; i++) {
      int bit = genotype[i];
      value+= int( bit * pow(2, i));
    }//random loop
  }//setValue

  void mutate() {
    int r = (int)random(geneLength);
    genotype[r] = (genotype[r] + 1) % 2;
    setValue();
  }//mutate

  String toString() {
    String s = "";
    for (int i=0; i<geneLength; i++) {
      s+= genotype[i];
    }
    s+= " " + value;
    return s;
  }//toString
  int getVal() {
    int v = 0;
    int tmpVal = 1;
    for (int i = 0; i < genotype.length; i++) {
      v += genotype[i] * tmpVal;
      tmpVal *= 2;
    }
    return v;
  }
} //Gene
