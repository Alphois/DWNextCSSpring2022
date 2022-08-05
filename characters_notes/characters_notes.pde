/*
Char primitive type
 - char c;
 - represents a single character
 - char literals use ''(eg 'q')
 - a.k.a. 'q' not the same as "q"
 - stored as positive integers
 -Encoding: specific mapping of chars and ints example: ASCII (128 chars)/Extended ASCII (256 chars)/Unicode (including other countries,
 so millions of chars) 16 mill limit(?) all emojis are unicode
 - 'a' maps to 97 for example
 --chars are chill ppl so u can do meth with them
 -sorry, I meant math***
 -DIRECTLY onto them
 
 
 */
char c='a';
println(c+3);
//gives you 100 because a has encoding of 97
c+=4;
println(c);
//gives you 'e' for some reason instead of converting to int like earlier(...?)
println(char(c+3));
//gives you 'h' when u convert back to char
for (int i=97; i<100; i++) {
  c=char(i);
  println(c);
}
for (c='a'; c< 'N'; c++) {
  println(c);
}
//wont work becuase lower case is larger than uppercase
for (c='A'; c< 'N'; c++) {
  println(c);
}
//will actually print smthing because capital A IS less than N
