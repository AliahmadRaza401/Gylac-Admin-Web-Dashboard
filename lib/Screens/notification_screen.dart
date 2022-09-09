// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unnecessary_new, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_local_variable, unnecessary_string_interpolations, avoid_print, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gylac_dashboard/Screens/order_details.dart';
import 'package:gylac_dashboard/Utils/widget.dart';

class NotificatonScreen extends StatefulWidget {
  const NotificatonScreen({Key? key}) : super(key: key);

  @override
  State<NotificatonScreen> createState() => _NotificatonScreenState();
}

class _NotificatonScreenState extends State<NotificatonScreen> {
  final ordersStream = FirebaseFirestore.instance.collection('orders');
  FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> stream() async* {
    var _stream = FirebaseFirestore.instance.collection('orders').snapshots();
    yield* _stream;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 30),
            child: Row(
              children: [
                Text(
                  'Notifications'.tr,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .035,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          headingRow('orderId'.tr, 'date'.tr, 'cusTName'.tr, 'location'.tr,
              'amount'.tr, 'orderstatus'.tr),
          Expanded(
            // padding: EdgeInsets.all(20),
            child: StreamBuilder<QuerySnapshot>(
              stream: stream(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('somethingWentWrong'.tr));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                return snapshot.data!.docs.isEmpty
                    ? Container(
                        height: MediaQuery.of(context).size.height,
                        // color: Colors.amber,
                        padding: EdgeInsets.symmetric(vertical: 100),
                        child: Center(
                          child: Text('nothingToshow'.tr),
                        ))
                    : ListView(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          return GestureDetector(
                              child: ordersRow(
                            document['orderId'],
                            document['orderDate'],
                            document['userName'],
                            document['pickupAddress'],
                            document['pickupDeliveryPrice'],
                            document['orderId'],
                            document['orderStatus'],
                          ));
                        }).toList(),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }

  int activeStep = 1;

  bool showDetailscard = true;

  // showDetails(String name) {
  //   return Visibility(
  //       visible: showDetailscard,
  //       child: Container(
  //         child: Text(name),
  //       ));
  // }

  Widget ordersRow(
    String orderId,
    String date,
    String customerName,
    String location,
    String amount,
    String docId,
    String pending,
  ) {
    return Stack(
      children: [
        Container(
          color: Colors.transparent,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      alignment: Alignment.bottomLeft,
                      width: MediaQuery.of(context).size.width * .08,
                      child: mytext(context, orderId)),
                  Container(
                      alignment: Alignment.bottomLeft,
                      // color: Colors.red,
                      width: MediaQuery.of(context).size.width * .15,
                      child: mytext(context, date)),
                  Container(
                      alignment: Alignment.bottomLeft,
                      // color: Colors.amber,
                      width: MediaQuery.of(context).size.width * .12,
                      child: mytext(context, customerName)),
                  Container(
                      // color: Colors.pink,
                      alignment: Alignment.bottomLeft,
                      width: MediaQuery.of(context).size.width * .15,
                      child: mytext(context, location)),
                  Container(
                      // color: Colors.yellow,
                      alignment: Alignment.bottomLeft,
                      width: MediaQuery.of(context).size.width * .1,
                      child: mytext(context, amount)),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: MediaQuery.of(context).size.height * .05,
                      width: MediaQuery.of(context).size.width * .1,
                      decoration: BoxDecoration(
                          // color: Color(0xffE3F8E5),

                          color: pending == 'Accepted'
                                ? Color(0xff56C662).withOpacity(.3)
                                : pending == 'Pending'
                                    ? Color.fromARGB(255, 250, 209, 6)
                                        .withOpacity(.3)
                                    : pending == 'completed'
                                        ? Color(0xff56C662).withOpacity(0.3)
                                        : Color.fromARGB(255, 250, 6, 6)
                                            .withOpacity(.3),
                          border: Border.all(
                              color: pending == 'Accepted'
                                  ? Color(0xff56C662)
                                  : pending == 'Pending'
                                      ? Color.fromARGB(255, 250, 209, 6)
                                    
                                      : pending == 'completed'
                                          ? Color(0xff56C662)
                                          : Color.fromARGB(255, 250, 6, 6)
                                            ),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                          child: Text(
                        pending,
                        style: TextStyle(
                            color: pending == 'Accepted'
                                ? Color(0xff56C662)
                                : pending == 'Pending'
                                    ? Color.fromARGB(255, 250, 209, 6)
                                   
                                    : pending == 'completed'
                                        ? Color(0xff56C662)
                                        : Color.fromARGB(255, 250, 6, 6)
                                       ),
                      ))),
                ],
              ),
              Divider()
            ],
          ),
        ),
      ],
    );
  }

  Widget headingRow(String orderId, String date, String customerName,
      String location, String amount, String pending) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              mytext(context, ''),
              // myheading(context, '$number'),
              // Image.asset(sortIcon),
              Container(
                  // color: Colors.blue,
                  alignment: Alignment.bottomLeft,
                  width: MediaQuery.of(context).size.width * .08,
                  child: myheading(context, orderId)),
              Container(
                  alignment: Alignment.bottomLeft,
                  // color: Colors.red,
                  width: MediaQuery.of(context).size.width * .15,
                  child: myheading(context, date)),
              Container(
                  alignment: Alignment.bottomLeft,
                  // color: Colors.amber,
                  width: MediaQuery.of(context).size.width * .12,
                  child: myheading(context, customerName)),
              Container(
                  // color: Colors.pink,
                  alignment: Alignment.bottomLeft,
                  width: MediaQuery.of(context).size.width * .15,
                  child: myheading(context, location)),
              Container(
                  // color: Colors.yellow,
                  alignment: Alignment.bottomLeft,
                  width: MediaQuery.of(context).size.width * .1,
                  child: myheading(context, amount)),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  // height: MediaQuery.of(context).size.height * .05,
                  width: MediaQuery.of(context).size.width * .1,
                  child: Center(
                      child: myheading(
                    context,
                    pending,
                    // style: TextStyle(color: Colors.black),
                  ))),
              Container(
                width: MediaQuery.of(context).size.width * .02,
                // color: Colors.amber,
              )
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
