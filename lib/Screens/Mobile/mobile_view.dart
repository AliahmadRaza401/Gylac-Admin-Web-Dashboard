// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gylac_dashboard/Screens/Mobile/mobile_home.dart';
import 'package:gylac_dashboard/Utils/color.dart';
import '../../Utils/widget.dart';

// Widget sideBar(BuildContext context) {
//     return
//   }
int index = 0;

class MobileDashBoard extends StatefulWidget {
  const MobileDashBoard({Key? key}) : super(key: key);

  @override
  State<MobileDashBoard> createState() => _MobileDashBoardState();
}

class _MobileDashBoardState extends State<MobileDashBoard> {
  int totalCustomers = 0;
  int pendingOrders = 0;
  int deliverdOrders = 0;
  int activedOrders = 0;
  int canceledOrders = 0;
  int totalDrivers = 0;
  int activeDrivers = 0;
  int pendingDrivers = 0;
  int rejectedDrivers = 0;
  @override
  void initState() {
    super.initState();
    getCount();
  }

  Future getCount() async {
    FirebaseFirestore.instance
        .collection('orders') //your collectionref
        .where('orderStatus', isEqualTo: 'pending')
        .get()
        .then((value) {
      var count = 0;
      count = value.docs.length;
      setState(() {
        pendingOrders = count;
      });
    });
    FirebaseFirestore.instance
        .collection('orders') //your collectionref
        .where('orderStatus', isEqualTo: 'completed')
        .get()
        .then((value) {
      var count = 0;
      count = value.docs.length;
      setState(() {
        deliverdOrders = count;
      });
    });
    FirebaseFirestore.instance
        .collection('orders') //your collectionref
        .where('orderStatus', isEqualTo: 'canceled')
        .get()
        .then((value) {
      var count = 0;
      count = value.docs.length;
      setState(() {
        canceledOrders = count;
      });
    });
    FirebaseFirestore.instance
        .collection('orders') //your collectionref
        .where('orderStatus', isEqualTo: 'active')
        .get()
        .then((value) {
      var count = 0;
      count = value.docs.length;
      setState(() {
        activedOrders = count;
      });
    });

    FirebaseFirestore.instance
        .collection('drivers') //your collectionref
        // .where('status', isEqualTo: 'active')
        .get()
        .then((value) {
      var count = 0;
      count = value.docs.length;
      setState(() {
        totalDrivers = count;
      });
    });
    FirebaseFirestore.instance
        .collection('drivers') //your collectionref
        .where('status', isEqualTo: 'pending')
        .get()
        .then((value) {
      var count = 0;
      count = value.docs.length;
      setState(() {
        pendingDrivers = count;
      });
    });

    FirebaseFirestore.instance
        .collection('drivers') //your collectionref
        .where('status', isEqualTo: 'rejected')
        .get()
        .then((value) {
      var count = 0;
      count = value.docs.length;
      setState(() {
        rejectedDrivers = count;
      });
    });

    FirebaseFirestore.instance
        .collection('drivers') //your collectionref
        .where('status', isEqualTo: 'active')
        .get()
        .then((value) {
      var count = 0;
      count = value.docs.length;
      setState(() {
        activeDrivers = count;
      });
    });

    FirebaseFirestore.instance
        .collection('users') //your collectionref
        // .where('deleted', isEqualTo: false)
        .get()
        .then((value) {
      var count = 0;
      count = value.docs.length;
      setState(() {
        totalCustomers = count;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dashboard',
                    style: TextStyle(
                        // color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * .03),
                  ),
                  iconContainerFormobile(
                      context,
                      Text(
                        "Refresh",
                        style: TextStyle(
                            color: purpleColor,
                            fontSize: MediaQuery.of(context).size.width / 50),
                      ),
                      lightPurpulcolor,
                      .12,
                      22),
                ],
              ),
            ),
            // SizedBox(
            //   height: MediaQuery.of(context)
            //           .size
            //           .height *
            //       .01,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome to Gyalc Admin',
                    style: TextStyle(
                        color: Color(0xff7E7E7E),
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * .02),
                  ),
                  iconContainerFormobile(
                      context,
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width / 30,
                      ),
                      bluecolor,
                      .05,
                      22),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DashboardStatCardForMobile(
                    bgcolor: skyblue,
                    title: 'Total Revenue',
                    value: '\$ 0',
                    image: 'asset/DashboardIcons/revenue.png'),
                DashboardStatCardForMobile(
                    bgcolor: greencolor,
                    title: 'Delivered Ordes',
                    value: '$deliverdOrders',
                    image: 'asset/DashboardIcons/deliverd.png'),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DashboardStatCardForMobile(
                    bgcolor: deeporangecolor,
                    title: 'Pending Orders',
                    value: '$pendingOrders',
                    image: 'asset/DashboardIcons/pendin.png'),
                DashboardStatCardForMobile(
                    bgcolor: themeColor,
                    title: 'Customers',
                    value: '$totalCustomers',
                    image: 'asset/DashboardIcons/customers.png'),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DashboardDetailsCardForMobile(
                    bgcolor: white,
                    title: 'Orders Details',
                    text1: 'Active Orders',
                    value1: '$activedOrders',
                    text2: 'Pending Orders',
                    value2: '$pendingOrders',
                    text3: 'Delivered Orders',
                    value3: '$deliverdOrders',
                    text4: 'Cancelled Orders',
                    value4: '$canceledOrders',
                    progess1: 20,
                    totalprogress1: 100,
                    progess2: 50,
                    totalprogress2: 100,
                    progess3: 10,
                    totalprogress3: 100,
                    progess4: 50,
                    totalprogress4: 100),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DashboardDetailsCardForMobile(
                    bgcolor: white,
                    title: 'Customers Details',
                    text1: 'Total Customers',
                    value1: '$totalCustomers',
                    text2: 'Active Customers',
                    value2: '$activedOrders',
                    text3: 'Delivered Customers',
                    value3: '$deliverdOrders',
                    text4: 'New Customers',
                    value4: '$pendingOrders',
                    progess1: 20,
                    totalprogress1: 100,
                    progess2: 50,
                    totalprogress2: 100,
                    progess3: 10,
                    totalprogress3: 100,
                    progess4: 50,
                    totalprogress4: 100),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PayrollCardForMobile(
                  bgcolor: white,
                  title: 'PayRoll',
                  filter: 'Filter by da',
                  text1: 'Total Payroll',
                  value1: '0 MNT',
                  progess1: 0,
                  totalprogress1: 100,
                  totalDrivers: '0',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DashboardDetailsCardForMobile(
                    bgcolor: white,
                    title: 'Drivers Details',
                    text1: 'Total Drivers',
                    value1: '$totalDrivers',
                    text2: 'Active Drivers',
                    value2: '$activeDrivers',
                    text3: 'Pending Drivers',
                    value3: '$pendingDrivers',
                    text4: 'Deactive Drivers',
                    value4: '$rejectedDrivers',
                    progess1: 20,
                    totalprogress1: 100,
                    progess2: 50,
                    totalprogress2: 100,
                    progess3: 10,
                    totalprogress3: 100,
                    progess4: 50,
                    totalprogress4: 100),
              ],
            ),
            // Expanded(
            //   child: Container(
            //     // width: double.infinity,
            //     height: MediaQuery.of(context).size.height * .1,
            //     decoration: BoxDecoration(
            //         color: themeColor, borderRadius: BorderRadius.circular(10)),
            //     child: Row(
            //       children: [
            //         // Spacer(
            //         //   flex: 1,
            //         // ),
            //         Padding(
            //           padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 15),
            //           child: inputField(context, "", null, null, null),
            //         ),
            //         // Spacer(),
            //         iconContainerFormobile(
            //             context,
            //             Text(
            //               'Filter by Date',
            //               style: TextStyle(color: themeColor, fontSize: 9),
            //             ),
            //             white,
            //             .15,
            //             20),
            //         // Spacer(flex: 9),
            //         Expanded(
            //           // width: MediaQuery.of(context).size.width * .3,
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [
            //               iconContainerFormobile(
            //                   context,
            //                   Text(
            //                     'Copy',
            //                     style: TextStyle(
            //                         color: themeColor,
            //                         fontSize:
            //                             MediaQuery.of(context).size.width *
            //                                 .02),
            //                   ),
            //                   white,
            //                   .06,
            //                   20),
            //               iconContainerFormobile(
            //                   context,
            //                   Text(
            //                     'CSV',
            //                     style: TextStyle(
            //                         color: themeColor,
            //                         fontSize:
            //                             MediaQuery.of(context).size.width *
            //                                 .02),
            //                   ),
            //                   white,
            //                   .06,
            //                   20),
            //               iconContainerFormobile(
            //                   context,
            //                   Text(
            //                     'Excel',
            //                     style: TextStyle(
            //                         color: themeColor,
            //                         fontSize:
            //                             MediaQuery.of(context).size.width *
            //                                 .02),
            //                   ),
            //                   white,
            //                   .06,
            //                   20),
            //               iconContainerFormobile(
            //                   context,
            //                   Text(
            //                     'PDF',
            //                     style: TextStyle(
            //                         color: themeColor,
            //                         fontSize:
            //                             MediaQuery.of(context).size.width *
            //                                 .02),
            //                   ),
            //                   white,
            //                   .06,
            //                   20),
            //             ],
            //           ),
            //         ),
            //         // Spacer(),
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class DashboardStatCardForMobile extends StatelessWidget {
  Color bgcolor;
  String title;
  String value;
  String image;
  DashboardStatCardForMobile(
      {required this.bgcolor,
      required this.title,
      required this.value,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * .13,
        width: MediaQuery.of(context).size.width / 2.7,
        decoration: BoxDecoration(
            color: bgcolor,
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.width / 50),
            boxShadow: [
              BoxShadow(color: Color(0xffFF507A), offset: Offset(0, 3))
            ]),
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .2,
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                Text(
                  value,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * .02),
                ),
              ],
            ),

            Expanded(child: Image.asset(image))
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       height: MediaQuery.of(context).size.height * .1,
            //       width: MediaQuery.of(context).size.width * .05,
            //       decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           image: DecorationImage(
            //               image: AssetImage(image), fit: BoxFit.cover)
            //               ),
            //     )
            //     //   CircleAvatar(
            //     //   backgroundColor: Colors.transparent,
            //     //   radius: MediaQuery.of(context).size.width *.026,
            //     //   backgroundImage:AssetImage(image),
            //     //   // child: Image.asset(image),
            //     // )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

