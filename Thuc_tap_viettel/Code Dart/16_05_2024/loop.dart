void main(List<String> args) {
  List list = [];

  for (int i = 0; i<20;i+=2){
    list.add(i);
  }
  print(list);

 num sum =0;
 list.forEach((element) {
  sum  += element;
 });
 print(sum);

// vòng lặp while
num i = 0;
 while(i<5){
  print("hello");
  i++;
 }

 // vòng  lặp  do while

 do {
    print("while-do");
    i++;
  } while (i < 5);

  
}