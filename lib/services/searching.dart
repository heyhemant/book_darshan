import 'package:flutter/material.dart';

class searching extends StatelessWidget {
  String status;
  String _email, _mob, _date;
  Widget _buildStatus(BuildContext context) {
    return new AlertDialog(
      title: const Text('Status of Your Applic'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildAboutText(),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {},
          textColor: Theme.of(context).primaryColor,
          child: const Text('Ok'),
        ),
      ],
    );
  }

  Widget _buildAboutText() {
    return new RichText(
      text: new TextSpan(
        text: '${status}',
        style: const TextStyle(color: Colors.black87),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildStatus(context);
  }
}
