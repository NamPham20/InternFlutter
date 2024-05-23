import 'dart:io';

void main(List<String> args) {
  String str = "Đây là một chuỗi String";

  print("\nGiá trị của str : $str");
  // kích thước của str
  print("Kích thước của chuỗi ${str.length}");
  //duyệt qua từng ký tự trong chuỗi str
  for(int i =0;i < str.length;i++){
    stdout.write(" ${str[i]}");
  }
  //in ra dãy ký tự trong chuỗi tại điểm bắt đầu và kết thúc
  print("\nchuỗi con từ vị trí 0 đến 3: ${ str.substring(0,3)}");
  print("chuỗi con từ vị trí 4 đến hết : ${ str.substring(4,)}");

  // chuyển đổi chuỗi in hoa in thường
  print(str.toUpperCase());
  print(str.toLowerCase());
  // kiểm tra chuỗi có chưa chuỗi con không
  String chuoiCon = "Đây";
  print("Trong chuỗi '$str' có chứa chuỗi '$chuoiCon' : ${str.contains(chuoiCon)} ");

  // thay thế ký tự trong chuỗi bằng ký tự khác 
  print(str.replaceAll(" ","_")+"\n");

}