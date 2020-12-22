import 'dart:async';
import 'package:book_darshan/module/temple.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class search extends StatelessWidget {
  String _email;
  String _mob;
  String _date;

  Widget _fireSearch(String _email, String _mob, String _date) {
    return new StreamBuilder(
      stream: Firestore.instance
          .collection('appointments')
          .where('Date', isEqualTo: _date)
          .where('Email', isEqualTo: _email)
          .where('Mobile Number', isEqualTo: _mob)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return new Text('Loading...');
        return new ListView.builder(
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index) =>
              _buildListItem(snapshot.data.documents[index]),
        );
      },
    );
  }

  Widget _buildListItem(DocumentSnapshot document) {
    return new ListTile(
      title: document['Name'],
      subtitle: document['Temple Name'],
    );
  }

  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildemail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Enter Your Email Address'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildmob() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _mob = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final temples = Provider.of<List<Temple>>(context);
    return StreamBuilder<Temple>(
        stream: null,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 30.0, 8.0, 15.0),
                  child: Text(
                    'Check Status of Your Application',
                    style: Theme.of(context).textTheme.display1.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black),
                  ),
                )),
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DateTimePicker(
                        type: DateTimePickerType.date,
                        dateMask: 'd MMM, yyyy',
                        initialValue: DateTime.now().toString(),
                        firstDate: DateTime(2010),
                        lastDate: DateTime(2100),
                        icon: Icon(Icons.event),
                        dateLabelText: 'Date',
                        onChanged: (val) => _date = val,
                        validator: (val) {
                          _date = val;
                          return null;
                        },
                        onSaved: (String val) {
                          _date = val;
                        },
                      ),
                      _buildmob(),
                      _buildemail(),
                      SizedBox(height: 100),
                      RaisedButton(
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                        onPressed: () {
                          // ignore: await_only_futures

                          // if (!_formKey.currentState.validate()) {
                          //   return _fireSearch(_email, _mob, _date);
                          // }
                          // _formKey.currentState.save();
                          _fireSearch(_email, _mob, _date);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
