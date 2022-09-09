// // ignore_for_file: prefer_const_constructors, unnecessary_new, avoid_print, avoid_single_cascade_in_expression_statements, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

// // import 'package:dcache/dcache.dart';
// import 'package:flutter/material.dart';




// class LoginWeb extends StatefulWidget {
//   LoginWeb({Key? key}) : super(key: key);

//   @override
//   _LoginWebState createState() => _LoginWebState();
// }

// class _LoginWebState extends State<LoginWeb> {
//   // bool visible = true;
//   // bool _checkbox = false;
//   // TextEditingController email = TextEditingController();
//   // TextEditingController password = TextEditingController();
//   // final _formKey = GlobalKey<FormState>();
//   // late AuthServices _authServices;
//   // late LoadingProvider _loadingProvider;
//   // late MyAlert _myAlert;
//   // var loginUser = '';
//   // var loginPassword = '';
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _authServices = AuthServices();
//   //   _myAlert = MyAlert();
//   //   _loadingProvider = Provider.of<LoadingProvider>(context, listen: false);
//   //   getDAta();
//   // }

//   // getDAta() async {
//   //   loginUser = await sPrefServices.getString('loginUser');

//   //   loginPassword = await sPrefServices.getString('loginPassword');

//   //   print('loginUser: $loginUser');
//   //   print('loginPassword: $loginPassword');
//   //   setState(() {
//   //     email..text = loginUser.toString();
//   //     password..text = loginPassword.toString();
//   //   });
//   // }

//   // login() async {
//   //   print("click");
//   //   if (_formKey.currentState!.validate()) {
//   //     print(_loadingProvider.loading);
//   //     _authServices.logIn(context, email.text, password.text);

//   //     if (_checkbox == true) {
//   //       sPrefServices.saveString('loginUser', email.text.toString());
//   //       sPrefServices.saveString('loginPassword', password.text.toString());
//   //     }
//   //   } else {}
//   // }

//   @override
//   Widget build(BuildContext context) {
//     // bool _loading = Provider.of<LoadingProvider>(
//     //   context,
//     // ).loading;

