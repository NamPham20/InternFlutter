void main(List<String> args) {
  num number = 20;

  print(number);

  int a = 10;
  int b= 20;

  print("a+b = ${a+b}");
  print("a-b = ${a-b}");
  print("a*b = ${a*b}");
  print("a/b = ${a/b}");

  const PI = 3.14;
  double r = 2.5;
  print("diện tích hình tròn là ${PI*r*r} \n chu vi hình tròn là ${2*PI*r}");
 // chuyển đổi kiểu dữ liệu giưa string và num;
 String str = '$number';
 print("$str - ${str.runtimeType}");

 String c = '30';
 print("$c-${int.parse(c).runtimeType}");

 // ()++; tăng giá  trị của biến lên 1 đơn vị , trả về giá trị biến trước khi tăng
 print(a++);
 print(a);

 // ()--; giảm giá  trị của biến lên 1 đơn vị , trả về giá trị biến trước khi giảm
 print(a--);
 print(a);

 // ++(); tăng giá  trị của biến lên 1 đơn vị , trả về giá trị mới của biến 
 print(--a);
 print(a);


}