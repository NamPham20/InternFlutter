// ignore_for_file: dead_code

void main(List<String> args) {

  // biến được khai báo bằng var thì chương trình sẽ tự hiểu kiểu giá trị của biến khi biến được truyền giá trị lần đầu tiên;

  var firstName = 'Phạm' ;
  print("firstName has value : '$firstName' and type : '${firstName.runtimeType}'");
  // firstName = 20; firstName đã có kiểu dữ liệu String và không thế gán nó với giá trị khác String

  //String
  String lastName = 'Phương Nam';
  print("lastName has value : '$lastName' and type : '${lastName.runtimeType}'");

  // Number là chung cho int double
  num age = 23;
  print("age has value '$age'  and type : '${age.runtimeType}'");

  //int
  int intValue = 10;
  print("intValue has value '$intValue'  and type : '${intValue.runtimeType}'");

  //double
  int doubleValue = 10;
  print("doubleValue has value '$doubleValue'  and type : '${doubleValue.runtimeType}'");

  //Boolean
  bool isStudent = true ;
  print("isStudent has value : '$isStudent' and type : '${isStudent.runtimeType}'");

  print("Xin chào, tôi tên là $firstName $lastName, năm nay tôi $age");
  print(isStudent? "Tôi đang là học sinh":"Tôi đang đi làm");

  // một biến được khai báo kiểu late có thể được gán giá trị sau
  late var lateVariable ;
  lateVariable ="đã gán giá trị";
  print("lateVariable has value '$lateVariable' and type :'${lateVariable.runtimeType}' " );
  
  // const khai báo hằng số, phải được khởi tại tại thời  điểm khai báo và sẽ không thể thay đổi giá trị của một biến khai báo  const
  const hangSo = 20;
  print("hằng số : $hangSo");

  //final cũng dùng để khai báo hằng số tuy nhiên khác với const final không cần khởi tạo giá trị khi khai báo , nó sẽ nhận giá trị đầu tiên 
  //được gán và không thể thay đổi sau đó
  final finalVariable;
  finalVariable = 33;
  print(finalVariable);

  // Record
  var record = ("nam",20);
  print("record has value : '$record' and type : '${record.runtimeType}'");

  //khởi tại record
  (int,int) Record1 ;
  Record1 =(20,18);
  print(Record1);
  
  (int,int,int) Record2 ;
  Record2 = (Record1.$1,Record1.$2,20);
  print(Record2);

  //biến được khai báo kiểu dynamic thì biến đó có thể đưuọc gán giá trị với bất kỳ kiểm dữ liệu nào
  dynamic q = 10;
  print("q has value '$q' and type '${q.runtimeType}'");
   q="20";
   print("q has value '$q' and type '${q.runtimeType}'");
   q=false;
   print("q has value '$q' and type '${q.runtimeType}'");
   q=20.5;
   print("q has value '$q' and type '${q.runtimeType}'");


}