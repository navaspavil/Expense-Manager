import 'package:expense_manager/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream:  _.getTransactions(),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
                print(snapshot);
                if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
                  return Center(
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.grey[800]),
                      ),
                    ),
                  );
                } else {
                  _.transactionList = snapshot.data;
                  _.transactionList.sort((b,a) => a.date.compareTo(b.date));
                          return ListView.builder(
                              itemCount: _.transactionList.length,
                              itemBuilder: (context, int i) =>
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 1, 10, 1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                              backgroundColor: Color(0xff4e0d3a),
                              radius:
                              MediaQuery.of(context).size.height / 20,
                              child: Text(
                                "\u20B9" + snapshot.data[i].amount,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500
                                ),
                              )),
                          title: Text(
                            snapshot.data[i].title,
                            style: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width / 23,
                                fontWeight: FontWeight.w500),
                          ),
                          subtitle: Text(
                            DateFormat.yMMMd().format(snapshot.data[i].date),
                            style: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width / 30),
                          ),
                          trailing: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 23,
                              ),
                              onPressed: () {}),
                        ),
                      )
                          );
                        }
                      },

            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        child: FloatingActionButton(
          onPressed: (){
            _.showDate.value = '';
            _.dateError.value = false;
            _.selectedDate = DateTime.now();
            Get.bottomSheet(
              Form(
                key: _.transactionFormKey,
                child: Container(
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
                              _.transaction.title = val;
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
                              _.transaction.amount = val;
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
                        Obx(() => InkWell(
                          onTap: () async{
                            var date = await showDatePicker(
                                context: context,
                                initialDate: _.selectedDate,
                                firstDate: DateTime(2010),
                                lastDate: DateTime(2100));
                            if(date!=null){
                              _.selectedDate = date;
                              _.transaction.date = date;
                              _.showDate.value = DateFormat.yMMMd().format(date);
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(5, 5, 20, 5),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Text(_.showDate.value == ''?'Choose a date':
                                      _.showDate.value
                                      ),
                                    ),
                                    Container(
                                      child: Icon(Icons.calendar_today_rounded),
                                    )
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: _.dateError.value?Text('Please choose a date',
                                  style: TextStyle(color: Colors.red[800], fontSize: 12)):
                                  Container(),
                                )
                              ],
                            ),
                          ),
                        )),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 15, 10, 0),
                          alignment: Alignment.bottomRight,
                          child: MaterialButton(
                            onPressed: () {
                              if(_.transactionFormKey.currentState!.validate()
                              && _.showDate.value != ''){
                                _.addTransaction();
                                Get.back();
                              }
                              else if (_.showDate.value == ''){
                                _.dateError.value = true;
                              }
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
