import 'package:flutter/material.dart';
class search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title:  Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 30.0, 8.0, 15.0),
            child: Text(
              'Book Darshan',
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          )
      ),
      body: Container(
        margin: EdgeInsets.only(top: 100),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.black38.withAlpha(10),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter Temple Name",
                  hintStyle: TextStyle(
                    color: Colors.black.withAlpha(120),
                  ),
                  border: InputBorder.none,
                ),
                onChanged: (String keyword) {},
              ),
            ),
            Icon(
              Icons.search,
              color: Colors.black.withAlpha(120),
            )
          ],
        ),
      ),
    );
  }
}