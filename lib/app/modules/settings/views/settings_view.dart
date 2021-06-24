import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
        builder: (_) =>
        Scaffold(
          appBar: AppBar(
            title: Text('Settings'),
            backgroundColor: Color(0xff4e0d3a),
          ),
          body: Center(
            child: InkWell(
              onTap: () => _.signOut(),
              child: Text(
                'Logout',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        )
    );
  }
}