//     return Scaffold(
//       body: Container(
//         // width: dynamicWidth(context, 1),
//         // height: dynamicHeight(context, 1),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           // image: DecorationImage(
//           //   image: AssetImage(AppPath.loginbg),
//           //   fit: BoxFit.fill,
//           // ),
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                     color: Colors.purple,
//                     borderRadius: BorderRadius.only(
//                       bottomRight: Radius.circular(20),
//                       bottomLeft: Radius.circular(20),
//                     )),
//                 // height: 69,
//                 child: Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         showDialog(
//                             context: context,
//                             builder: (context) {
//                               return Dialog(
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(20)),
//                                 elevation: 10,
//                                 insetPadding: const EdgeInsets.all(10),
//                                 backgroundColor:Colors.white,
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(
//                                     vertical: 10,
//                                     horizontal: 40,
//                                   ),
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.6,
//                                   height: 400,
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(10.0),
//                                     child: SingleChildScrollView(
//                                       child: Column(
//                                         children: [
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.center,
//                                                 children: [
//                                                   Image.asset(
//                                                     "assets/png/important.png",
//                                                     width: 35,
//                                                     height: 35,
//                                                   ),
//                                                   SizedBox(
//                                                     width: 10,
//                                                   ),
//                                                   Text(
//                                                     'Important',
//                                                     style: TextStyle(
//                                                         fontSize: 24,
//                                                         color:
//                                                             Color(0XFFE50027)),
//                                                     // endColor: Colors.purple,
//                                                   ),
//                                                 ],
//                                               ),
//                                               GestureDetector(
//                                                   onTap: () {
//                                                     Navigator.pop(context);
//                                                   },
//                                                   child: const Icon(
//                                                     Icons.circle_notifications,
//                                                     color: Colors.black,
//                                                   )),
//                                             ],
//                                           ),
//                                           SizedBox(
//                                             height: 20,
//                                           ),
//                                           Text(
//                                             "DISCLAIMER FROM DEVELOPER",
//                                             style: TextStyle(
//                                                 fontFamily: 'Poppins',
//                                                 color: Colors.purple,
//                                                 fontSize: 30,
//                                                 fontWeight: FontWeight.w900),
//                                           ),
//                                           SizedBox(
//                                             height: 20,
//                                           ),
//                                           // Text(
//                                           //   TextSpan(
//                                           //     style: TextStyle(
//                                           //         fontFamily: 'Poppins',
//                                           //         fontSize: 18,
//                                           //         fontWeight: FontWeight.bold),
//                                           //     text:
//                                           //         'United Track System (Pvt.) Limited (UTS),',
//                                           //     children: <TextSpan>[
//                                           //       TextSpan(
//                                           //           text:
//                                           //               'WEBTRACK Application is being updated time to time, to improve user experience, reports and for additional features. Since UTS makes every effort to ensure security and accuracy of data and information, UTS, United International Group and its subsidiaries, hereby take no responsibility of errors.\n\n',
//                                           //           style: TextStyle(
//                                           //               fontFamily: 'Poppins',
//                                           //               fontSize: 18,
//                                           //               fontWeight:
//                                           //                   FontWeight.w300)),
//                                           //       TextSpan(
//                                           //           text:
//                                           //               'For any further information, UTS 24 hours call center may be contacted at: UAN: 111-000-320 \n\nUnited Software & Technologies International (Pvt) Ltd - UIG',
//                                           //           style: TextStyle(
//                                           //               fontFamily: 'Poppins',
//                                           //               fontSize: 18,
//                                           //               fontWeight:
//                                           //                   FontWeight.w300)),
//                                           //     ],
//                                           //   ),
//                                           // )
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             });
//                       },
//                       child: Container(
//                         width: 217,
//                         height: 50,
//                         margin: EdgeInsets.symmetric(
//                           vertical: 5,
//                           horizontal: 5,
//                         ),
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(20),
//                               bottomLeft: Radius.circular(20),
//                             )),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image.asset(
//                               'assets/png/important.png',
//                               width: 35,
//                               height: 35,
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Text(
//                               'Important',
//                               style: TextStyle(
//                                   fontSize: 24, color: Color(0XFFE50027)),
//                               // endColor: Colors.purple,
//                             ),
//                             // Text(
//                             //   "Important",
//                             //   style: TextStyle(
//                             //       fontFamily: 'Ubuntu',
//                             //       fontSize: 24,
//                             //       color: const Color(0XFFE50027)),
//                             // ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     // Expanded(
//                     //   child: Container(
//                     //     // width: dynamicWidth(context, 0.87),
//                     //     height: 50,
//                     //     decoration: BoxDecoration(
//                     //         // color: Colors.purple,
//                     //         // boxShadow: [
//                     //         //   BoxShadow(
//                     //         //     color: Colors.blackithOpacity(0.25),
//                     //         //     blurRadius: 6.0,
//                     //         //   ),
//                     //         // ],
//                     //         ),
//                     //     child: Center(
//                     //       child: TextScroll(
//                     //         'DISCLAIMER FROM DEVELOPER,United Track System (Pvt.) Limited (UTS), WEB TRACK Application is being updated time to time, to improve user experience, reports and for additional features. Since UTS makes every effort to ensure security and accuracy of data and information, UTS, United International Group and its subsidiaries, hereby take no responsibility of errors.For any further information, UTS 24 hours call center may be contacted at: UAN: 111-000-320United Software & Technologies International (Pvt) Ltd - UIG',
//                     //         style: TextStyle(
//                     //             fontFamily: 'Poppins',
//                     //             fontSize: 18,
//                     //             color: white,
//                     //             fontWeight: FontWeight.bold),
//                     //         textAlign: TextAlignight,
//                     //         selectable: false,
//                     //       ),
//                     //     ),
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               ),
//               Container(
//                 // color: Colors.amber,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       width: 50,
//                     ),
//                     Image.asset(
//                       ,
//                       width: 400,
//                       height: 145,
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: dynamicWidth(context, 0.05),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignmentaceBetween,
//                   children: [
//                     //  left Box
//                     leftSide(),
//                     Container(
//                       // height: dynamicHeight(context, 0.9),
//                       // color: Colors.amber,
//                       child: Column(
//                         // mainAxisAlignment: MainAxisAlignmentaceEvenly,
//                         children: [
//                           Container(
//                             padding: EdgeInsets.only(
//                               right: dynamicWidth(context, 0.04),
//                               left: dynamicWidth(context, 0.04),
//                               top: dynamicHeight(context, 0.06),
//                               bottom: dynamicHeight(context, 0.1),
//                             ),
//                             width: 730,
//                             height: 644,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(50),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.greyithOpacity(0.5),
//                                   spreadRadius: 5,
//                                   blurRadius: 7,
//                                   offset: Offset(
//                                       0, 3), // changes position of shadow
//                                 ),
//                               ],
//                               // image: DecorationImage(
//                               //   image: AssetImage(AppPath.loginhoribg),
//                               //   fit: BoxFit.fill,
//                               // ),
//                             ),
//                             child: Form(
//                               key: _formKey,
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignmentaceEvenly,
//                                 children: [
//                                   mytext(
//                                     context,
//                                     "Login",
//                                     45,
//                                     Colors.purple,
//                                     fontFamily: "Poppins",
//                                     boldText: FontWeight900,
//                                   ),

