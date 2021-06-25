import 'package:expense_manager/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

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
      floatingActionButton: Container(
        child: FloatingActionButton(
          onPressed: (){
            Get.bottomSheet(
              Container(
                  height: 300,
                  child:Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                        child: TextFormField(
                          focusNode: _.myFocusNode1,
                          validator: RequiredValidator(
                              errorText: 'Title cannot be empty'),
                          onChanged: (String val) {
                          },
                          decoration: new InputDecoration(
                              hintText: 'Enter Title',
                              labelText: 'Title',
                              labelStyle: TextStyle(
                                  color: _.myFocusNode1.hasFocus
                                      ? Color(0xff4e0d3a)
                                      : Colors.grey),
                              focusedBorder: new UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                      width: 2, color: Color(0xff4e0d3a)))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                        child: TextFormField(
                          focusNode: _.myFocusNode,
                          keyboardType: TextInputType.number,
                          validator: RequiredValidator(
                              errorText: 'Amount cannot be empty'),
                          onChanged: (String val) {
                          },
                          maxLength: 4,
                          decoration: new InputDecoration(
                            hintText: 'Enter Amount',
                            labelText: 'Amount',
                            labelStyle: TextStyle(
                                color: _.myFocusNode.hasFocus
                                    ? Color(0xff4e0d3a)
                                    : Colors.grey),
                            focusedBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(
                                    width: 2, color: Color(0xff4e0d3a))),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        alignment: Alignment.bottomRight,
                        child: MaterialButton(
                          onPressed: () {

                          },
                          child: Text(
                            'Add Transaction',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          color: Colors.purple,
                          minWidth: 100,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                      ),
                    ],
                  )
              ),
              backgroundColor: Colors.white,
              isDismissible: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(12)),
            // side: BorderSide(
            //           width: 2,
            //           color: Color(0xff4e0d3a),
            //       )
              ),
              enableDrag: false,

            );
          },
          backgroundColor: Color(0xff4e0d3a),
          child: Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    )
    );
  }
}
