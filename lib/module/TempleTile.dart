
import 'package:book_darshan/ui/screens/detailsfire.dart';
import 'package:flutter/material.dart';
import 'package:book_darshan/module/temple.dart';

class TempleTile extends StatefulWidget {
  final Temple temple;


  TempleTile({this.temple});

  @override
  _TempleTileState createState() => _TempleTileState();
}

class _TempleTileState extends State<TempleTile> {
  String img;

  @override
  Widget build(BuildContext context) {
    if (widget.temple.type.toString() == 'Mandir') {
      img = 'assets/icons/mandir.png';
    }
    if (widget.temple.type.toString() == 'Majjid') {
      img = 'assets/icons/majjid.png';
    }
    if (widget.temple.type.toString() == 'Church') {
      img = 'assets/icons/church.png';
    }
    if (widget.temple.type.toString() == 'Guru Dwara') {
      img = 'assets/icons/mandir.png';
    }
    if (widget.temple.type.toString() == 'Jain Mandir') {
      img = 'assets/icons/church.png';
    }
    return SafeArea(
      child:  Container(
          //color: Colors.blueGrey.shade100,
          decoration:
          BoxDecoration(boxShadow: [
            BoxShadow(color: Colors.black, blurRadius: 3)
          ], color: Colors.teal[100], borderRadius: BorderRadius.circular(9.0)),
          margin: const EdgeInsets.all(9.0),
          padding: const EdgeInsets.all(9.0),
          child: Card(
            
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(20, 6, 20, 2),
            child: ListTile(
              onTap: () { 
                 print('hello');
                 Navigator.push(context, MaterialPageRoute(builder: (index) => DetailsFire(temple: widget.temple)));

              },
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.orange,
                backgroundImage: AssetImage(img),
              ),
              title: Text(widget.temple.name.toUpperCase()),
              subtitle: Text(widget.temple.add.toUpperCase()),
            ),
          ),
        ),
    );
  }
}
