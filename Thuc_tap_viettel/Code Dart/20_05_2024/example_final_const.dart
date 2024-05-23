void main(List<String> args) {
  
  final Map map ={"mục1":20,"mục2":40,"mục3":0};
  print(map);

  map["mục3"] = 100;
  print(map);

  map["mục4"] =50;
  print(map);

  map.remove("mục2");
  print(map);
  print(" ");
  
  const Map constMap ={"mục1":20,"mục2":40,"mục3":0};
  // constMap["mục2"] = 50; lỗi biên dịch vì không thể thay đổi giá trị
  print(constMap);
}