//                                   // myspace(context, 0.03),
//                                   Column(
//                                     children: [
//                                       usernameField(),
//                                       passwordField(),
//                                     ],
//                                   ),
//                                   // myspace(context, 0.013),
//                                   Container(
                                  
//                                     child: Row(
//                                       children: [
//                                         Checkbox(
//                                           value: _checkbox,
//                                           onChanged: (value) {
//                                             setState(() {
//                                               _checkbox = !_checkbox;
//                                               print('_checkbox: $_checkbox');
//                                             });
//                                           },
//                                         ),
//                                         Text(
//                                           'Remember password',
//                                           style: TextStyle(
//                                             fontFamily: "Poppins",
//                                             fontSize: 18,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   // myspace(context, 0.019),
//                                   coloredButton(
//                                       context,
//                                       _loading == true
//                                           ? SizedBox(
//                                               height:
//                                                   dynamicHeight(context, .04),
//                                               width:
//                                                   dynamicWidth(context, 0.03),
//                                               child: CircularProgressIndicator(
//                                                 color: Colors.white,
//                                                 strokeWidth: 3,
//                                               ),
//                                             )
//                                           : Text(
//                                               "Login",
//                                               style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontFamily: "Poppins",
//                                                 fontSize: dynamicWidth(
//                                                     context, 0.015),
//                                               ),
//                                             ),
//                                       Colors.purple,
//                                       width: 648,
//                                       fontSize: 0.015, function: () {
//                                     login();
//                                   }),
//                                   // myspace(context, 0.02),
//                                   Container(
//                                     width: dynamicWidth(context, 0.35),
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       children: [
//                                         Text(
//                                           'Forgot Password?',
//                                           style: TextStyle(
//                                             fontFamily: "Poppins",
//                                             fontSize:
//                                                 dynamicWidth(context, 0.013),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   // myspace(context, 0.05),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget leftSide() {
//     return Expanded(
//       child: Container(
//         // color: Colors.amber,
//         // width: dynamicWidth(context, 0.45),
//         // height: dynamicHeight(context, 0.8),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Lottie.asset(
//                   'assets/raw/login_car.json',
//                   width: 675,
//                   height: 675,
//                 ),
//                 // Container(
//                 //   margin: EdgeInsets.only(
//                 //     bottom: 90,
//                 //   ),
//                 //   padding: EdgeInsets.symmetric(
//                 //       vertical: dynamicHeight(context, 0.05),
//                 //       horizontal: dynamicWidth(context, 0.04)),
//                 //   width: dynamicWidth(context, 0.4),
//                 //   // height: dynamicHeight(context, 0.35),
//                 //   decoration: BoxDecoration(
//                 //     image: DecorationImage(
//                 //       image: AssetImage(AppPath.loginhoribg),
//                 //       fit: BoxFit.fill,
//                 //     ),
//                 //   ),
//                 //   child: SingleChildScrollView(
//                 //     child: Column(
//                 //       crossAxisAlignment: CrossAxisAlignment.start,
//                 //       children: [
//                 //         text(context, "*DISCLAIMER FROM DEVELOPER", 0.01,
//                 //             Colors.black,
//                 //             fontFamily: "Ubuntu", boldText: FontWeight700),
//                 //         myspace(context, 0.03),
//                 //         RichText(
//                 //           text: TextSpan(
//                 //             // Here is the explicit parent TextStyle

//                 //             children: <TextSpan>[
//                 //               new TextSpan(
//                 //                 text: "United Track System (Pvt.) Limited (UTS),",
//                 //                 style: TextStyle(
//                 //                     fontSize: dynamicWidth(context, 0.01),
//                 //                     fontWeight: FontWeight700,
//                 //                     fontFamily: "Ubuntu",
//                 //                     color: Colors.black),
//                 //               ),
//                 //               new TextSpan(
//                 //                 text:
//                 //                     "WEBTRACK Application is being updated time to time, to improve user experience, reports and for additional features. Since UTS makes every effort to ensure security and accuracy of   and information, UTS, United International Group and its subsidiaries, hereby take no responsibility of errors. \nFor any further information, UTS 24 hours call center may be contacted at: UAN: 111-000-320",
//                 //                 style: TextStyle(
//                 //                     fontSize: dynamicWidth(context, 0.01),
//                 //                     fontWeight: FontWeight700,
//                 //                     fontFamily: "Ubuntu",
//                 //                     color: Colors.grey),
//                 //               )
//                 //             ],
//                 //           ),
//                 //         ),
//                 //         myspace(context, 0.03),
//                 //         text(
//                 //             context,
//                 //             "United Software & Technologies International (Pvt) Ltd - UIG",
//                 //             0.01,
//                 //             Colors.black,
//                 //             boldText: FontWeight700),
//                 //       ],
//                 //     ),
//                 //   ),
//                 // ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget usernameField() {
//     return Container(
//         height: 94,
//         width: 648,
//         padding: EdgeInsets.all(10.0),
//         child: TextFormField(
//           controller: email,
//           // initialValue: "sdf",
//           // ..text = loginUser == null ? '' : loginUser.toString(),
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return "Username or Email is required";
//             } else {}
//           },
//           autocorrect: true,
//           decoration: InputDecoration(
//             labelText: 'Username',
//             suffixIcon: Icon(Icons.person),
//             labelStyle: TextStyle(color: Colors.grey),
//             filled: false,
//             fillColor: Colors.white70,
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(12.0)),
//               borderSide: BorderSide(color: Colors.grey, width: 2),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(10.0)),
//               borderSide: BorderSide(color: Colors.orange, width: 2),
//             ),
//           ),
//         ));
//   }

//   Widget passwordField() {
//     return Container(
//          height: 94,
//         width: 648,
//         padding: EdgeInsets.all(10.0),
//         child: TextFormField(
//           // initialValue: "sdfsd",
//           controller: password,
//           // ..text = loginPassword == null ? "" : loginPassword.toString(),
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return "Password required";
//             } else {}
//           },
//           obscureText: visible,
//           autocorrect: true,
//           decoration: InputDecoration(
//             labelText: 'password',
//             suffixIcon: IconButton(
//                 onPressed: () {
//                   print("hy");
//                   setState(() {
//                     visible = !visible;
//                   });
//                 },
//                 icon: visible
//                     ? Icon(Icons.visibility)
//                     : Icon(Icons.visibility_off)),
//             suffixIconColor: Colors.grey,
//             labelStyle: TextStyle(color: Colors.grey),
//             filled: false,
//             // fillColor: Colors.white70,
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(12.0)),
//               borderSide: BorderSide(color: Colors.grey, width: 2),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(10.0)),
//               borderSide: BorderSide(color: Colors.orange, width: 2),
//             ),
//           ),
//         ));
//   }
// }