Widget mobileinputField(
    BuildContext context, String placeholder, controller, keyboard, icon) {
  return Container(
    width: MediaQuery.of(context).size.width * .2,
    height: MediaQuery.of(context).size.height * .03,
    decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(.3),
              offset: Offset(0, 3),
              spreadRadius: 2,
              blurRadius: 5)
        ]),
    child: TextField(
      keyboardType: keyboard,
      controller: controller,
      style: TextStyle(fontSize: MediaQuery.of(context).size.width / 50),
      decoration: InputDecoration(
        // suffixIcon: icon,
        // hintText: placeholder,

        border: OutlineInputBorder(
          // borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        // isDense: true,
        // contentPadding: EdgeInsets.only(top: 5,left: 4)
      ),
    ),
  );
}

Widget mobileiconContainerFormobile(
    BuildContext context, icon, bgcolor, width, height) {
  return Container(
      width: MediaQuery.of(context).size.width * width,
      height: MediaQuery.of(context).size.height * height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: bgcolor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.3),
                offset: Offset(1, 1),
                spreadRadius: 1,
                blurRadius: 1)
          ]),
      child: Center(
        child: icon,
      ));
}

class DashboardDetailsCardForMobile extends StatelessWidget {
  Color bgcolor;
  String title;
  String text1;
  String value1;
  String text2;
  String value2;
  String text3;
  String value3;
  String text4;
  String value4;
  double progess1;
  double totalprogress1;
  double progess2;
  double totalprogress2;
  double progess3;
  double totalprogress3;
  double progess4;
  double totalprogress4;

