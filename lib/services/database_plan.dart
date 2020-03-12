import 'package:CountDays/models/plan.dart';
import 'package:CountDays/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServicePlan {
  final String titles;
  DatabaseServicePlan({this.titles});

  // collection reference
  final CollectionReference planCollection =
      Firestore.instance.collection('plans');

  Future<void> updatePlanData(Timestamp updatedat, String uid, String titles,
      String details, String icon) async {
    return await planCollection.document(uid).setData({
      'updatedat': updatedat,
      'icon': icon,
      'title': titles,
      'detail': details,
    });
  }

  Future<void> createPlanData(
      Timestamp updatedat, String titles, String details, String icon) async {
    return await planCollection.document().setData({
      'updatedat': updatedat,
      'icon': icon,
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
        icon: doc.data['icon'] ?? ' ',
        titles: doc.data['title'] ?? '',
        details: doc.data['detail'] ?? '',
        updatedat: doc.data['updatedat'] ?? '',
        uid: doc.documentID,
      );
    }).toList();
  }

  //user data from snapshot
  PlanData _planDataFromSnapshot(DocumentSnapshot snapshot) {
    return PlanData(
      icon: snapshot.data['icon'],
      titles: snapshot.data['title'],
      detail: snapshot.data['detail'],
      updatedat: snapshot.data['updatedat'],
    );
  }

  // get planmodels stream
  Stream<List<Plan>> get plans {
    return planCollection
        .orderBy("updatedat", descending: true)
        .snapshots()
        .map(_planListFromSnapshot);
  }

  //get user doc stream
  Stream<PlanData> get planData {
    return planCollection
        .document(titles)
        .snapshots()
        .map(_planDataFromSnapshot);
  }
}
