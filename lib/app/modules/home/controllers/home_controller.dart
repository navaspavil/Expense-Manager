import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/app/data/models/Transaction.dart' as model;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FocusNode myFocusNode = new FocusNode();
  FocusNode myFocusNode1 = new FocusNode();
  FirebaseAuth _auth = FirebaseAuth.instance;
model.Transaction tr = model.Transaction(
  amount: 26.5,
  date: DateTime.now(),
    title: 'esrty'
);
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }
  void addTransaction(){
    FirebaseFirestore.instance.collection('User').doc(_auth.currentUser!.uid)
        .collection('Transactions').add({
      'amount' : tr.amount,
      'title' : tr.title,
      'date' : tr.date
      // DateFormat.yMMMd()
    });
  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
