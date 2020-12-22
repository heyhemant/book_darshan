import 'package:book_darshan/module/TempleTile.dart';
import 'package:book_darshan/module/temple.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TempleList extends StatefulWidget {
  @override
  _TempleListState createState() => _TempleListState();
}

class _TempleListState extends State<TempleList> {
  @override
  Widget build(BuildContext context) {

    final temples = Provider.of<List<Temple>>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:  AppBar(
          backgroundColor: Colors.teal[50],
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 30.0, 8.0, 12.0),
            child: Text(
              'Book Darshan',
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          )),
      body:
      Container(
        color: Colors.teal[50],
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: ListView.builder(
            itemCount: temples.length,
            itemBuilder: (context, index){
              return TempleTile(temple: temples[index]);
            },

          ),
        ),
      ),
    );
  }
}