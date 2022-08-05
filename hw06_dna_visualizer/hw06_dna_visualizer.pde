boolean strandMatch(String strand0, String strand1) {
  if (strand0.length()!=strand1.length()) {
    return false;
  }
  for (int i=0; i<strand0.length(); i++) {
    if (strand0.charAt(i)=='a') {
      if (strand1.charAt(i)!='t') {
        return false;
      }
    }
    if (strand0.charAt(i)=='t') {
      if (strand1.charAt(i)!='a') {
        return false;
      }
    }
    if (strand0.charAt(i)=='g') {
      if (strand1.charAt(i)!='c') {
        return false;
      }
    }
    if (strand0.charAt(i)=='c') {
      if (strand1.charAt(i)!='g') {
        return false;
      }
    }
  }
  return true;
}

//Returns true if strand0 and strand1 match as described above.
int findCodon(String strand, String codon) {

  for (int i=0; i<strand.length()-2; i++) {
    String tmp="";
    tmp+=strand.charAt(i);
    tmp+=strand.charAt(i+1);
    tmp+=strand.charAt(i+2);
    if (tmp.equals(codon)) {
      return i;
    }
  }
  return -1;
}
//Returns the index of the first time codon appears in strand
//If codon is not in strand, returns -1.
//You may want to include the contains method from yesterday in
boolean containsProtein(String dna) {
  int counter=0;
  for (int i=0; i<dna.length(); i++) {
    if (dna.charAt(i)!='a'
      &&
      dna.charAt(i)!='t'
      &&
      dna.charAt(i)!='c'
      &&
      dna.charAt(i)!='g') {
      counter+=1;
    }
  }
  if (dna.contains("atg") &&
    (dna.contains("taa") || dna.contains("tga") || dna.contains("tag"))
    &&
    (dna.length()>= 21)&& counter==0) {
    //if the dna has a t c and g ONLY
    //then we're good
    //how do we check?
    return true;
  } else {
    return false;
  }
}
//Returns true if dna contains an entire protein.
//For our purposes, a DNA sequence contains a protein if it has a start codon, an end codon, and at least 5 codons between those 2. (this is not biologically accurate).
String getProtein(String dna) {
  println(containsProtein(dna));
  if (containsProtein(dna)) {
    int endCodonIndex=0;

    int startCodonIndex= (findCodon(dna, "atg"));
    if (dna.contains("taa")) {
      endCodonIndex= (findCodon(dna, "taa"));
    } else if (dna.contains("tga")) {
      endCodonIndex= (findCodon(dna, "tga"));
    } else if (dna.contains("tag")) {
      endCodonIndex= (findCodon(dna, "tag"));
    }
    String jesus=dna.substring(startCodonIndex, endCodonIndex);
    println(jesus);
  }
  return "";
}
/*======
 
 
 COPYPASTA FROM HW 5
 
 
 ======*/
void drawBase(char base, int x, int y, int sz) {
  noStroke();
  if (base=='a') {
    fill(255, 0, 255);
    //purple if adenine
  }
  if (base=='t') {
    fill(255, 255, 0);
  }
  //yellow if thymine
  if (base=='c') {
    fill(0, 0, 255);
  }
  //blue if cytosine
  if (base=='g') {
    fill(0, 255, 0);
  }
  //green if guanine

  square(x, y, sz);
  fill(0);
  //coloring black for now (for the text)
  textSize(sz);
  text(base, x, y+sz*3/4);
}
//Draws a single base in a square at (x, y) with sidelength sz.
//The squares should have no stroke, and each nucleotide should be given a different color.
//The letter for the nucleotide should be displayed within the square in a color that is easy to see.
void drawStrand(String dna, int x, int y, int sz) {
  for (int i=0; i< dna.length(); i++) {
    drawBase(dna.charAt(i), x+i*sz, y, sz);
    //each base will shift over one sz side length each time
  }
}
//Draws the entire dna strand starting at (x, y) using sz for the size of each square.
//This method should call drawBase.

void strandCompare(String strand0, String strand1, int x, int y, int sz) {
  drawStrand(strand0, x, y, sz);
  drawStrand(strand1, x, y+sz, sz);
  //which one is longer?
  //if (string0.length() > strand1.length()) return;
  println(strand0.length());
  for (int i=0; i<strand0.length(); i++) {
    println((strand0.charAt(i)=='a') &&(strand1.charAt(i)!='t'));
    println(i);
    if ((strand0.charAt(i)=='a') &&(strand1.charAt(i)!='t')) {
      stroke(255, 0, 0);
      strokeWeight(2);
      fill(0, 0);
      rect(x*i, y*i, sz, sz*2);
    }


    if ((strand0.charAt(i)=='t') && (strand1.charAt(i)!='a')) {
      stroke(255, 0, 0);
      strokeWeight(2);
      fill(0, 0);
      rect(x*i, y, sz, sz*2);
    }
    if ((strand0.charAt(i)=='g')&&(strand1.charAt(i)!='c')) {
      stroke(255, 0, 0);
      strokeWeight(2);
      fill(0, 0);
      rect(x*i, y, sz, sz*2);
    }

    if ((strand0.charAt(i)=='c')&&(strand1.charAt(i)!='g')) {
      stroke(255, 0, 0);
      strokeWeight(2);
      fill(0, 0);
      rect(x*i, y, sz, sz*2);
    }
  }
}


//for (int i=0; i<strand0.length(); i++) {
//  String tmp0="";
//  String tmp1="";
//  tmp0+=strand0.charAt(i);
//  tmp1+=strand1.charAt(i);
//  //highlight a red border around nucleotide
//  stroke(255, 0, 0);
//  strokeWeight(2);
//  line(x*i, y*i, x+sz, y);
//  //top left to top right
//  line(x * i + sz, y * i, x * i + sz, y * i + sz);
//  //top right to bottom right
//  line(x * i + sz, y * i + sz, x * i, y * i + sz);
//  //bottom right to bottom left
//  line(x * i, y * i + sz, x * i, y * i);
//  //bottom left to top left
//  //if (!(tmp0.equals(tmp1))) { //if value of two chars are the same... then....

//  //}


//Draws strand0 directly above strand1.
//If there is a nucleotide mismatch, draw a red border around the nucleotide.
void showProtein(String dna, int x, int y, int sz) {
  drawStrand(dna, x, y, sz);
  //first draw the strand
  String jesus= getProtein(dna);
  drawStrand(jesus, x, y, sz);
  //line(x
}
//Draws dna, assume that it contains volid code for a protein.
//Draws a rectangle under the entire start codon.
//Draws a rectangle under the entire ending codon.
String protein0 = "atgtcgcagctcgaaccactgtga";
String protein1 = "tcgatgcagctcgaaccactgtag";
String noProtein0 = "tcgatgcagctcgaaccactg";
String noProtein1 = "tcgcagctcgaaccactgtag";
String noProtein2 = "tcgtagcagctcgaaccactgatg";
String noProtein3 = "atgtcgcagtaactcgaaccactg";
String noProtein4 = "tcgatgcagctcgaacactgtag";

void setup() {
  size(1000, 1000);
  background(0);
  //drawStrand(protein0, 0, 0, 40);
  strandCompare(protein0, protein1, 0, 0, 40);
  //showProtein(protein0,0,0,40);
}
