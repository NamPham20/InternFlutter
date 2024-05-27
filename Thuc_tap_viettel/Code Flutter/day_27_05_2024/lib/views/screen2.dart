import 'package:flutter/material.dart';

 class  Screen2 extends StatefulWidget {

 final String email;
 final String password;

   const Screen2({super.key , required this.email,required this.password} );

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.email),
              Text(widget.password),
              const Text("hiển thị ảnh trong thư mục assets"),
              const SizedBox(height: 10,),
              const Image(
                  image: AssetImage("assets/images/anh_1.png")
              ),
              const Text("hiển thị ảnh bằng đường dẫn"),
              const SizedBox(height: 10,),
              Image.network("https://th.bing.com/th/id/OIP.6yKK9C5tT6dCaN1hNWlXHAHaEK?rs=1&pid=ImgDetMain",
              width: MediaQuery.of(context).size.width *0.9,)
            ],
          ),
        ),
      ),
    );
  }
}
