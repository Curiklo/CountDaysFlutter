import 'package:CountDays/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServiceUser {
  final String titles;
  DatabaseServiceUser({this.titles});

  // collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future<void> updateuserData(String uid, var feature) async {
    return await userCollection.document(uid).setData({
      'uid': uid,
      'feature': feature,
    });
  }

  Future<void> createuserData(String uid, var feature) async {
    return await userCollection.document(uid).setData({
      'uid': uid,
      'feature': feature,
    });
  }

  Future<void> deleteuserData(Person user) async {
    print(user.uid);
    return await userCollection.document(user.uid).delete();
  }

  Stream<Person> user(Person user) {
    return userCollection.document(user.uid).snapshots().map((doc) {
      return Person(
        uid: doc.data['uid'] ?? '',
        feature: doc.data['feature'] ?? '',
      );
    });
  }

  Future<void> updateFetureData(Person person) async {
    if (person.feature == null) {
      person.feature = [false];
      await updateuserData(person.uid, person.feature);
    } else if (person.feature.length == 0) {
      person.feature.add(false);
    } else if (person.feature.length != 1) {
      person.feature = [false];
      await updateuserData(person.uid, person.feature);
    }
  }
}
