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
    (_) {
      /*Timer(
        Duration(
          seconds: 1,
        ),
            () {
          _.count.value = _.transactionList.length.toDouble();
        },
      );*/
              return Scaffold(
                appBar: AppBar(
                  title: Text('Transactions'),
                  backgroundColor: Color(0xff4e0d3a),
                  actions: [
                    InkWell(
                      onTap: () {
                        Get.bottomSheet(
                          Container(
                              height: 300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        child: InkWell(
                                          onTap: (){
                                            _.startDate = DateTime.now().subtract(Duration(days: 6, hours: DateTime.now().hour, minutes: DateTime.now().minute,
                                                seconds: DateTime.now().second+1, microseconds: DateTime.now().microsecond));
                                            _.endDate = DateTime.now();
                                            _.isFilter.value = true;
                                            _.update();
                                            Get.back();
                                          },
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(5)),
                                              color: Colors.blueGrey.shade400,
                                            ),
                                              // height: 20,
                                              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                              child: Text('Last 7 days', style: _.reportText.copyWith(color: Colors.white),)
                                          ),

                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        child: InkWell(
                                          onTap: (){
                                            _.startDate = DateTime.now().subtract(Duration(days: DateTime.now().weekday, hours: DateTime.now().hour, minutes: DateTime.now().minute,
                                                seconds: DateTime.now().second+1, microseconds: DateTime.now().microsecond));
                                            _.endDate = DateTime.now();
                                            _.isFilter.value = true;
                                            _.update();
                                            Get.back();
                                            print(_.startDate);
                                            print(_.endDate);
                                          },
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                                color: Colors.blueGrey.shade400,
                                              ),
                                              // height: 20,
                                              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                              child: Text('This week', style: _.reportText.copyWith(color: Colors.white),)
                                          ),

                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        child: InkWell(
                                          onTap: (){
                                            _.startDate = DateTime.now().subtract(Duration(days: DateTime.now().day-1, hours: DateTime.now().hour, minutes: DateTime.now().minute,
                                                seconds: DateTime.now().second+1, microseconds: DateTime.now().microsecond));
                                            _.endDate = DateTime.now();
                                            _.isFilter.value = true;
                                            _.update();
                                            Get.back();
                                            print(_.startDate);
                                            print(_.endDate);
                                          },
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                                color: Colors.blueGrey.shade400,
                                              ),
                                              // height: 20,
                                              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                              child: Text('This Month', style: _.reportText.copyWith(color: Colors.white),)
                                          ),

                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        child: InkWell(
                                          onTap: (){
                                            _.startDate = DateTime(DateTime.now().year);
                                            _.endDate = DateTime.now();
                                            _.isFilter.value = true;
                                            _.update();
                                            Get.back();
                                            print(_.startDate);
                                            print(_.endDate);
                                          },
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                                color: Colors.blueGrey.shade400,
                                              ),
                                              // height: 20,
                                              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                              child: Text('This Year', style: _.reportText.copyWith(color: Colors.white),)
                                          ),

                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10, top: 3, bottom: 2),
                                      child: Text('Custom', style: _.reportText,)),
                                  Obx(() => InkWell(
                                    onTap: () async {
                                      var date = await showDatePicker(
                                          context: context,
                                          initialDate: _.startDate,
                                          firstDate: DateTime(2010),
                                          lastDate: DateTime(2100));
                                      if (date != null) {
                                        _.startDate = date.subtract(Duration(hours: DateTime.now().hour, minutes: DateTime.now().minute,
                                            seconds: DateTime.now().second, microseconds: DateTime.now().microsecond));
                                        _.showStartDate.value =
                                            DateFormat.yMMMd().format(date);
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      margin:
                                      EdgeInsets.fromLTRB(5, 5, 20, 5),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 50,
                                                      child: Text('From')),
                                                  Container(
                                                    child: Text(
                                                        _.showStartDate.value == ''
                                                            ? 'Choose a date'
                                                            : ': '+_.showStartDate.value),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                child: Icon(
                                                  Icons.date_range_outlined,
                                                  color: Colors.blueGrey,
                                                ),
                                              )
                                            ],
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: _.dateError.value
                                                ? Text(
                                                'Please choose a date',
                                                style: TextStyle(
                                                    color:
                                                    Colors.red[800],
                                                    fontSize: 12))
                                                : Container(),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                                  Obx(() => InkWell(
                                    onTap: () async {
                                      var date = await showDatePicker(
                                          context: context,
                                          initialDate: _.endDate,
                                          firstDate: DateTime(2010),
                                          lastDate: DateTime(2100));
                                      if (date != null) {
                                        _.endDate = date;
                                        _.showEndDate.value =
                                            DateFormat.yMMMd().format(date);
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      margin:
                                      EdgeInsets.fromLTRB(5, 5, 20, 5),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    child: Text('To'),
                                                  width: 50,),
                                                  Container(
                                                    child: Text(
                                                        _.showEndDate.value == ''
                                                            ? 'Choose an End date'
                                                            : ': '+_.showEndDate.value),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                child: Icon(
                                                  Icons.date_range_outlined,
                                                  color: Colors.blueGrey,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 15, 10, 0),
                                        alignment: Alignment.bottomRight,
                                        child: MaterialButton(
                                          onPressed: () {
                                            _.startDate =DateTime.now();
                                            _.endDate = DateTime.now();
                                            _.isFilter.value = false;
                                            _.update();
                                            Get.back();
                                          },
                                          child: Text(
                                            'Clear Filters',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                          ),
                                          color: Color(0xff4e0d3a),
                                          minWidth: 100,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(8.0)),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 15, 10, 0),
                                        alignment: Alignment.bottomRight,
                                        child: MaterialButton(
                                          onPressed: () {
                                            _.isFilter.value = true;
                                            _.update();
                                            Get.back();
                                          },
                                          child: Text(
                                            'Apply',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                          ),
                                          color: Color(0xff4e0d3a),
                                          minWidth: 100,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(8.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          backgroundColor: Colors.white,
                          isDismissible: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                topLeft: Radius.circular(12)),
                          ),
                          enableDrag: false,
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Icon(Icons.filter_list_outlined),
                      ),
                    ),
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
                    Obx(() => Container(
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[50],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          height: 100,
                          width: double.infinity,
                          margin: EdgeInsets.all(10),
                          child: _.count.value >= 1
                              ? Container(
                                  child: Text(
                                    _.sumExpense.value == 0 && _.sumIncome.value == 0
                                        ? 'Loading...'
                                        : 'Total Expense : \u20B9' +
                                            _.sumExpense.value.toString(),
                                    style: TextStyle(
                                        color: Colors.blue[900],
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              : _.count.value == 0.5 ?Container(
                            child:
                            Text('Loading'),
                          ): Container(
                                  child:
                                      Text('Please Add your First Transaction'),
                                ),
                        )),
                    Obx(() =>
                        Container(
                          decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.all(Radius.circular(8))),
                          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: Theme(
                            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              initiallyExpanded: _.isExpanded.value,
                              onExpansionChanged: (bool isExpanded){
                                _.isExpanded.value = isExpanded;
                              },
                              subtitle: Text(
                                _.isExpanded.value?'Tap here to close':'Tap here to expand',
                                style: TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              title: Text('Full Report'
                              ),
                              children: [
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Total Income', style: _.reportText,),
                                          SizedBox(height: 5,),
                                          Text('Total Expense', style: _.reportText,),
                                          SizedBox(height: 5,),
                                          Text('Balance', style: _.reportText,),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(' :', style: _.reportText,),
                                          SizedBox(height: 5,),
                                          Text(' :', style: _.reportText,),
                                          SizedBox(height: 5,),
                                          Text(' :', style: _.reportText,),
                                        ],
                                      ),
                                      Expanded(child: Container()),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(_.sumIncome.value.toString(), style: _.reportText,),
                                          SizedBox(height: 5,),
                                          Text(_.sumExpense.value.toString(), style: _.reportText,),
                                          SizedBox(height: 5,),
                                          Text('${_.sumIncome.value - _.sumExpense.value}', style: _.reportText,),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                    ),
                    Expanded(
                      child: StreamBuilder(
                        stream: _.isFilter.value?_.getCustomTransactions(_.startDate, _.endDate):_.getTransactions(),
                        builder: (context, AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.waiting ||
                              !snapshot.hasData) {
                            return Center(
                              child: Container(
                                height: 40.0,
                                width: 40.0,
                                child: CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.grey[800]),
                                ),
                              ),
                            );
                          } else {
                            print('Length : ${_.transactionList.length}');
                            _.transactionList = snapshot.data;
                            _.transactionList
                                .sort((b, a) => a.date.compareTo(b.date));
                            return ListView.builder(
                                itemCount: _.transactionList.length,
                                itemBuilder: (context, int i) => Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.fromLTRB(
                                              10, 10, 10, 10),
                                          margin:
                                              EdgeInsets.fromLTRB(10, 1, 10, 0),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.blueGrey.shade100,
                                              width: 1.5,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            color: Colors.white,
                                            /*boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.7),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(0, 0.5), // changes position of shadow
                                    ),
                                  ],*/
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                child: Text(
                                                  snapshot.data[i].title,
                                                  style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              23,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            child: Text(
                                                              'Amount',
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      30),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              'Date',
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                  fontSize: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      30),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              'Type',
                                                              textAlign:
                                                              TextAlign
                                                                  .left,
                                                              style: TextStyle(
                                                                  fontSize: MediaQuery.of(
                                                                      context)
                                                                      .size
                                                                      .width /
                                                                      30),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            child: Text(
                                                              ' :',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      30),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              ' :',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                                  fontSize: MediaQuery.of(
                                                                      context)
                                                                      .size
                                                                      .width /
                                                                      30),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              ' :',
                                                              style: TextStyle(
                                                                  fontSize: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      30),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 20,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            child: Text(
                                                              "\u20B9" +
                                                                  double.parse(snapshot
                                                                          .data[
                                                                              i]
                                                                          .amount)
                                                                      .toPrecision(
                                                                          1)
                                                                      .toString(),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      30),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              DateFormat.yMMMd()
                                                                  .format(
                                                                      snapshot
                                                                          .data[
                                                                              i]
                                                                          .date),
                                                              style: TextStyle(
                                                                  fontSize: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      30),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              snapshot.data[i].expense?'Expense':'Income',
                                                              style: TextStyle(
                                                                color: snapshot.data[i].expense?Colors.red[400]
                                                                  :Colors.green[400],
                                                                  fontSize: MediaQuery.of(
                                                                      context)
                                                                      .size
                                                                      .width /
                                                                      30),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  IconButton(
                                                      icon: Icon(
                                                        Icons.delete,
                                                        color: Colors.red,
                                                        size: 23,
                                                      ),
                                                      onPressed: () {
                                                        _.deleteTransaction(
                                                            snapshot.data[i]
                                                                .transactionRef);
                                                      }),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ));
                          }
                        },
                      ),
                    ),
                  ],
                ),
                floatingActionButton: Container(
                  child: FloatingActionButton(
                    onPressed: () {
                      _.showDate.value = '';
                      _.dateError.value = false;
                      _.selectedDate = DateTime.now();
                      Get.bottomSheet(
                        Form(
                          key: _.transactionFormKey,
                          child: Container(
                              height: 375,
                              child: Column(
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
                                          focusedBorder:
                                              new UnderlineInputBorder(
                                                  borderSide: new BorderSide(
                                                      width: 2,
                                                      color:
                                                          Color(0xff4e0d3a)))),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                                    child: TextFormField(
                                      focusNode: _.myFocusNode,
                                      keyboardType: TextInputType.number,
                                      validator: RequiredValidator(
                                          errorText: 'Amount cannot be empty'),
                                      onChanged: (String val) {
                                        _.transaction.amount = val;
                                      },
                                      decoration: new InputDecoration(
                                        hintText: 'Enter Amount',
                                        labelText: 'Amount',
                                        labelStyle: TextStyle(
                                            color: _.myFocusNode.hasFocus
                                                ? Color(0xff4e0d3a)
                                                : Colors.grey),
                                        focusedBorder: new UnderlineInputBorder(
                                            borderSide: new BorderSide(
                                                width: 2,
                                                color: Color(0xff4e0d3a))),
                                      ),
                                    ),
                                  ),
                                  Obx(() => InkWell(
                                        onTap: () async {
                                          var date = await showDatePicker(
                                              context: context,
                                              initialDate: _.selectedDate,
                                              firstDate: DateTime(2010),
                                              lastDate: DateTime.now());
                                          if (date != null) {
                                            _.selectedDate = date;
                                            _.transaction.date = date;
                                            _.showDate.value =
                                                DateFormat.yMMMd().format(date);
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          margin:
                                              EdgeInsets.fromLTRB(5, 5, 20, 5),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    child: Text(
                                                        _.showDate.value == ''
                                                            ? 'Choose a date'
                                                            : _.showDate.value),
                                                  ),
                                                  Container(
                                                    child: Icon(
                                                      Icons.date_range_outlined,
                                                      color: Colors.blueGrey,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                alignment: Alignment.topLeft,
                                                child: _.dateError.value
                                                    ? Text(
                                                        'Please choose a date',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.red[800],
                                                            fontSize: 12))
                                                    : Container(),
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                                    margin: EdgeInsets.fromLTRB(0, 1, 10, 1),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text('Type :'),
                                            Obx(() =>
                                                DropdownButtonHideUnderline(
                                                  child: DropdownButton(
                                                    items: ['Select', 'Expense', 'Income'].map((String dropDownStringItem){
                                                      return DropdownMenuItem<String>(
                                                          value: dropDownStringItem,
                                                          child: Text(dropDownStringItem,
                                                            style: TextStyle(
                                                                color: dropDownStringItem == 'Expense'?
                                                                Colors.red[800]
                                                                    :dropDownStringItem == 'Income'?
                                                                Colors.green[600]:Colors.grey
                                                            ),
                                                          )
                                                      );
                                                    }).toList(),
                                                    onChanged: (String? newValue){
                                                      _.currentItem.value = newValue!;
                                                      if(newValue == 'Expense'){
                                                        _.transaction.expense = true;
                                                      }
                                                      else{
                                                        _.transaction.expense = false;
                                                      }
                                                    },
                                                    value: _.currentItem.value,
                                                  ),
                                                )
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(' '),
                                            Obx(() =>
                                                Container(
                                                  child: _.currentItem.value == 'Select'?Text('Please select a type',
                                                    style: TextStyle(color: Colors.red, fontSize: 12),):Text(''),
                                                )
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 15, 10, 0),
                                    alignment: Alignment.bottomRight,
                                    child: MaterialButton(
                                      onPressed: () {
                                        if (_.transactionFormKey.currentState!
                                                .validate() &&
                                            _.showDate.value != '' && _.currentItem.value != 'Select') {
                                          _.addTransaction();
                                          Get.back();
                                        } else if (_.showDate.value == '') {
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
                                      color: Color(0xff4e0d3a),
                                      minWidth: 100,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0)),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        backgroundColor: Colors.white,
                        isDismissible: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              topLeft: Radius.circular(12)),
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
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
              );
            });
  }
}
