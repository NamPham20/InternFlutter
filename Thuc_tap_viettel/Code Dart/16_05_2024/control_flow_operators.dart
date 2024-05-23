void main(List<String> args) {

  bool promoActive = true;
  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print(nav);
  String nameKey = "key";
  var nav1= {'Home', 'Furniture', 'Plants', if (nameKey case "key" ) 'Nam'};
 print(nav1);

 List list =[5,6,7,8];
 var nums =[1,2,3,for(var i in list ) i];
 print("$nums has type : ${nums.runtimeType}");
 print(("${nums[6].runtimeType}"));


}