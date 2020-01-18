import 'package:CountDays/models/planModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String titles;
  DatabaseService({this.titles});

  // collection reference
  final CollectionReference planCollection =
      Firestore.instance.collection('plans');

  Future<void> updatePlanData(
      String titles, String details, String author) async {
    return await planCollection.document(titles).setData({
      'title': titles,
      'detail': details,
      'author': author,
    });
  }

  // planmodels list from snapshot
  List<PlanModel> _planListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      //print(doc.data);
      return PlanModel(
        titles: doc.data['title'] ?? '',
        details: doc.data['detail'] ?? '',
        author: doc.data['author'] ?? '',
      );
    }).toList();
  }

  // get planmodels stream
  Stream<List<PlanModel>> get plans {
    return planCollection.snapshots().map(_planListFromSnapshot);
  }
}
