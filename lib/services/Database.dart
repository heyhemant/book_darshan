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
  List<Temple> _templeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      print(doc.data);
      return Temple(
          name: doc.data['name'] ?? '',
          add: doc.data['add'] ?? '',
          pincode: doc.data['pincode'] ?? '',
          type: doc.data['type'] ?? '',
          mob: doc.data['mob'] ?? '',
      );
    }).toList();
  }
  Stream<List<Temple>> get temples {
    return templesdata.snapshots()
        .map(_templeListFromSnapshot);
  }

}