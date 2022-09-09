// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, deprecated_member_use, must_be_immutable, use_key_in_widget_constructors

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:gylac_dashboard/Utils/color.dart';
import 'package:gylac_dashboard/Utils/image.dart';
import 'package:gylac_dashboard/Utils/widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OrderDetails extends StatefulWidget {
  String trackStatus;
  String orderId;
  String lat;
  String lang;
  String deliveryGuy;
  String guyId;
  String estimatedTime;
  String customerName;
  String custimerMobile;
  String customerAddress;
  String noteOrder;
  String parcelName;
  String parcelPricce;

  OrderDetails(
      this.trackStatus,
      this.custimerMobile,
      this.customerAddress,
      this.customerName,
      this.deliveryGuy,
      this.estimatedTime,
      this.guyId,
      this.lang,
      this.lat,
      this.noteOrder,
      this.orderId,
      this.parcelName,
      this.parcelPricce);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  Color orangeColros = Color(0xffFD683E);
  Color purpleColros = Color(0xff624FD1);
  final List<ChartData> chartData = [
    ChartData(x: 'Steve', y: 38, color: Colors.transparent),
    ChartData(x: 'Jack', y: 34, color: Colors.transparent),
    ChartData(x: 'Others', y: 52, color: Colors.transparent)
  ];

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  void dispose() {
    super.dispose();
    _timer!.cancel();
  }

  Timer? _timer;

  startTime() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      getUpdate();
    });
  }

  bool step4 = false;
  bool step5 = false;
  var trackStatus;
  var driverId;

  getUpdate() async {
    FirebaseFirestore.instance
        .collection("orders")
        .doc(widget.orderId)
        .get()
        .then((value) {
      if (mounted) {
        setState(() {
          trackStatus = value.data()!["trackStatus"].toString();
          print('trackStatus: $trackStatus');
          driverId = value.data()!["driverId"].toString();
        });
      }
    });
    if (trackStatus == "WaitForPickup") {
      if (mounted) {
        setState(() {
          step4 = false;
          step5 = false;
        });
      }
    } else if (trackStatus == "Picked") {
      if (mounted) {
        setState(() {
          step4 = true;
        });
      }
    } else if (trackStatus == "Delivered") {
      if (mounted) {
        setState(() {
          step5 = true;
          _timer!.cancel();
        });
      }
      // Fluttertoast.showToast(
      //     msg: "Order Delivered Successfully",
      //     textColor: Colors.white,
      //     backgroundColor: Colors.green);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // width: MediaQuery.of(context).size.width * .8,
      height: MediaQuery.of(context).size.height * 1,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .15,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border:
                      Border(bottom: BorderSide(color: Colors.grey.shade300))),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.grey,
                          size: MediaQuery.of(context).size.height * .05,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: inputFieldCircular(
                        context, 'Search here', null, null, Icon(Icons.search),(value){}),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                  iconContainerWithtext(context, Text(''),'recipGuide'.tr ,
                      Colors.deepOrange, Colors.white, .08, .06),
                  Spacer(
                    flex: 1,
                  ),
                  Icon(Icons.notifications_outlined, color: Colors.grey),
                  Spacer(
                    flex: 1,
                  ),
                  Icon(
                    Icons.chat,
                    color: Colors.grey,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  VerticalDivider(
                    indent: MediaQuery.of(context).size.height * .03,
                    endIndent: MediaQuery.of(context).size.height * .03,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  CircleAvatar(
                    backgroundColor: orangeColros,
                    radius: MediaQuery.of(context).size.height * .03,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: MediaQuery.of(context).size.height * .027,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  iconContainerWithdoubleIcon(
                      context,
                      Image.asset('asset/DashboardIcons/united-states 1.png',width: MediaQuery.of(context).size.width *.015),
                      'english'.tr,
                      Colors.deepOrange.shade50,
                      Colors.black,
                      
                      .08,
                      .06,
                      Icon(Icons.keyboard_arrow_down_rounded,
                          color: Colors.deepOrange)),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 40),
              child: Row(
                children: [
                  Text(
                    '${'orderId'.tr} #' + widget.orderId,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * .02,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, right: 20, left: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .2,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade200,
                          offset: Offset(2, 2),
                          spreadRadius: 1,
                          blurRadius: 3)
                    ]),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: stepper(),
              ),
            ),
            Container(
              color: Colors.amber,
              height: MediaQuery.of(context).size.height *1.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.all(10),
                      //   child: Expanded(
                      //     // flex: 2,
                      //     child: Container(
                      //       // width: MediaQuery.of(context).size.width * .65,
                      //       height: MediaQuery.of(context).size.height * .4,
                      //       decoration: BoxDecoration(
                      //           color: Colors.white,
                      //           borderRadius: BorderRadius.circular(10),
                      //           boxShadow: [
                      //             BoxShadow(
                      //                 color: Colors.grey.shade200,
                      //                 offset: Offset(2, 2),
                      //                 spreadRadius: 1,
                      //                 blurRadius: 3)
                      //           ]),
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           Padding(
                      //             padding: const EdgeInsets.symmetric(
                      //                 vertical: 8.0, horizontal: 25),
                      //             child: Container(
                      //                 // width:
                      //                 //     MediaQuery.of(context).size.width ,
                      //                 height:
                      //                     MediaQuery.of(context).size.height *
                      //                         .32,
                      //                 decoration: BoxDecoration(
                      //                     color: Colors.grey,
                      //                     borderRadius:
                      //                         BorderRadius.circular(10),
                      //                     boxShadow: [
                      //                       BoxShadow(
                      //                           color: Colors.grey.shade200,
                      //                           offset: Offset(2, 2),
                      //                           spreadRadius: 1,
                      //                           blurRadius: 3)
                      //                     ]),
                      //                 child: ClipRRect(
                      //                     borderRadius:
                      //                         BorderRadius.circular(10),
                      //                     child: MarkersPage(
                      //                       lat: double.parse(widget.lat),
                      //                       lang: double.parse(widget.lang),
                      //                     ))),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .15,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade200,
                                            offset: Offset(2, 2),
                                            spreadRadius: 1,
                                            blurRadius: 3)
                                      ]),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .05,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .1,
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.shade200,
                                                    // offset: Offset(2, 2),
                                                    // spreadRadius: 1,
                                                    // blurRadius: 3
                                                  )
                                                ]),
                                          )),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                          'delgy'.tr ,
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .018,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            widget.deliveryGuy,
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .025,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Text(
                                           'id'.tr + widget.orderId,
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .025,
                                                color: orangeColros),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .03,
                                                child: Icon(
                                                  Icons.chat,
                                                  size: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .015,
                                                ),
                                                backgroundColor: orangeColros,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              CircleAvatar(
                                                radius: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .03,
                                                child: Icon(
                                                  Icons.call,
                                                  size: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .015,
                                                ),
                                                backgroundColor: orangeColros,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .15,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade200,
                                            offset: Offset(2, 2),
                                            spreadRadius: 1,
                                            blurRadius: 3)
                                      ]),
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Image.asset(airplanIcon),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .015,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                           'estTime'.tr ,
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .018,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            widget.estimatedTime,
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .025,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            // padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                            // width: MediaQuery.of(context).size.width * .68,
                            height: MediaQuery.of(context).size.height * .65,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      offset: Offset(2, 2),
                                      spreadRadius: 1,
                                      blurRadius: 3)
                                ]),
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: Column(
                              children: [
                                headingsRow(),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .01,
                                ),
                                itemsRow(
                                   'mainCourse'.tr ,
                                    widget.parcelName,
                                    4.5,
                                    223,
                                    '1',
                                    widget.parcelPricce,
                                    widget.parcelPricce),
                                itemsRow(
                                    'mainCourse'.tr,
                                    widget.parcelName,
                                    4.5,
                                    223,
                                    '1',
                                    widget.parcelPricce,
                                    widget.parcelPricce),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * .1,
                      // )
                    ],
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [infoContainer(), percentageContainer()],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget stepper() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.green),
                      margin: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .15,
                      height: 5,
                      decoration: const BoxDecoration(color: Colors.green),
                    ),
                  ],
                ),
                Text(
                 'waitToAccept'.tr ,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .018,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.green),
                      margin: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .15,
                      height: 5,
                      decoration: const BoxDecoration(color: Colors.green),
                    ),
                  ],
                ),
                Text(
                 'drAccept'.tr,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .018,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: step4 == false
                              ? Colors.green.withOpacity(0.45)
                              : Colors.green,
                          border: step4 == false
                              ? Border.all(color: Colors.green, width: 2)
                              : null),
                      margin: const EdgeInsets.all(5),
                      child: const Icon(Icons.check, color: Colors.white),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .15,
                      height: 5,
                      decoration: BoxDecoration(
                          color: step4 == false ? Colors.grey : Colors.green),
                    ),
                  ],
                ),
                Text(
                'waitTopic'.tr ,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .018,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: step4 == false ? Colors.grey : Colors.green),
                      margin: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .15,
                      height: 5,
                      decoration: BoxDecoration(
                          color: step4 == false ? Colors.grey : Colors.green),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                    'parcelPicked'.tr,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .018,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: step4 == false ? Colors.grey : Colors.black),
                    ),
                  ],
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: step5 == false ? Colors.grey : Colors.green),
                      margin: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                     'deliverLoc'.tr ,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .018,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: step5 == false ? Colors.grey : Colors.black),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget infoContainer() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        // width: MediaQuery.of(context).size.width * .2,
        height: MediaQuery.of(context).size.height * .6,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 2),
                  spreadRadius: 1,
                  blurRadius: 3)
            ]),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .05,
                  height: MediaQuery.of(context).size.height * .1,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          // offset: Offset(2, 2),
                          // spreadRadius: 1,
                          // blurRadius: 3
                        )
                      ]),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.customerName,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .025,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                    width: MediaQuery.of(context).size.width * .08,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Customer'),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          primary: orangeColros),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: MediaQuery.of(context).size.height * .03,
                  child: Icon(
                    Icons.call,
                    size: MediaQuery.of(context).size.width * .015,
                  ),
                  backgroundColor: purpleColros,
                ),
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width * .1,
                  child: Text(
                    widget.custimerMobile,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .022,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: MediaQuery.of(context).size.height * .03,
                  child: Icon(
                    Icons.location_on,
                    size: MediaQuery.of(context).size.width * .015,
                  ),
                  backgroundColor: purpleColros,
                ),
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width * .1,
                  child: Text(
                    widget.customerAddress,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .022,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            Divider(),
            Text(
              'Note Order',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .022,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width * .18,
              child: Text(
                widget.noteOrder,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .018,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget percentageContainer() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        // width: MediaQuery.of(context).size.width * .2,
        height: MediaQuery.of(context).size.height * .65,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 2),
                  spreadRadius: 1,
                  blurRadius: 3)
            ]),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                 'customerOrder'.tr ,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .025,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * .25,
              child: SfCircularChart(series: <CircularSeries>[
                DoughnutSeries<ChartData, String>(
                    dataSource: chartData,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    // Mode of grouping
                    groupMode: CircularChartGroupMode.point,
                    groupTo: 2)
              ]),
            ),
            linearpercent('Completed  (40%)', '25', Color(0xff624FD1)),
            linearpercent('Pending (53%)', '60', Color(0xffFFA41D)),
            linearpercent('Cancel (25%)', '7', Color(0xff72C1E2)),
          ],
        ),
      ),
    );
  }

  linearpercent(String heading, String count, progcolor) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                heading,
              ),
              Text(
                count,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        LinearPercentIndicator(
          animation: true,
          animationDuration: 1000,
          lineHeight: 8,
          percent: int.parse(count) / 100,
          barRadius: Radius.circular(100),
          linearStrokeCap: LinearStrokeCap.roundAll,
          progressColor: progcolor,
          backgroundColor: Colors.grey[300],
        ),
      ],
    );
  }

  Widget itemsRow(String mainCourse, String mealName, double rating,
      int reviews, String qty, String price, String totalPrice) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .05,
                      height: MediaQuery.of(context).size.height * .1,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              // offset: Offset(2, 2),
                              // spreadRadius: 1,
                              // blurRadius: 3
                            )
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Wrap(
                            children: [
                              Text(
                                mainCourse.toUpperCase(),
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .017,
                                    color: orangeColros),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .005,
                          ),
                          Text(
                            mealName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .025,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .005,
                          ),
                          Row(
                            children: [
                              RatingBar.builder(
                                itemSize:
                                    MediaQuery.of(context).size.width * .012,
                                initialRating: rating,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  // print(rating);
                                },
                              ),
                              Text(
                                '($reviews ${'review'.tr} )',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .02,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          // SizedBox(width: MediaQuery.of(context).size.width *.1,),
          Expanded(
            flex: 1,
            child: Text(
              qty + 'x',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .023,
                  color: Colors.black),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '\$' + price,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .023,
                  color: Colors.black),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$' + totalPrice,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .023,
                      color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: orangeColros,
                    child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.close,
                          size: 13,
                          color: orangeColros,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget headingsRow() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // SizedBox(
        //   height: 5,
        // ),
        Expanded(
          flex: 5,
          child: Text(
           'items'.tr ,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * .03,
                color: black,
                fontWeight: FontWeight.bold),
          ),
        ),

        Expanded(
          flex: 1,
          child: Text(
           'qty'.tr ,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * .03,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),

        Expanded(
          flex: 2,
          child: Text(
            'price'.tr,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * .03,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            'totalprice'.tr,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * .03,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class ChartData {
  ChartData({required this.x, required this.y, required this.color});
  final String x;
  final double y;
  final Color color;
}