  DashboardDetailsCardForMobile(
      {required this.bgcolor,
      required this.title,
      required this.text1,
      required this.value1,
      required this.text2,
      required this.value2,
      required this.text3,
      required this.value3,
      required this.text4,
      required this.value4,
      required this.progess1,
      required this.totalprogress1,
      required this.progess2,
      required this.totalprogress2,
      required this.progess3,
      required this.totalprogress3,
      required this.progess4,
      required this.totalprogress4});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * .27,
        width: MediaQuery.of(context).size.width * .8,
        decoration: BoxDecoration(
            color: white,
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.width / 50),
            boxShadow: [
              BoxShadow(
                  color: Color(0xffA6442F),
                  offset: Offset(1, 0),
                  spreadRadius: .02,
                  blurRadius: 2)
            ]),
        child: Column(
          children: [
            Row(
              children: [
                iconContainer(
                    context,
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * .015),
                    ),
                    themeColor,
                    .2,
                    .05),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              offset: Offset(1, 1),
                              spreadRadius: .02,
                              blurRadius: 2)
                        ]),
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              text1,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * .009),
                            ),
                            Text(
                              value1,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .02),
                            ),
                          ],
                        ),
                        LinearProgressIndicator(
                          value: progess1 / totalprogress1,
                          color: bluecolor,
                          backgroundColor: drawerIconColor,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              text2,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * .009),
                            ),
                            Text(
                              value2,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .02),
                            ),
                          ],
                        ),
                        LinearProgressIndicator(
                          value: progess2 / totalprogress2,
                          color: bluecolor,
                          backgroundColor: drawerIconColor,
                        ),
                      ],
                    )),
                Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              offset: Offset(1, 1),
                              spreadRadius: .02,
                              blurRadius: 2)
                        ]),
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              text3,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * .009),
                            ),
                            Text(
                              value3,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .02),
                            ),
                          ],
                        ),
                        LinearProgressIndicator(
                          value: progess3 / totalprogress3,
                          color: bluecolor,
                          backgroundColor: drawerIconColor,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              text4,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * .009),
                            ),
                            Text(
                              value4,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .02),
                            ),
                          ],
                        ),
                        LinearProgressIndicator(
                          value: progess4 / totalprogress4,
                          color: bluecolor,
                          backgroundColor: drawerIconColor,
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PayrollCardForMobile extends StatelessWidget {
  Color bgcolor;
  String title;
  String text1;
  String value1;
  String filter;
  double progess1;
  double totalprogress1;
  String totalDrivers;

  PayrollCardForMobile(
      {required this.bgcolor,
      required this.title,
      required this.filter,
      required this.text1,
      required this.value1,
      required this.progess1,
      required this.totalprogress1,
      required this.totalDrivers});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * .27,
        width: MediaQuery.of(context).size.width * .8,
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Color(0xffA6442F),
                  offset: Offset(1, 0),
                  spreadRadius: .02,
                  blurRadius: 2)
            ]),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                iconContainer(
                    context,
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * .015),
                    ),
                    themeColor,
                    .18,
                    .04),
                iconContainer(
                    context,
                    Text(
                      filter,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * .015),
                    ),
                    themeColor,
                    .12,
                    .04),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .04),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Spacer(),
                Container(
                    height: MediaQuery.of(context).size.height / 9,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              offset: Offset(1, 1),
                              spreadRadius: .02,
                              blurRadius: 2)
                        ]),
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              text1,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * .009),
                            ),
                            Text(
                              value1,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .015),
                            ),
                          ],
                        ),
                        LinearProgressIndicator(
                          value: progess1 / totalprogress1,
                          color: bluecolor,
                          backgroundColor: drawerIconColor,
                        ),
                      ],
                    )),
                Spacer(
                  flex: 4,
                ),
                iconContainerFormobile(
                    context,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Divers ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          totalDrivers,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    bgcolor,
                    .3,
                    10),
                Spacer(),
              ],
            ),
            // Spacer(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     iconContainerFormobile(
            //         context,
            //         Text(
            //           'Copy',
            //           style: TextStyle(
            //               color: white,
            //               fontSize: MediaQuery.of(context).size.width / 50),
            //         ),
            //         themeColor,
            //         .1,
            //         20),
            //     iconContainerFormobile(
            //         context,
            //         Text(
            //           'CSV',
            //           style: TextStyle(
            //               color: white,
            //               fontSize: MediaQuery.of(context).size.width / 50),
            //         ),
            //         themeColor,
            //         .1,
            //         20),
            //     iconContainerFormobile(
            //         context,
            //         Text(
            //           'Excel',
            //           style: TextStyle(
            //               color: white,
            //               fontSize: MediaQuery.of(context).size.width / 50),
            //         ),
            //         themeColor,
            //         .1,
            //         20),
            //     iconContainerFormobile(
            //         context,
            //         Text(
            //           'PDF',
            //           style: TextStyle(
            //               color: white,
            //               fontSize: MediaQuery.of(context).size.width / 50),
            //         ),
            //         themeColor,
            //         .1,
            //         20),
            //   ],
            // ),
            // Spacer(),
          ],
        ),
      ),
    );
  }
}
