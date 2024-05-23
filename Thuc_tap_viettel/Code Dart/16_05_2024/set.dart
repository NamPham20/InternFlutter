

void main(List<String> args) {

  Set sets = {1,2,3,4,5,6};
  print(sets);

  for(int i =0; i<50;i++){
    sets.add(i);
  }
  print(sets);

  // truy cập vào các phần tử của set
  num sum = 0;

  sets.forEach((element) {
    sum += element;
  });
  print(sum);

  // tạo set mới chứa phần tử của set cũ thêm điều kiện nào đó 

  var set1 = sets.where((element) => element%2==0).toSet();
  print(set1);

  // chuyển đối set thành list và ngược lại

  List list = List.from(sets);
  print("\n$list has Type : ${List.from(sets).runtimeType}");

  Set setSon = {};
  List<String> stringList = ["hello","world","123","123"];
  setSon = stringList.toSet();
  print ("$setSon has type  ${stringList.toSet().runtimeType}");


  // set<String>
  Set<String> strings = <String>{};

  strings.add("một");
  strings.add('hai');
  strings.add("ba");
  print(strings);

}