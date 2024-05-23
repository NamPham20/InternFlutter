void main(List<String> args) {


  List<dynamic> list = [1,2,3,7,9,6,8];

  List mlist = [];
  mlist.add(1);
  mlist.addAll(list);
  print(mlist);

  print("$list - kích thước list: ${list.length}");

  //duyện qua từng phần tử mảng 
  list.forEach((element) {
    print(element);
  });

 // xắp xếp mảng theo thứ tự tăng dần
  list.sort((a, b) => a - b);
  print(list);
  // xắp xếp theo thứ tự giảm dần 
  list.sort((a, b) => b - a);
  print(list);
  // tính tổng các giá trị trong mảng 
  num sum = 0;
  list.forEach((element) {
    sum+= element;
  });
  print("tổng các giá trị trong mảng là $sum");

  // thêm một phần tử vào cuối danh sách
  list.add(20);
  print(list);
  // thêm một list này vào cuối list khác
  List list1=[3,5,4,3,6,7];
  list.addAll(list1);
  print(list);
  // kiểm tra cem list có chưa phàn tử nào đó không
  print(list.contains(3));
   
  // xóa tất cả phần tử khỏi danh sách
  list.clear();
  print(list);

  Set set = {1,2,3,4};
  var lists = set.toList();
  print(lists);


}