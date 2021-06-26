import 'package:cloud_firestore/cloud_firestore.dart';

class Transaction{
  String title;
  DateTime date;
  String amount;
  DocumentReference? transactionRef;
  Transaction({
    required this.amount,
    required this.date,
    required this.title,
    this.transactionRef
});
}