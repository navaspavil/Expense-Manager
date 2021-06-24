import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/app/data/models/User.dart' as model;
import 'package:expense_manager/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  final registerFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();
  var visiblePass = true.obs;
  Rxn<User> _firebaseUser = Rxn<User>();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String pass ='';
  String loginEmail ='';
  String? get userId => _firebaseUser.value?.uid;
  var visibleConfirm = true.obs;
  model.User user = model.User(
    email:  '',
    name: '',
    uid: ''
  );
  model.User? loginUser;

  void userRegistration(model.User user, String pass) async {
    await _auth.createUserWithEmailAndPassword(email: user.email, password: pass)
    .then((value) async {
      user.uid = value.user!.uid;
      print('id:' + user.uid);
    }).catchError((onError){
      loginSnackBar(onError.message);
    });

    FirebaseFirestore.instance.collection('User').doc(user.uid).set({
      'name' : user.name,
      'email' : user.email
    });
  }
  loginSnackBar(String error) {
    return Get.snackbar("Oops!! ", error,
        animationDuration: Duration(milliseconds: 600),
        padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red);
  }
  void login(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) async {
      await getUser(_auth.currentUser!.uid).whenComplete(() async {

        Get.offAndToNamed(Routes.HOME);
      });
    }).catchError((onError) {
      if (onError.message == 'The password is invalid or the user does not have a password.') {
        loginSnackBar('Incorrect Password');
      } else if (onError.message ==
          'There is no user record corresponding to this identifier. The user may have been deleted.') {
        loginSnackBar('Email is not registered with us');
      } else {
        Get.snackbar("Error while sign in ", onError.message, backgroundColor: Colors.red);
      }
    });
  }

  Future getUser(String uid) async {
    await FirebaseFirestore.instance.collection("User").doc(uid).get().then((value) {
      loginUser = model.User(name: value.data()!['name'],
      email: value.data()!['email'],
      uid: _auth.currentUser!.uid);
    });
    print(loginUser!.email);
  }
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
