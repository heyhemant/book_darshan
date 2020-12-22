import 'package:book_darshan/login/widgets/textformfield.dart';
import 'package:book_darshan/services/Database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class red extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return redState();
  }
}

class redState extends State<red> {
  List<String> _type = [
    'Mandir',
    'Majjid',
    'Guru Dwara',
    'Church',
    'Jain Mnadir'
  ];
  bool _success;
  String _userEmail;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _tepreg() async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: _email.text,
      password: _pass.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
      });
    } else {
      _success = false;
    }
  }

  String _name;
  TextEditingController _email, _pass;
  String _oktype;
  String _god;
  String _address;
  String _phoneNumber;
  String _pincode;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name of Temple'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildgod() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Enter The Name Of Bhagwan in case of Hindu Mandir'),
      onSaved: (String value) {
        _god = value;
      },
    );
  }

  Widget _buildemail() {
    return CustomTextField(
      keyboardType: TextInputType.emailAddress,
      icon: Icons.email,
      hint: "Email ID",
      textEditingController: _email,
    );
  }

  Widget _buildpass() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      obscureText: true,
      icon: Icons.lock,
      hint: "Password",
      textEditingController: _pass,
    );
  }

  void _register() async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: _email.text,
      password: _pass.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      _success = false;
    }
  }

  Widget _builaddress() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Address'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Address is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _address = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
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
        _phoneNumber = value;
      },
    );
  }

  Widget _buildpincode() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Pincode'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Pin Code is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _pincode = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 30.0, 8.0, 15.0),
            child: Text(
              'Register Your Temple Here',
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
                _buildName(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.5, horizontal: 10),
                  child: DropdownButton(
                      isExpanded: true,
                      hint: Text('Please choose Type of Temple'),
                      value: _oktype,
                      onChanged: (newValue) {
                        setState(() {
                          _oktype = newValue;
                        });
                      },
                      items: _type.map((location) {
                        return DropdownMenuItem(
                          child: new Text(location),
                          value: location,
                        );
                      }).toList()),
                ),
                _buildgod(),
                _builaddress(),
                _buildPhoneNumber(),
                _buildpincode(),
                _buildemail(),
                _buildpass(),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () async {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }
                    _register();
                    _formKey.currentState.save();
                    await DatabaseService(mob: _phoneNumber).updateUserData(
                        _oktype, _name, _phoneNumber, _pincode, _address);

                    //Send to API
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
