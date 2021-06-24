import 'package:expense_manager/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:get/get.dart';

import '../controllers/authentication_controller.dart';

class LoginView extends GetView<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<AuthenticationController>(builder: (_) =>
        Scaffold(
          appBar: AppBar(
            title: Text('Login'),
            actions: [
              InkWell(
                onTap: (){
                  Get.offAndToNamed(Routes.REGISTER);
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  height: double.infinity,
                    alignment: Alignment.center,
                    child: Text('Register',
                    style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.w500),)),
              )
            ],
            backgroundColor: Color(0xff4e0d3a),
          ),
          body: Center(
            child: Form(
              key: _.loginFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 7, 10, 7),
                    child: TextFormField(
                      validator: MultiValidator([
                        EmailValidator(errorText: 'Enter a valid Email'),
                        RequiredValidator(errorText: 'Please enter your Email here')
                      ]),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (String value) {
                        _.loginEmail = value;
                      },
                      style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.w500),
                        filled: true,
                        fillColor: Colors.grey[300],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            borderSide: BorderSide(color: Colors.blue)
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 7, 10, 7),
                    child: TextFormField(
                      onChanged: (String value) {
                        _.pass = value;
                      },
                      style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w500),
                      obscureText: _.visiblePass.value,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _.visiblePass.value ? Icons.visibility : Icons.visibility_off,
                            color: Colors.grey[400],
                          ),
                          onPressed: () {
                            _.visiblePass.value = !_.visiblePass.value;
                            _.update();
                          },
                        ),
                        filled: true,
                        fillColor: Colors.grey[300],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            borderSide: BorderSide(color: Colors.blue)
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ),
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'Please choose a Password'),
                        MinLengthValidator(6, errorText: 'At least 6 characters needed')
                      ]),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff4267B2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: EdgeInsets.fromLTRB(
                        _screenWidth * .04, 5, _screenWidth * .04, MediaQuery.of(context).size.height * 0.02),
                    width: _screenWidth * .3,
                    height: 50,
                    alignment: Alignment(0, 0),
                    child: InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      onTap: () {
                        if(_.loginFormKey.currentState!.validate()){
                          _.login(_.loginEmail, _.pass);
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * .36,
                        height: 50,
                        alignment: Alignment(0, 0),
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ),
        )
    );
  }
}
