// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gylac_dashboard/Screens/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _checkbox = false;
  bool visible = false;
  TextEditingController email = TextEditingController(text: 'admin');
  TextEditingController password = TextEditingController(text: 'admin');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'asset/DashboardIcons/Admin Panel 2.png'),
                fit: BoxFit.fitWidth)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Row(
            //   children: [
            //     Image.asset(logo, height: MediaQuery.of(context).size.width * .15)
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Container(
                //   width: MediaQuery.of(context).size.width * .4,
                //   height: MediaQuery.of(context).size.height * .5,
                //   decoration: BoxDecoration(
                //       color: Colors.blue,
                //       image: DecorationImage(
                //           image: AssetImage(
                //             'asset/DashboardIcons/Template-banner-of-car-pick-up-and-drop-service-06-large.jpg',
                //           ),
                //           fit: BoxFit.cover)),
                // ),
                
                Padding(
                  padding:  EdgeInsets.only(
                    right:MediaQuery.of(context).size.width *.03,
                    top:MediaQuery.of(context).size.height *.05
                    ),
                  child: loginContainer(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget loginContainer() {
    return Container(
      width: MediaQuery.of(context).size.width * .4,
      height: MediaQuery.of(context).size.height * .5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Form(
        // key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .3,
              height: MediaQuery.of(context).size.height * .45,
              // color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                  'adminLogin'.tr ,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * .03,
                        fontWeight: FontWeight.bold,
                        ),
                  ),
                  usernameField(),
                  passwordField(),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Row(
                      children: [
                        Checkbox(
                          value: _checkbox,
                          onChanged: (value) {
                            setState(() {
                              _checkbox = !_checkbox;
                            });
                          },
                        ),
                        Text(
                        'rememberpass'.tr ,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .28,
                    height: MediaQuery.of(context).size.height * .05,
                    child: ElevatedButton(
                      onPressed: () {
                        if (password.text == 'admin' && email.text == 'admin') {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage()));
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * .1,
                                    child: Center(
                                      child: Text('invalidEmail'.tr),
                                    ),
                                  ),
                                );
                              });
                            }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xffFF8A00),
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text(
                      'login'.tr ,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('forgotPass'.tr,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * .012,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w300
                                // dynamicWidth(context, 0.013),
                                )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget usernameField() {
    return Container(
        height: MediaQuery.of(context).size.height * .08,
        width: MediaQuery.of(context).size.width * .3,
        padding: EdgeInsets.all(10.0),
        child: TextFormField(
          controller: email,
          // initialValue: "sdf",
          // ..text = loginUser == null ? '' : loginUser.toString(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'userNamereq'.tr ;
            } else {}
          },
          autocorrect: true,
          decoration: InputDecoration(
            labelText: 'userName'.tr,
            suffixIcon: Icon(Icons.person),
            labelStyle: TextStyle(color: Colors.grey),
            filled: false,
            fillColor: Colors.white70,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Colors.grey, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.orange, width: 2),
            ),
          ),
        ));
  }

  Widget passwordField() {
    return Container(
        height: MediaQuery.of(context).size.height * .08,
        width: MediaQuery.of(context).size.width * .3,
        padding: EdgeInsets.all(10.0),
        child: TextFormField(
          // initialValue: "sdfsd",
          controller: password,
          // ..text = loginPassword == null ? "" : loginPassword.toString(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'passReq'.tr;
            } else {}
          },
          obscureText: visible,
          autocorrect: true,
          decoration: InputDecoration(
            labelText: 'password'.tr,
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    visible = !visible;
                  });
                },
                icon: visible
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off)),
            suffixIconColor: Colors.grey,
            labelStyle: TextStyle(color: Colors.grey),
            filled: false,
            // fillColor: Colors.white70,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Colors.grey, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.orange, width: 2),
            ),
          ),
        ));
  }
}
