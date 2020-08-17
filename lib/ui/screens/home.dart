import 'package:book_darshan/ui/screens/care.dart';
import 'package:book_darshan/ui/screens/history.dart';
import 'package:book_darshan/ui/screens/navigations.dart';
import 'package:book_darshan/ui/screens/search.dart';
import 'package:book_darshan/ui/screens/templeRegistrationForm.dart';
import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  final tab = [
    nav(),
    search(),
    FormScreen(),history(),
    CareScreen(),

  ];
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: _page,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.search, size: 30),
            Icon(Icons.add, size: 30),
            Icon(Icons.history, size: 30),
            Icon(Icons.help_outline, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.grey,
          backgroundColor: Colors.orangeAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 400),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),

        body:tab[_page],
      ),
    );
  }
}
