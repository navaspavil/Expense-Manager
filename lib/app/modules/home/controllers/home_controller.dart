import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/app/data/models/Transaction.dart' as model;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FocusNode myFocusNode = new FocusNode();
  FocusNode myFocusNode1 = new FocusNode();
  DateTime startDate = DateTime.now(), endDate = DateTime.now();
  var showStartDate = ''.obs;
  var showEndDate = ''.obs;
  var isFilter = false.obs;
  TextStyle reportText = TextStyle(fontSize: 16,
      fontWeight: FontWeight.w500
  );
  RxDouble count = 0.5.obs;
  List<model.Transaction> transactionList = [];
  var showDate =''.obs;
  var currentItem = 'Select'.obs;
  var isExpanded = false.obs;
  var sumExpense = 0.0.obs;
  var sumIncome =0.0.obs;
  var dateError = false.obs;
  final transactionFormKey = GlobalKey<FormState>();
  FirebaseAuth _auth = FirebaseAuth.instance;
model.Transaction transaction = model.Transaction(
  expense: true,
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
      'expense' : transaction.expense,
      'amount' : transaction.amount,
      'title' : transaction.title,
      'date' : transaction.date
    });
    sumExpense.value = 0;
    sumIncome.value = 0;
    count.value = 0;
    currentItem.value = 'Select';
    transaction = model.Transaction(
      expense: true,
        amount: '0.0',
        title: 'default',
        date: DateTime(1900)
    );
  }

  void deleteTransaction(DocumentReference documentReference){
    FirebaseFirestore.instance.doc(documentReference.path).delete();
    sumExpense.value = 0;
    sumIncome.value = 0;
    count.value = 0;
  }


  Stream<List<model.Transaction>> getTransactions() {
    count.value = 0;
    sumExpense.value = 0;
    sumIncome.value = 0;
    return FirebaseFirestore.instance
        .collection("User").doc(_auth.currentUser!.uid)
    .collection('Transactions')
        .snapshots()
        .map((event) {
      return event.docs.map((element) {
        
        if(element.data()['expense']){
          count.value += 1;
          sumExpense.value +=double.parse(element.data()['amount']);
          print('Sum E: ${sumExpense.value}');
          print(count.value);
        }
        else{
          count.value += 1;
          sumIncome.value +=double.parse(element.data()['amount']);
          print('Sum I: ${sumIncome.value}');
          print(count.value);
        }
        return model.Transaction(
          expense: element.data()['expense'],
          title: element.data()['title'],
          amount: element.data()['amount'],
          date: element.data()['date'].toDate(),
            transactionRef: element.reference,
        );
      }).toList();
    });
  }
  Stream<List<model.Transaction>> getCustomTransactions(start, end) {
    count.value = 0;
    sumExpense.value = 0;
    sumIncome.value = 0;
    return FirebaseFirestore.instance
        .collection("User").doc(_auth.currentUser!.uid)
        .collection('Transactions')
        .where('date', isGreaterThanOrEqualTo: start)
        .where('date', isLessThanOrEqualTo: end)
        .snapshots()
        .map((event) {
      return event.docs.map((element) {
        if(element.data()['expense']){
          count.value += 1;
          sumExpense.value +=double.parse(element.data()['amount']);
          // print('Sum E: ${sumExpense.value}');
        }
        else{
          count.value += 1;
          sumIncome.value +=double.parse(element.data()['amount']);
          // print('Sum I: ${sumIncome.value}');
        }
        return model.Transaction(
          expense: element.data()['expense'],
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

  //SETTINGS...................................................................
}
