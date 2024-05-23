void main(List<String> args) {
  var record = ("Nam",age:20,address:"Hải Dương");
  final a ;
  a= 20;
  print(a);

  print("record has value '$record' has type : '${record.runtimeType}'");

  // lấy giá trị trong record
  print(record.$1);
  print(record.age);
  print(record.address);

 print( record.toString());

// khởi tạo truyền tên tham số
 ({String name, int age}) record2;
 record2 =(name:"Ha noi", age: 1000);
 print(record2);

  
}