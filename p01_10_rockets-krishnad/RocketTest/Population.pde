class Population {
  Individual populating[];
  float mutRate;
  float totFitness;
  Population(int size) {
    populating=new Individual[size];
    mutRate=0.05;
    totFitness=0;
  }
  void randGenerate() {
    for (int i=0; i< populating.length; i++) {
      populating[i]=new Individual(true);
    }
  }//randGenerate
  Individual select(int index) {
    Individual tmp=new Individual(true);
    for (int i=0; i<populating.length; i++) {
      if (i==index) {
        tmp=populating[i];
      }
    }
    return tmp;
  }
  void setFitness(PVector target) {
    totFitness=0;
    for (int i=0; i< populating.length; i++) {
      populating[i].setFitness(target);
      totFitness+=populating[i].fitness;
    }
  }
  int indOfBestFit() {
    Individual mex=new Individual(true);
    mex=populating[0];
    int a =0;
    float b=0;
    for (int i=0; i<populating.length; i++) {
      if (populating[i].fitness>mex.fitness) {
        mex=populating[i];
      }
      b=mex.fitness;
    }
    for (int i = 0; i < populating.length; i++) {
      if (populating[i].fitness == b) {
        a = i;
      }
    }
    return a;
  }

  void Runs() {
    for (int i = 0; i < populating.length; i++) {
      populating[i].Run();
    }
  }
  void display(boolean showFitness) {
    for (int i=0; i<populating.length; i++) {
      populating[i].display(showFitness);
    }
  }
  Individual select() {
    Individual tmp=new Individual(true);
    float sum=0;
    float count=0;
    for (int i=0; i<populating.length; i++) {
      sum+=populating[i].fitness;
    }
    float targ=random(sum);
    for (int i=1; i<populating.length; i++) {
      count+=populating[i].fitness;
      if (targ<count) {
        tmp=populating[i-1];
      }
    }
    return tmp;
  }
  Population matingSeason() {
    Population tmp=new Population(populating.length);
    tmp.populating[0]=populating[indOfBestFit()];
    Individual a=new Individual(true);
    Individual b=new Individual(true);
    Individual c= new Individual(true);
    for (int i=1; i<tmp.populating.length; i++) {
      tmp.mutRate=mutRate;
      a=select();
      b=select();
      c=a.mate(b);
      c.mutate(tmp.mutRate);
      tmp.populating[i]=c;
    }
    int ascent=int(random(1, popSize));
    tmp.populating[ascent]=populating[indOfBestFit()];
    return tmp;
  }
  float bestFit() {
    Individual mex=new Individual(true);
    mex=populating[0];
    float b=0;
    for (int i=0; i< populating.length; i++) {
      if (populating[i].fitness>mex.fitness) {
        mex=populating[i];
      }
      b=mex.fitness;
    }
    return b;
  }//bestFit
  float avgFit() {
    int saizu=populating.length;
    float a=totFitness/saizu;
    return a;
  }//avgFit
  void highlight() {
    noFill();
    stroke(200, 180, 0);
    float x=populating[indOfBestFit()].phenotype.position.x;
    float y=populating[indOfBestFit()].phenotype.position.y;
    rect(x, y, 20, 20);
  }
}
