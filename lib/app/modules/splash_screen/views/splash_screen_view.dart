import 'dart:async';

import 'package:expense_manager/app/modules/splash_screen/controllers/splash_screen_controller.dart';
import 'package:expense_manager/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(builder: (_) {
      Timer(
        Duration(
          seconds: 2,
        ),
            () async {
          if (_.auth.currentUser == null) {
            Get.offAndToNamed(Routes.LOGIN);
          } else {
            Get.offAndToNamed(Routes.HOME);
          }
        },
      );
      return Scaffold(
        body: SafeArea(
          child: Container(
            // color: Colors.black,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('EX₹ENSE\nMANAGER',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue[900]
                  ),),
                  SizedBox(
                    height: 100,
                  ),
                  Center(
                      child: CircularProgressIndicator()
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

