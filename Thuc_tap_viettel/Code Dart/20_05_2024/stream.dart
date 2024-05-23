import 'dart:async';

Future<void> main() async {
  // Tạo StreamController
  final controller = StreamController<dynamic>();

  // Đăng ký người nghe
  await controller.stream.listen((data) async {
    print('Received: $data');
  });
  controller.sink.add(3);
  // Phát ra các sự kiện
  controller.sink.add(1);
  print("cách");
  controller.sink.add(2);
  
  controller.sink.add("event");

  // Đóng Stream
  controller.close();
}
