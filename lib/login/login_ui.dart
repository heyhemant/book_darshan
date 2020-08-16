import 'package:book_darshan/login/constants.dart';
import 'package:book_darshan/login/signin.dart';
import 'package:book_darshan/login/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';




class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login",
      theme: ThemeData(primaryColor: Colors.orange[200]),
      routes: <String, WidgetBuilder>{
        SIGN_IN: (BuildContext context) =>  SignInPage(),
        SIGN_UP: (BuildContext context) =>  SignUpScreen(),
      },
      initialRoute: SIGN_IN,
    );
  }
}



