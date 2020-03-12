import 'package:cloud_firestore/cloud_firestore.dart';

class Person {
  final String uid;
  Person({this.uid});
}

class PlanData {
  final String uid;
  final String icon;
  final String titles;
  final String detail;
  final String author;
  final Timestamp updatedat;

  PlanData(
      {this.uid,
      this.titles,
      this.detail,
      this.author,
      this.icon,
      this.updatedat});
}
