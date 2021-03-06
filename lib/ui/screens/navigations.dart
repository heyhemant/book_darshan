import 'package:book_darshan/global.dart';
import 'package:book_darshan/login/login_ui.dart';
import 'package:book_darshan/module/temple.dart';
import 'package:book_darshan/services/Database.dart';
import 'package:book_darshan/ui/screens/history.dart';
import 'package:book_darshan/ui/widgets/temple_container.dart';
import 'package:book_darshan/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:book_darshan/services/templelist.dart';
import 'package:provider/provider.dart';

class nav extends StatefulWidget {
  @override
  _navState createState() => _navState();
}

// ignore: camel_case_types
class _navState extends State<nav> {
  AuthService _auth = AuthService();
  Widget _buildAboutDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Do you want to sign out ?'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildAboutText(),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            _auth.signOut();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => login(),
              ),
            );
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Sign Out Now...'),
        ),
      ],
    );
  }

  Widget _buildAboutText() {
    return new RichText(
      text: new TextSpan(
        text: 'You are currently logged in as ',
        style: const TextStyle(color: Colors.black87),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Temple>>.value(
      value: DatabaseService().temples,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 30.0, 8.0, 15.0),
              child: Text(
                'Book Darshan',
                style: Theme.of(context)
                    .textTheme
                    // ignore: deprecated_member_use
                    .display1
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            )),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[],
                        ),
                      ),
                      ClipOval(
                        child: Material(
                          color: Colors.white70, // button color
                          child: InkWell(
                              splashColor: Colors.blueGrey, // inkwell color
                              child: SizedBox(
                                  width: 57,
                                  height: 57,
                                  child: Icon(
                                    Icons.account_circle,
                                    color: Colors.grey,
                                    size: 57,
                                  )),
                              onTap: () => {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          _buildAboutDialog(context),
                                    ),
                                  }),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 9),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search Desire Temple",
                      filled: true,
                      fillColor: MyColors.grey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 9),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => history(),
                        ),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerRight,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.asset('assets/icons/temple.png'),
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              padding: const EdgeInsets.all(11.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: MyColors.blue.withOpacity(.3),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Your Upcoming Visits",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    color: MyColors.blue,
                                    child: Text(
                                      "History",
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => history(),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 9),
                  Text("Categories", style: Theme.of(context).textTheme.title),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 9.0),
                    height: 71,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        categories.length,
                        (f) => Container(
                          constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width / 2),
                          margin: const EdgeInsets.symmetric(horizontal: 9.0),
                          padding: const EdgeInsets.all(9.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: MyColors.grey),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: categories[f]['color'],
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                                child: Image.asset("${categories[f]['icon']}"),
                              ),
                              SizedBox(width: 5),
                              Flexible(
                                child: Text("${categories[f]['title']}"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(9.0),
              decoration: BoxDecoration(
                color: MyColors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Top Temples",
                        style: Theme.of(context).textTheme.title,
                      ),
                      FlatButton(
                        child: Text("See All"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TempleList()));
                        },
                      )
                    ],
                  ),
                  ListView.builder(
                    itemCount: templeInfo.length,
                    shrinkWrap: true,
                    itemBuilder: (context, i) => TempleContainer(id: i),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
