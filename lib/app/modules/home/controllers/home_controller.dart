import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/app/data/models/Transaction.dart' as model;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FocusNode myFocusNode = new FocusNode();
  FocusNode myFocusNode1 = new FocusNode();
  RxDouble count = 0.5.obs;
  List<model.Transaction> transactionList = [];
  var showDate =''.obs;
  var sum = 0.0.obs;
  var dateError = false.obs;
  final transactionFormKey = GlobalKey<FormState>();
  FirebaseAuth _auth = FirebaseAuth.instance;
model.Transaction transaction = model.Transaction(
  amount: '0.0',
  title: 'default',
    date: DateTime(1900)
);
DateTime selectedDate = DateTime.now();
  @override
  void onInit() {
    super.onInit();
  }
  void addTransaction(){
    FirebaseFirestore.instance.collection('User').doc(_auth.currentUser!.uid)
        .collection('Transactions').add({
      'amount' : transaction.amount,
      'title' : transaction.title,
      'date' : transaction.date
    });
    sum.value = 0;
    count.value += 1;
    transaction = model.Transaction(
        amount: '0.0',
        title: 'default',
        date: DateTime(1900)
    );
  }

  void deleteTransaction(DocumentReference documentReference){
    FirebaseFirestore.instance.doc(documentReference.path).delete();
    count.value -=1;
  }


  Stream<List<model.Transaction>> getTransactions() {
    sum.value = 0;
    return FirebaseFirestore.instance
        .collection("User").doc(_auth.currentUser!.uid)
    .collection('Transactions')
        .snapshots()
        .map((event) {
      return event.docs.map((element) {
        sum.value +=double.parse(element.data()['amount']);
        print(sum.value);
        return model.Transaction(
          title: element.data()['title'],
          amount: element.data()['amount'],
          date: element.data()['date'].toDate(),
            transactionRef: element.reference,
        );
      }).toList();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
