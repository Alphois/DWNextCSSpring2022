/*======
 Java Strings
 Strings are objects that sotre one or more char values in an array.
 Like all object variables, String variables refer to String objects in memory.
 String values are immutable, meaning they can't be changed.
 
 When you use "" in your code, you create a string literal
 -Java sets aside a specific area of memory to store all String literals from a program while it is running.
 -If the same String literal is repeatedly used in code, all thsoe references are to the same String Object
 
 ======*/
String s0;
String s1;
String s2;
String s3;
s0="hi";

s1=new String("hi");

s2="hi";
s3=new String("hi");
println("s0:"+s0+" s1: " + s1);
println(s0==s1);

//this is false because it is checking whether or not the spaces in memory
//are the same when u use the constructor, then what ends up happening is that
// they compare the actual objects (the location in memory) instead
println(s2==s0);
//this is true because they are both the same string literal
println(s3==s1);
//this is  false cause two diff objects
s1=s0;
s0="high";
s1+="gh";
//"gh" literal is being created
//+= has a hidden "call" to the string constructor,
//makes a new string being large enough to hold all the chars and copies them all over
//thus, it prints false
println("s0: " + s0 + " s1: " + s1);
println(s0 == s1);
//.equals()
//s0.compareTo(s1)
//returns 0 if s0 and s1 VALUES are equal
//A negative val if s0 < s1
// positive if s0 > s1
// COmparisons are done lexigraphically, which means lower values would show up
//earlier if sorted alphabetically
//uppercase shows up before lowercase because uppercase has lower ASCII
//s0.subString(int start, int end)
//return a new String with the characters from s0 starting at index start and ending at index -1
//in other words, exclusive of end, inclusive of start
