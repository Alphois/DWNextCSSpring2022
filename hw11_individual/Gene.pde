class Gene {
  int genotype[];
  int geneLength;
  int value;
  //intance vars
  Gene(int gl) {
    geneLength=gl;
    genotype = new int[gl];
    for (int i=0; i< geneLength; i++) {

      if (int(random(0, 2))==1) {
        genotype[i]=1;
      } else {
        genotype[i]=0;
      }
    }
  }
  Gene(Gene g) {
    this(g.geneLength);

    for (int i=0; i< g.geneLength; i++) {
      this.genotype[i]=g.genotype[i];
    }
  }
  //constructors
  void setValue() {
    int counter=0;
    for (int i=geneLength-1; i>0; i--) {
      float val=genotype[i]*pow(2, i);
      counter+=val;
    }
    this.value+=counter;
  }
  void mutate() {
    int upper=this.geneLength;
    int lower=0;
    if (genotype[int(random (lower, upper))]==0) {
      genotype[int(random (lower, upper))]=1;
    } else {
      genotype[int(random (lower, upper))]=0;
    }
  }
  String toString() {
    String Charles="";
    for (int i=0; i< geneLength; i++) {
      char c= char(genotype[i]+'0');
      Charles+=c;
    }
    setValue();
    return (Charles+" " + this.value);
  }
}
