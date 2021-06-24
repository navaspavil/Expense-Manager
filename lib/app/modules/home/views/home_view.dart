import 'package:expense_manager/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder:
    (_) => Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
        backgroundColor: Color(0xff4e0d3a),
        actions: [
          InkWell(
            onTap: () => Get.toNamed(Routes.SETTINGS),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Icon(Icons.settings),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [

          ],
        ),
      ),
    )
    );
  }
}
