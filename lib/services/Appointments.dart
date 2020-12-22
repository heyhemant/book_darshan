import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:book_darshan/module/details.dart';
import 'package:date_time_picker/date_time_picker.dart';

class Appointments {
  final String ref;
  String now = DateTime.now().toString();
  Appointments({this.ref});
  final CollectionReference appointment =
      Firestore.instance.collection("appointments");

  Future<void> book(String name, String bdate, String add, String mob,
      String email, String tname) async {
    return await appointment.document(ref + ' ' + now).setData({
      'Temple Name': tname,
      'Name': name,
      'Date': bdate,
      'Mobile Number': mob,
      'Email': email,
      'Address': add,
      'Security': ((now + ref).hashCode.toString() + ' ' + ref),
    });
  }
}
