// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, file_names, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:developer';
import 'package:d_chart/d_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:get/get.dart';
import 'package:gylac_dashboard/Screens/top_rated.dart';
import 'package:gylac_dashboard/Utils/color.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../Utils/widget.dart';
import 'home_page.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int totalCustomers = 0;
  int pendingOrders = 0;
  int deliverdOrders = 0;
  int activedOrders = 0;
  int canceledOrders = 0;
  int totalDrivers = 0;
  int activeDrivers = 0;
  int pendingDrivers = 0;
  int rejectedDrivers = 0;
  var ticks = [7, 14, 21, 28, 35];
  var features = ["AA", "BB", "CC", "DD", "EE", "FF", "GG", "HH"];
  var data = [
    [10.0, 20, 28, 5, 16, 15, 17, 6],
    [14.5, 1, 4, 14, 23, 10, 6, 19]
  ];
  @override
  void initState() {
    super.initState();
    getCount();
  }

  List<double> values1 = [0.4, 0.8, 0.65];
  Future getCount() async {
    FirebaseFirestore.instance
        .collection('orders') //your collectionref
        .where('orderStatus', isEqualTo: 'Pending')
        .get()
        .then((value) {
      var count = 0;
      count = value.docs.length;
      log('Count = $count');
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
        .where('orderStatus', isEqualTo: 'Accepted')
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
        body: Container(
            padding: EdgeInsets.all(20),
            child: ListView(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'dashBoard'.tr,
                            style: TextStyle(
                                // color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * .02),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      Row(
                        children: [
                          Text(
                            'welcomeToAdmin'.tr,
                            style: TextStyle(
                              color: Color(0xff7E7E7E),
                              fontWeight: FontWeight.bold,
                              // fontSize:
                              //     MediaQuery.of(context).size.width *
                              //         .02
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              // var mangol = Locale('ru', 'RU');
                              //  var english = Locale('en', 'US');

                              // Get.updateLocale(second?english:mangol);
                              // setState(() {
                              //   second=!second;
                              // });
                              // Get.updateLocale(english);

                              setState(() {
                                selectedIndex = 0;
                              });
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomePage()));
                            },
                            child: iconContainer(
                                context,
                                Text(
                                  'refresh'.tr,
                                  style: TextStyle(color: purpleColor),
                                ),
                                lightPurpulcolor,
                                .08,
                                .06),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .01,
                          ),
                          // iconContainer(
                          //     context,
                          //     Icon(
                          //       Icons.settings,
                          //       color: Colors.white,
                          //     ),
                          //     bluecolor,
                          //     .03,
                          //     .06),
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DashboardStatCard(
                      bgcolor: skyblue,
                      title: 'totalRevenue'.tr,
                      value: '\$ 0',
                      image: 'asset/DashboardIcons/revenue.png'),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 8;
                      });
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: DashboardStatCard(
                        bgcolor: greencolor,
                        title: 'deliverdOrder'.tr,
                        value: '$deliverdOrders',
                        image: 'asset/DashboardIcons/deliverd.png'),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 8;
                      });
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: DashboardStatCard(
                        bgcolor: deeporangecolor,
                        title: 'pendingOrder'.tr,
                        value: '$pendingOrders',
                        image: 'asset/DashboardIcons/pendin.png'),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: DashboardStatCard(
                        bgcolor: themeColor,
                        title: 'customers'.tr,
                        value: '$totalCustomers',
                        image: 'asset/DashboardIcons/customers.png'),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DashboardDetailsCard(
                      bgcolor: white,
                      title: 'orderDetails'.tr,
                      text1: 'activeOrdder'.tr,
                      value1: '$activedOrders',
                      text2: 'pendingOrder'.tr,
                      value2: '$pendingOrders',
                      text3: 'deliverdOrder'.tr,
                      value3: '$deliverdOrders',
                      text4: 'cancelOrder'.tr,
                      value4: '$canceledOrders',
                      progess1: double.parse('$activedOrders'),
                      totalprogress1: 100,
                      progess2: double.parse('$pendingOrders'),
                      totalprogress2: 100,
                      progess3: double.parse('$deliverdOrders'),
                      totalprogress3: 100,
                      progess4: double.parse('$canceledOrders'),
                      totalprogress4: 100),
                  DashboardDetailsCard(
                      bgcolor: white,
                      title: 'customerDetails'.tr,
                      text1: 'totalCustomer'.tr,
                      value1: '$totalCustomers',
                      text2: 'activeCustomer'.tr,
                      value2: '$activedOrders',
                      text3: 'newCustomer'.tr,
                      value3: '0',
                      text4: 'oldCustomer'.tr,
                      value4: '$totalCustomers',
                      progess1: double.parse('$totalCustomers'),
                      totalprogress1: 100,
                      progess2: double.parse('$totalCustomers'),
                      totalprogress2: 100,
                      progess3: double.parse('0'),
                      totalprogress3: 100,
                      progess4: double.parse('$totalCustomers'),
                      totalprogress4: 100),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PayrollCard(
                    bgcolor: white,
                    title: 'payRole'.tr,
                    filter: 'filterByda'.tr,
                    text1: 'totalPay'.tr,
                    value1: '0 MNT',
                    progess1: 0,
                    totalprogress1: 100,
                    totalDrivers: '$totalDrivers',
                  ),
                  DashboardDetailsCard(
                      bgcolor: white,
                      title: 'driverDetails'.tr,
                      text1: 'totalDrivers'.tr,
                      value1: '$totalDrivers',
                      text2: 'activeDrivers'.tr,
                      value2: '$activeDrivers',
                      text3: 'pendignDriver'.tr,
                      value3: '$pendingDrivers',
                      text4: 'deactiveDriver'.tr,
                      value4: '$rejectedDrivers',
                      progess1: double.parse('$totalDrivers'),
                      totalprogress1: 100,
                      progess2: double.parse('$activeDrivers'),
                      totalprogress2: 100,
                      progess3: double.parse('$pendingDrivers'),
                      totalprogress3: 100,
                      progess4: double.parse('$rejectedDrivers'),
                      totalprogress4: 100),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Column(
                      children: [
                        Text('order'.tr,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            )),
                        AspectRatio(
                          aspectRatio: 10 / 3,
                          // aspectRatio: 8.0,
                          child: DChartBar(
                            data: [
                              {
                                'id': 'Bar',
                                'data': [
                                  {
                                    'domain': 'Active Order',
                                    'measure': activedOrders
                                  },
                                  {
                                    'domain': 'Delivere Orders',
                                    'measure': deliverdOrders
                                  },
                                  {
                                    'domain': 'Pending Orders',
                                    'measure': pendingOrders
                                  },
                                  {
                                    'domain': 'Cancel Orders',
                                    'measure': canceledOrders
                                  },
                                ],
                              },
                            ],
                            domainLabelPaddingToAxisLine: 16,
                            axisLineTick: 2,
                            axisLinePointTick: 2,
                            axisLinePointWidth: 10,
                            axisLineColor: Colors.green,
                            measureLabelPaddingToAxisLine: 16,
                            barColor: (barData, index, id) => Colors.green,
                            showBarValue: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('drivers'.tr,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.33,
                          child: DChartGauge(
                            donutWidth: 60,
                            data: [
                              // {'domain': 'Off', 'measure': 12},
                              // {'domain': 'Warm', 'measure': 30},
                              // {'domain': 'Hot', 'measure': 30},
                              {'domain': 'total'.tr, 'measure': totalDrivers},
                              {
                                'domain': 'approved'.tr,
                                'measure': activeDrivers
                              },
                              {
                                'domain': 'rejected'.tr,
                                'measure': rejectedDrivers
                              },
                              {
                                'domain': 'pending'.tr,
                                'measure': pendingDrivers
                              },
                            ],
                            fillColor: (pieData, index) {
                              switch (pieData['domain']) {
                                case 'Total':
                                  return Colors.green;
                                case 'Approved':
                                  return Colors.orange;
                                case 'Rejected':
                                  return Colors.red;
                                case 'Pending':
                                  return Colors.orange;
                                default:
                                  return Colors.red;
                              }
                            },
                            showLabelLine: false,
                            pieLabel: (pieData, index) {
                              return "${pieData['domain']}";
                            },
                            labelPosition: PieLabelPosition.inside,
                            labelPadding: 0,
                            labelColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    // child: DChartLine(
                    //   data: [
                    //     {
                    //       'id': 'Customer',
                    //       'data': [
                    //         {'domain': 0, 'measure': totalCustomers},
                    //         // {'domain': 2, 'measure': totalDrivers},
                    //         // {'domain': 4, 'measure': activeDrivers},
                    //       ],
                    //     },
                    //   ],
                    //   lineColor: (lineData, index, id) => Colors.amber,
                    // ),
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Center(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('totalRevenue'.tr,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          legend: Legend(isVisible: true),
                          series: <LineSeries<SalesData, String>>[
                            LineSeries<SalesData, String>(
                                dataSource: [
                                  SalesData('Jan',
                                      double.parse(totalCustomers.toString())),
                                  SalesData('Feb', 28),
                                  SalesData('Mar', 34),
                                  SalesData('Apr', 32),
                                  SalesData('May', 40)
                                ],
                                xValueMapper: (SalesData sales, _) =>
                                    sales.year,
                                yValueMapper: (SalesData sales, _) =>
                                    sales.sales,
                                dataLabelSettings: DataLabelSettings(
                                    isVisible:
                                        true) // Enables the data label.            )          ]        )      )    )

                                )

                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: Container(
                            //         // width: double.infinity,
                            //         height: MediaQuery.of(context).size.height * .1,
                            //         decoration: BoxDecoration(
                            //             color: themeColor,
                            //             borderRadius: BorderRadius.circular(10)),
                            //         child: Row(
                            //           children: [
                            //             Spacer(
                            //               flex: 1,
                            //             ),
                            //             inputField(context, "", null, null, null),
                            //             Spacer(),
                            //             iconContainer(
                            //                 context,
                            //                 Text(
                            //                   'Filter by Date',
                            //                   style: TextStyle(color: themeColor),
                            //                 ),
                            //                 white,
                            //                 .08,
                            //                 .05),
                            //             Spacer(flex: 9),
                            //             Container(
                            //               width: MediaQuery.of(context).size.width * .3,
                            //               child: Row(
                            //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //                 children: [
                            //                   iconContainer(
                            //                       context,
                            //                       Text(
                            //                         'Copy',
                            //                         style: TextStyle(color: themeColor),
                            //                       ),
                            //                       white,
                            //                       .07,
                            //                       .05),
                            //                   iconContainer(
                            //                       context,
                            //                       Text(
                            //                         'CSV',
                            //                         style: TextStyle(color: themeColor),
                            //                       ),
                            //                       white,
                            //                       .07,
                            //                       .05),
                            //                   iconContainer(
                            //                       context,
                            //                       Text(
                            //                         'Excel',
                            //                         style: TextStyle(color: themeColor),
                            //                       ),
                            //                       white,
                            //                       .07,
                            //                       .05),
                            //                   iconContainer(
                            //                       context,
                            //                       Text(
                            //                         'PDF',
                            //                         style: TextStyle(color: themeColor),
                            //                       ),
                            //                       white,
                            //                       .07,
                            //                       .05),
                            //                 ],
                            //               ),
                            //             ),
                            //             Spacer(),
                            //           ],
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.28,
                //   width: MediaQuery.of(context).size.width * 0.33,
                //   child: Container(
                //     // color: Colors.grey.shade200,
                //     child: Center(
                //         child: RadarChart.light(
                //       ticks: ticks,
                //       features: features,
                //       data: data,
                //       reverseAxis: true,
                //       // useSides: useSides,
                //     )),
                //   ),
                // )
              ])
            ])));
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
