import 'package:CountDays/models/plan.dart';
import 'package:CountDays/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String titles;
  DatabaseService({this.titles});

  // collection reference
  final CollectionReference planCollection =
      Firestore.instance.collection('plans');

  Future<void> updatePlanData(String uid, String titles, String details) async {
    return await planCollection.document(uid).setData({
      'title': titles,
      'detail': details,
    });
  }

  Future<void> createPlanData(String titles, String details) async {
    return await planCollection.document().setData({
      'title': titles,
      'detail': details,
    });
  }

  Future<void> deletePlanData(Plan plan) async {
    print(plan.uid);
    return await planCollection.document(plan.uid).delete();
  }

  // planmodels list from snapshot
  List<Plan> _planListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      //print(doc.data);
      return Plan(
        titles: doc.data['title'] ?? '',
        details: doc.data['detail'] ?? '',
        uid: doc.documentID,
      );
    }).toList();
  }

  //user data from snapshot
  PlanData _planDataFromSnapshot(DocumentSnapshot snapshot) {
    return PlanData(
      titles: snapshot.data['title'],
      detail: snapshot.data['detail'],
    );
  }

  // get planmodels stream
  Stream<List<Plan>> get plans {
    return planCollection.snapshots().map(_planListFromSnapshot);
  }

  //get user doc stream
  Stream<PlanData> get planData {
    return planCollection
        .document(titles)
        .snapshots()
        .map(_planDataFromSnapshot);
  }
}
