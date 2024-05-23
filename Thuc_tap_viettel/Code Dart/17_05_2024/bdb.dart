Future main(List<String> args) async{
  await waitTime();
  print("xin chào các bạn");
}

Future<void> waitTime() {
 return Future.delayed(
    Duration(seconds: 2),(){
      print("xin chờ 2s");
    });
}





