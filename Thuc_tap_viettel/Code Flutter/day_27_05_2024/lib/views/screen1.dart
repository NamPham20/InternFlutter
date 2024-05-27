import 'package:day_27_05_2024/views/screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  TextEditingController? controllerEmail;
  TextEditingController? controllerPassword;
  String email='';
  String password='';
  
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    controllerEmail =TextEditingController();
    controllerPassword = TextEditingController();
    super.initState();
    
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controllerPassword!.dispose();
    controllerEmail!.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.blue,
            body: LayoutBuilder(
              builder: (context,constraints){
                if(constraints.maxWidth>constraints.maxHeight){
                  controllerEmail!.text = email;
                  controllerPassword!.text =password;
                  return horizontalScreen();
                }else{
                  controllerEmail!.text = email;
                  controllerPassword!.text =password;
                  return verticalScreen();
                }
              },
            )
          )
      ),
    );
  }
  Widget horizontalScreen() {
    return SingleChildScrollView(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Center(
                child: Column(
                  children: [
                    Text("Hello Again!" ,style: GoogleFonts.dancingScript(
                        fontWeight: FontWeight.bold,
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        )
                    ),),
                    Text("Fill your details or continue with social media" ,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dancingScript(
                          fontWeight: FontWeight.bold,
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
        
                          )
                      ),),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45 ,
                    height: MediaQuery.of(context).size.height * 0.9,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 2,),
                        Text("Login",style: GoogleFonts.aBeeZee(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),),
                        const SizedBox(height: 8,),
                        Container(
                          margin: const EdgeInsets.only(left: 12,right: 12),
                          child: TextField(
                            onChanged: (value) => email = controllerEmail!.text,
                            controller: controllerEmail,
                            decoration: InputDecoration(
                                labelText: "Email",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                )
                            ),),
                        ),
                        const SizedBox(height: 8,),
                        Container(
                          margin: const EdgeInsets.only(left: 12,right: 12),
                          child: TextField(
                            onChanged: (value) => password = controllerPassword!.text,
                            controller: controllerPassword,
                            decoration: InputDecoration(
                                labelText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                )
                            ),),
                        ),
                        const SizedBox(height: 8,),
                        ElevatedButton(
                            onPressed: (){
                              loginMethod();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                )
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 50,right: 50),
                              child: Text("Login", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24
                              ),),
                            )),
                        Container(
                            margin: const EdgeInsets.only(top: 8, bottom: 8),
                            child: const Text("-------or-------",style: TextStyle(fontSize: 20),)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Icon(
                                PhosphorIcons.googleLogo(PhosphorIconsStyle.bold),
                                size: 32.0,
                                color: const Color(0xffebebeb),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Icon(
                                PhosphorIcons.appleLogo(PhosphorIconsStyle.bold),
                                size: 32.0,
                                color: const Color(0xffebebeb),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Icon(
                                PhosphorIcons.phone(PhosphorIconsStyle.bold),
                                size: 32.0,
                                color: const Color(0xffebebeb),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 12,),
                        const Text("You do not have any account? Register Now")
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget verticalScreen() {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 30,),
            Text("Hello Again!" ,style: GoogleFonts.dancingScript(
                fontWeight: FontWeight.bold,
                textStyle: const TextStyle(
                    color: Colors.white,
                  fontSize: 32,
        
                )
            ),),
            Text("Fill your details or continue with social media" ,
              textAlign: TextAlign.center,

              style: GoogleFonts.dancingScript(
                fontWeight: FontWeight.bold,
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,

                )
            ),),
            const SizedBox(height: 50,),
            Container(
             width: MediaQuery.of(context).size.width * 0.95 ,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                  Text("Login",style: GoogleFonts.aBeeZee(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),),
                  const SizedBox(height: 30,),
                   Container(
                     margin: const EdgeInsets.only(left: 12,right: 12),
                     child: TextField(
                       controller: controllerEmail,
                       onChanged: (value) => email = controllerEmail!.text,
                      decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        )
                      ),),
                   ),
                  const SizedBox(height: 30,),
                  Container(
                    margin: const EdgeInsets.only(left: 12,right: 12),
                    child: TextField(
                      controller: controllerPassword,
                      onChanged: (value) => password = controllerPassword!.text,
                      decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          )
                      ),),
                  ),
                  const SizedBox(height: 30,),
                  ElevatedButton(
                      onPressed: (){
                        loginMethod();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 50,right: 50),
                        child: Text("Login", style: TextStyle(
                          color: Colors.white,
                          fontSize: 24
                        ),),
                      )),
                  Container(
                    margin: const EdgeInsets.only(top :30, bottom: 30),
                      child: const Text("-------or-------",style: TextStyle(fontSize: 20),)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(
                          PhosphorIcons.googleLogo(PhosphorIconsStyle.bold),
                          size: 32.0,
                          color: const Color(0xffebebeb),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(
                          PhosphorIcons.appleLogo(PhosphorIconsStyle.bold),
                          size: 32.0,
                          color: const Color(0xffebebeb),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(
                          PhosphorIcons.phone(PhosphorIconsStyle.bold),
                          size: 32.0,
                          color: const Color(0xffebebeb),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30,),
                  const Text("You do not have any account? Register Now")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void loginMethod() {

    Navigator.push(
        context, 
        MaterialPageRoute(builder: (context)=> Screen2(email: email, password: password))
    );
  }
}
