import 'package:expense_manager/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SettingsView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder:
    (_) => Scaffold(
      appBar: AppBar(
        title: Text('SettingsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SettingsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    )
    );
  }
}
