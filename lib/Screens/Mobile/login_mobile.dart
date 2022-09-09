// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gylac_dashboard/Screens/Mobile/mobile_home.dart';
import 'package:gylac_dashboard/Screens/home_page.dart';
import 'package:gylac_dashboard/Utils/color.dart';
import 'package:gylac_dashboard/Utils/image.dart';
import '../../Utils/style.dart';

class LoginMobile extends StatefulWidget {
  const LoginMobile({Key? key}) : super(key: key);

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
  TextEditingController email = TextEditingController(text: 'admin');
  TextEditingController password = TextEditingController(text: 'admin');
  final _formKey = GlobalKey<FormState>();

  // late AuthProvider _authProvider;
  // @override
  // void initState() {
  //   super.initState();
  //   _authProvider = Provider.of<AuthProvider>(context);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/Group 8503.png'),
              fit: BoxFit.cover,
            ),
          ),
          // color: Colors.white,
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.47,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        // color: Colors.blue,

                        ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.07,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                                child: Text("Admin  login",
                                    style: MyTextStyle.poppins().copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.06)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.00,
                              // bottom: MediaQuery.of(context).size.width *0.04
                            ),
                            child: Text('Email',
                                style: MyTextStyle.poppins().copyWith(
                                  color: themeColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                )),
                          ),
                          Container(
                            color: Colors.white,
                            child: TextFormField(
                              controller: email,
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 13,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                prefixIcon: Image.asset(
                                  messageimage,
                                  scale: 2.7,
                                ),

                                labelStyle: const TextStyle(),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: themeColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: themeColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: themeColor),
                                ),
                                hintText: 'youremail',
                                // labelText:"Your Name"
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.48,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.07,
                        top: MediaQuery.of(context).size.height * 0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.02,
                            // bottom: MediaQuery.of(context).size.width *0.04
                          ),
                          child: Text('Password',
                              style: MyTextStyle.poppins().copyWith(
                                  color: themeColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.04)),
                        ),
                        Container(
                          color: Colors.white,
                          child: TextFormField(
                              controller: password,
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 13,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.01, // HERE THE IMPORTANT PART
                                ),
                                prefixIcon: Image.asset(
                                  lockimage,
                                  scale: 2.7,
                                ),
                                labelStyle: const TextStyle(),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: themeColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: themeColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: themeColor),
                                ),
                                hintText: 'typestrongpassword',
                                // labelText:"Your Name"
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.001,
                              left: MediaQuery.of(context).size.width * 0.4
                              // bottom: MediaQuery.of(context).size.width *0.04
                              ),
                          child: Text('Forgotpassword',
                              style: MyTextStyle.poppins().copyWith(
                                  color: themeColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.04)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Center(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: MaterialButton(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              onPressed: () async {
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
                                      child: Text('Invalid email or password'),
                                    ),
                                  ),
                                );
                              });
                            }
                              },
                              color: themeColor,
                              child: Text(
                                'login'.toUpperCase(),
                                style: MyTextStyle.poppins().copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
