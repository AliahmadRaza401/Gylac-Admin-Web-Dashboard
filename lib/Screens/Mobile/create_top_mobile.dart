// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_print, avoid_web_libraries_in_flutter, deprecated_member_use, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gylac_dashboard/Screens/Mobile/top_card_mobile.dart';
import 'package:gylac_dashboard/Screens/card_top_rated.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:mailer/mailer.dart';
import 'dart:html' as html;

import 'package:mailer/smtp_server.dart';

class AddTopRatedMobile extends StatefulWidget {
  const AddTopRatedMobile({Key? key}) : super(key: key);

  @override
  State<AddTopRatedMobile> createState() => _AddTopRatedMobileState();
}

html.File? myImag;

class _AddTopRatedMobileState extends State<AddTopRatedMobile> {
  getImage() async {
    final imageFile = await ImagePickerWeb.getImage(outputType: ImageType.file);
    print(imageFile!);
  }

  FirebaseFirestore db = FirebaseFirestore.instance;
  bool isloading = false;
  addToTopRated(
    String orderName,
    String parcel,
    String driverName,
    String rating,
    String price,
    String vehicleType,
    String imageUrl,
  ) async {
    try {
      setState(() {
        isloading = true;
      });
      db.collection("topRateds").doc().set({
        'orderName': orderName,
        'parcel': parcel,
        'driverName': driverName,
        'rating': rating,
        'price': price,
        'vehicleType': vehicleType.toUpperCase(),
        'imageUrl': imageUrl,
      }).then((value) {
        print('Data post');
        setState(() {
          isloading = false;
        });
      });
    } catch (e) {
      print(e.toString());
    }
    // }).onDone(() {print('done  '); });
    // .onError((e){
    //   print(e.toString());
  }

  sendMail() async {
    String username = 'mailto:b-23659@student.usa.edu.pk';
    String password = 'ali8948401';

    final smtpServer = gmail(username, password);
    // Use the SmtpServer class to configure an SMTP server:
    // final smtpServer = SmtpServer('smtp.domain.com');
    // See the named arguments of SmtpServer for further configuration
    // options.

    // Create our message.
    final message = Message()
      ..from = Address(username, 'My email')
      ..recipients.add('b-23658@student.usa.edu.pk')
      ..ccRecipients.addAll(['b-23658@student.usa.edu.pk', 'b-23658@student.usa.edu.pk'])
      ..bccRecipients.add(Address('b-23658@student.usa.edu.pk'))
      ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ');
      print(sendReport);
    } on MailerException catch (e) {
      print('Message not sent.');
      // for (var p in e.problems) {
      //   print('Problem: ${p.code}: ${p.msg}');
      // }
    }
  }

  TextEditingController orderNameController = TextEditingController();
  TextEditingController parcelController = TextEditingController();
  TextEditingController driverNameController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  TextEditingController vehicleTypeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imageLinkController = TextEditingController();
  String orderName = '';
  String parcel = '';
  String drvierName = '';
  String rating = '';
  String vehicleType = '';
  String price = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/DashboardIcons/Admin Panel 2@3x.png'),
                fit: BoxFit.fitHeight)),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Row(
            //   children: [
            //     Icon(Icons.arrow_back),
            //   ],
            // ),
            TopRatedCardMobile(
                orderName: orderName,
                details: parcel,
                driverImg: 'abc.com',
                driverName: drvierName,
                price: price,
                rating: rating == '' ? 0 : double.parse(rating),
                vehicletype: vehicleType.toUpperCase(),
                verhicleImg: ''),
            infoContainer()
          ],
        ),
      ),
    );
  }

  Widget infoContainer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * .4,
        height: MediaQuery.of(context).size.height,
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.circular(10),
        //   boxShadow: [
        //     BoxShadow(
        //       color: Colors.grey.shade300,
        //       spreadRadius: 2,
        //       blurRadius: 2,
        //       offset: Offset(0, 2),
        //     ),
        //   ],
        // ),
        child: Container(
          width: MediaQuery.of(context).size.width * .15,
          height: MediaQuery.of(context).size.height * .8,
          // color: Colors.amber,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Enter information",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * .03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  usernameFieldMobile(orderNameController, 'Order', (value) {
                    setState(() {
                      orderName = value;
                    });
                  }),
                  usernameFieldMobile(parcelController, 'Parcel', (value) {
                    setState(() {
                      parcel = value;
                    });
                  }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  usernameFieldMobile(driverNameController, 'Driver name', (value) {
                    setState(() {
                      drvierName = value;
                    });
                  }),
                  usernameFieldMobile(ratingController, 'Rating', (value) {
                    setState(() {
                      rating = value;
                    });
                  }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  usernameFieldMobile(priceController, 'Price', (value) {
                    setState(() {
                      price = value;
                    });
                  }),
                  usernameFieldMobile(vehicleTypeController, 'Vehicle type',
                      (value) {
                    setState(() {
                      vehicleType = value;
                    });
                  }),
                ],
              ),

              Row(
                

                children: [
                  SizedBox(width: MediaQuery.of(context).size.width *.06,),
                  usernameFieldMobile(
                      imageLinkController, 'Image link', (value) {}),
                ],
              ),
              // IconButton(onPressed: (){
              //   getImage();
              // }, icon: Icon(Icons.image_rounded)),
              SizedBox(
                width: MediaQuery.of(context).size.width * .28,
                height: MediaQuery.of(context).size.height * .05,
                child: isloading == true
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          addToTopRated(
                              orderName,
                              parcel,
                              drvierName,
                              rating,
                              price,
                              vehicleType,
                              imageLinkController.text);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xffFF8A00),
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget usernameFieldMobile(controller, placeHolder, function) {
    return Container(
        height: MediaQuery.of(context).size.height * .08,
        width: MediaQuery.of(context).size.width * .4,
        padding: EdgeInsets.all(10.0),
        child: TextFormField(
          controller: controller,
          onChanged: function,
          // initialValue: "sdf",
          // ..text = loginUser == null ? '' : loginUser.toString(),
          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return "Username or Email is required";
          //   } else {}
          // },
          autocorrect: true,
          decoration: InputDecoration(
            labelText: placeHolder,
            // suffixIcon: Icon(Icons.person),
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
}
