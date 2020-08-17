import 'package:flutter/material.dart';

class history extends StatefulWidget {
  @override
  _historyState createState() => _historyState();
}

class _historyState extends State<history> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title:  Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 30.0, 8.0, 15.0),
              child: Text(
                'Your Booking History',
                style: Theme.of(context)
                    .textTheme
                    .display1
                    .copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black),
              ),
            )
        ),
      ),
    );
  }
}
