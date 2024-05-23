

void main(List<String> args) {

  printAString("xin chào");

  
  print(tinhTong(1, 2));

  compareTwoString(str1: "hello", str2: "abcdef");

  multiple(12,12);
  multiple(10);

  divide(a: 2, b: 4);
  divide(a: 2, b: 0);

  asynchronousNaturalsTo(5).listen((int number) {
    print(number); 
  });
  
  print(asynchronousNaturalsTo(10).length);
  

}

void printAString (String str){
  print(str);
}

num tinhTong ( num a,num b){
  return a+b;
}

// Named parameters
void compareTwoString ({String? str1, String? str2}){
  var result =(str1 ?? "").compareTo(str2 ?? "");
  
  if(result>0){
    print("chuỗi 1 lớn hơn chuỗi 2");
  }else if(result <0){
    print("chuỗi 2 lớn hơn chuỗi 1");
  } else{
    print (" 2 chuỗi bằng nhau");
  } 
}

// hàm có thể có hoặc không có tham số
void multiple (int a, [int b = 1] ){
  print ("${a*b}");
}

// hàm bắt buộc có tham số
void divide ({required num a, required num b}){
  if(b!=0){
    print("${a/b}");
  }else print("b không được phép bằng 0");
}

Stream<int> asynchronousNaturalsTo(int n) async* {
  int k = 0;
  while (k < n) yield k++;
}

