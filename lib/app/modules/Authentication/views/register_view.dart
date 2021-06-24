import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import '../controllers/authentication_controller.dart';

class RegisterView extends GetView<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<AuthenticationController>(
        builder: (_)=> GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text('Register'),
              backgroundColor: Color(0xff4e0d3a),
            ),
            body: Center(
              child: Form(
                key: _.registerFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 7, 10, 7),
                      child: TextFormField(
                        onChanged: (String value) {
                          _.user.name = value;
                        },
                        validator: RequiredValidator(errorText: 'Please enter your Name'),
                        style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          hintText: 'Name',
                          hintStyle: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w500),
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
                        )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 7, 10, 7),
                      child: TextFormField(
                        validator: MultiValidator([
                          EmailValidator(errorText: 'Enter a valid Email'),
                          RequiredValidator(errorText: 'Please enter your Email here')
                        ]),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (String value) {
                          _.user.email = value;
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
                      margin: EdgeInsets.fromLTRB(10, 7, 10, 7),
                      child: TextFormField(
                        style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w500),
                        obscureText: _.visibleConfirm.value,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _.visibleConfirm.value ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey[400],
                            ),
                            onPressed: () {
                              _.visibleConfirm.value = !_.visibleConfirm.value;
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
                        validator: (value) {
                          if (value == '') {
                            return 'Please re-enter your password';
                          } else if (value != _.pass) {
                            print(_.pass);
                            return 'Passwords do not match';
                          } else {
                            return null;
                          }
                        },
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
                          if(_.registerFormKey.currentState!.validate()){
                            print('yes');
                            _.userRegistration(_.user, _.pass);
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * .36,
                          height: 50,
                          alignment: Alignment(0, 0),
                          child: Text(
                            'Register',
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
              ),
            ),
          ),
        )
    );
  }
}
