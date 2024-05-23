void main(List<String> args) {
  List pair =[2,4];
//if case
  if (pair case [int x, int y]) {
  print('Was coordinate array $x,$y');
} else {
  throw FormatException('Invalid coordinates.');
}
// if-else
 int a = 2;
 if(a==2) print("a đúng bằng $a");
 else print('a không bằng 2');

 // if-else if-else

 num avr = 5;
 if(avr >= 6){
  print("very good");
 }else if( avr ==5){
  print("good");
 }else {
  print("not good");
 }

 // swich- case
 var key = "coffee shope";

 switch(key){
  case "coffee shope" : 
    print("we will go to coffee shope");

  case "home"         : 
    print("we will come home");
 }
 
 //If-case statement với guard clause
 num input = 15;
 if (input case int value when value >= 10 && value <= 20) {
    print('Value is between 10 and 20');
  } else {
    print('Value is not between 10 and 20');
  }

}