void main(List<String> args) {
  // khai báo dữ biến với kiểu dữ liệu từng mình cần khởi tại giá trị
  String string = "hello";
  print(string);

  // sử dụng ? để khai báo biến có thể mang giá trị null;
  int? a;
  print(a);

  // sử dụng ?? để trả về dữ liệu bên phải nếu bên trái null

  String? str1;
  String str2 = str1 ?? "String2";
  print(str2);

  // sử dụng ! để chắc chắn rằng biến đó không null tại thời điểm sử dụng

  List? list ;
  list =[1,2,3,4,5];
  int num = list!.length;
  print(num);

  // sử dụng ?. để thực hiện phương thức haocwj truy cập vào thuộc tính của một đối tượng có thể null mà không gây lỗi
  List? list2;
  int? num1 = list2?.length;// ignore: dead_code
  print(num1);

}