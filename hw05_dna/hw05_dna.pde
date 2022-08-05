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
    ((dna.length()>= 21)&& counter==0)) {
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
      endCodonIndex= (findCodon(dna, "taa"))+3;
    } else if (dna.contains("tga")) {
      endCodonIndex= (findCodon(dna, "tga"))+3;
    } else if (dna.contains("tag")) {
      endCodonIndex= (findCodon(dna, "tag"))+3;
    }
    String jesus=dna.substring(startCodonIndex, endCodonIndex);
    println(jesus);
  }
  return "";
}
//If dna contains a protein sequence (as defined above), returns the substring of dna that contains the first entire protein sequence, including the start and stop codons.
//Otherwise, returns the empty String ("")
//The following strings can be used to test the protein functions:

String protein0 = "atgtcgcagctcgaaccactgtga";
String protein1 = "tcgatgcagctcgaaccactgtag";
//for testing protein matching func (strandMatch(protein1, protein2))
String proteinMatch1T="atgc";
String proteinMatch0T="tacg";
//testing for codon index finder method
String startCodon="atg";
String falseCodon="att";
String endCodon="tga";

String noProtein0 = "tcgatgcagctcgaaccactg";
String noProtein1 = "tcgcagctcgaaccactgtag";
String noProtein2 = "tcgtagcagctcgaaccactgatg";
String noProtein3 = "atgtcgcagtaactcgaaccactg";
String noProtein4 = "tcgatgcagctcgaacactgtag";
void setup() {
  println(getProtein(protein0));
  println(getProtein(protein1));
  
  
  println(strandMatch(proteinMatch1T, proteinMatch0T));
  
  
  println(findCodon(protein0, startCodon));
  println(findCodon(protein0, falseCodon));
  println(findCodon(protein0, endCodon));
  
}
