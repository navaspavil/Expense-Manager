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
            () {
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'EX',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue[900]
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '₹',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Colors.red[900]
                            ),
                          ),
                          TextSpan(
                            text: 'ENSE\nMANAGER',
                            style: TextStyle(
                              height: 1.5,
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue[900]
                            ),
                          )
                        ]
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Center(
                          child: CircularProgressIndicator(
                          )
                      ),
                      SizedBox(height: 30,),
                      Text('   Loading...',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue[900]
                        ),)
                    ],
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

