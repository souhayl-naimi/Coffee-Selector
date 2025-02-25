import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_selector/models/coffee.dart';
import 'package:coffee_selector/models/user.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  //collection reference
  final CollectionReference coffeeCollection =
      Firestore.instance.collection('coffees');

  Future updateUserData(String sugars, String name, int strenght) async {
    return await coffeeCollection
        .document(uid)
        .setData({'sugars': sugars, 'name': name, 'strenght': strenght});
  }

  // coffee list from snapshot
  List<Coffee> _coffeeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Coffee(
        name: doc.data['name'] ?? '',
        strenght: doc.data['strenght'] ?? '',
        sugars: doc.data['sugars'] ?? ''
      );
    }).toList();
  }

  // get coffees stream
  Stream<List<Coffee>> get coffees {
    return coffeeCollection.snapshots().map(_coffeeListFromSnapshot);
  }
  //userdata from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      sugars: snapshot.data['sugars'],
      strenght: snapshot.data['strenght'],
      name: snapshot.data['name'],
    );

  }
  // get user doc stream
  Stream<UserData> get userData{
    return coffeeCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
