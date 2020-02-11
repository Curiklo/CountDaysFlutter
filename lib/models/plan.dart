import 'package:cloud_firestore/cloud_firestore.dart';

class Plan {
  final String icon;
  final String titles;
  final String details;
  final String uid;
  final Timestamp updatedat;

  Plan({this.uid, this.titles, this.details, this.icon, this.updatedat});
}
