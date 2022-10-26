import 'package:book_darshan/module/temple.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String mob;
  DatabaseService({ this.mob });

  // collection reference
  final CollectionReference templesdata = Firestore.instance.collection('temples');

  Future<void> updateUserData(String type, String name, String mob, String pincode, String add) async {
    return await templesdata.document(mob).setData({
      'type': type,
      'name': name,
      'add': add,
      'mob': mob,
      'pincode': pincode,
    });
  }

  Stream<List<Temple>> get temples {
    return templesdata.snapshots()
        .map(_templeListFromSnapshot);
  }

}
