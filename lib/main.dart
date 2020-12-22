import 'package:book_darshan/services/Database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:book_darshan/login/signin.dart';
import 'module/temple.dart';
import 'ui/screens/home.dart';
import 'ui/screens/onboarding.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _checkIsFirstSeen;
  @override
  void initState() {
    super.initState();
    _checkIsFirstSeen = checkIsFirstSeen();
  }

  Future<bool> checkIsFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("seen")) {
      return true;
    } else {
      prefs.setBool("seen", true);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Temple>>.value(
        value: DatabaseService().temples,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Book Darshan',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            backgroundColor: Colors.white,
            scaffoldBackgroundColor: Colors.white,
            textTheme: GoogleFonts.openSansTextTheme().copyWith(
              button: TextStyle(color: Colors.white),
            ),
          ),
          home: FutureBuilder(
            future: _checkIsFirstSeen,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data)
                  return HomeScreen();
                else
                  return OnBoardingScreen();
              } else {
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
          routes: {
            'home': (context) => SignInScreen(),
          },
        ));
  }
}
