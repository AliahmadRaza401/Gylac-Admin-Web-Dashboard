// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, sized_box_for_whitespace, prefer_is_empty, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gylac_dashboard/Utils/color.dart';
import 'package:gylac_dashboard/Utils/widget.dart';

class DriversScreen extends StatefulWidget {
  const DriversScreen({Key? key}) : super(key: key);

  @override
  State<DriversScreen> createState() => _DriversScreenState();
}

class _DriversScreenState extends State<DriversScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }

  CollectionReference postStream =
      FirebaseFirestore.instance.collection('drivers');
  CollectionReference rejectedstream =
      FirebaseFirestore.instance.collection('drivers');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultTabController(
              length: 3,
              child: TabBar(
                // indicatorSize: TabBarIndicatorSize.tab,

                indicatorWeight: 5,

                indicatorColor: bluecolor,
                unselectedLabelColor: Colors.black,
                isScrollable: true,
                // automaticIndicatorColorAdjustment: true,
                labelColor: bluecolor,
                controller: _tabController,
                tabs: [
                  Tab(
                    text: "drivers".tr,
                  ),
                  Tab(
                    text: "accepted".tr,
                  ),
                  Tab(
                    text: "rejected".tr,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        // color: Colors.yellow,
                        width: MediaQuery.of(context).size.width * .08,
                        height: MediaQuery.of(context).size.height * .08,
                        alignment: Alignment.centerLeft,
                        child: mytext(context, 'image'.tr),
                      ),
                      Container(
                          // color: Colors.blue,
                          alignment: Alignment.bottomLeft,
                          width: MediaQuery.of(context).size.width * .1,
                          child: mytext(context, 'Email'.tr)),
                      Container(
                          alignment: Alignment.bottomLeft,
                          // color: Colors.red,
                          width: MediaQuery.of(context).size.width * .1,
                          child: mytext(context, "User Name".tr)),
                      Container(
                          alignment: Alignment.bottomLeft,
                          // color: Colors.amber,
                          width: MediaQuery.of(context).size.width * .09,
                          child: mytext(context, "Mobile".tr)),
                      Container(
                          //  color: Colors.pink,
                          alignment: Alignment.bottomLeft,
                          width: MediaQuery.of(context).size.width * .1,
                          child: mytext(context, 'Company Name'.tr)),
                      Container(
                          // color: Colors.pink,
                          alignment: Alignment.bottomLeft,
                          width: MediaQuery.of(context).size.width * .07,
                          child: mytext(context, 'rating'.tr)),
                      Container(
                          // color: Colors.pink,
                          alignment: Alignment.bottomLeft,
                          width: MediaQuery.of(context).size.width * .1,
                          child: mytext(context, 'Vehicle Details'.tr.tr)),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: MediaQuery.of(context).size.height * .05,
                          width: MediaQuery.of(context).size.width * .1,
                          decoration: BoxDecoration(
                              color: Color(0xffE3F8E5),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(.3)),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                              child: Text(
                            'Status'.tr,
                            style: TextStyle(
                                color: Color.fromARGB(255, 25, 43, 27)),
                          ))),
                      // Container(
                      //   width: MediaQuery.of(context).size.width * .02,
                      //   // color: Colors.amber,
                      //   child: pending == 'pending'
                      //       ? GestureDetector(
                      //           onTap: () {
                      //             shwoDialog(context, docId, () {
                      //               FirebaseFirestore.instance
                      //                   .collection('drivers')
                      //                   .doc(docId)
                      //                   .update({'status': 'approved'}).then((value) {
                      //                 Navigator.of(context).pop();
                      //               });
                      //             }, () {
                      //               FirebaseFirestore.instance
                      //                   .collection('drivers')
                      //                   .doc(docId)
                      //                   .update({'status': 'rejected'}).then((value) {
                      //                 Navigator.of(context).pop();
                      //               });
                      //             });
                      //           },
                      //           child: Icon(Icons.more_horiz_outlined))
                      //       : Container(),
                      // )
                    ],
                  ),
                  Divider()
                ],
              ),
            ),
            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  // height: 900,
                  // width: 1000,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: postStream.snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      // return post();
                      if (snapshot.hasError) {
                        return Center(child: Text('Something went wrong'));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return snapshot.data!.docs.length == 0
                          ? Container(
                              height: MediaQuery.of(context).size.height,
                              // color: Colors.amber,
                              padding: EdgeInsets.symmetric(vertical: 100),
                              child: Center(
                                child: Text("Noting to show!"),
                              ))
                          : ListView(
                              children: snapshot.data!.docs
                                  .map((DocumentSnapshot document) {
                                return allDrivers(
                                    document['dp'],
                                    document['email'],
                                    document['fullName'],
                                    document['mobileNumber'],
                                    document['vehicleCompany'],
                                    document['status'],
                                    document['id'],
                                    document['vDp'],
                                    document['vehicleNumber'],
                                    document['vehicleDesign'],
                                    document['vehicleChassisNumber'],
                                    document['status'],
                                    document['rating']);
                              }).toList(),
                            );
                    },
                  ),
                ),
                Container(
                  height: 900,
                  width: 1000,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: postStream.snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      // return post();
                      if (snapshot.hasError) {
                        return Center(child: Text('Something went wrong'));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return snapshot.data!.docs.length == 0
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
                                return document['status'] == 'approved'
                                    ? allDrivers(
                                        document['dp'],
                                        document['email'],
                                        document['fullName'],
                                        document['mobileNumber'],
                                        document['vehicleCompany'],
                                        document['status'],
                                        document['id'],
                                        document['vDp'],
                                        document['vehicleNumber'],
                                        document['vehicleDesign'],
                                        document['vehicleChassisNumber'],
                                        document['status'],
                                        document['rating'])
                                    : Container();
                              }).toList(),
                            );
                    },
                  ),
                ),
                Container(
                  // height: 900,
                  // width: 1000,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: rejectedstream.snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      // return post();
                      if (snapshot.hasError) {
                        return Center(child: Text('somethingWentWrong'.tr));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return snapshot.data!.docs.length == 0
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
                                return document['status'] == 'rejected'
                                    ? allDrivers(
                                        document['dp'],
                                        document['email'],
                                        document['fullName'],
                                        document['mobileNumber'],
                                        document['vehicleCompany'],
                                        document['status'],
                                        document['id'],
                                        document['vDp'],
                                        document['vehicleNumber'],
                                        document['vehicleDesign'],
                                        document['vehicleChassisNumber'],
                                        document['status'],
                                        document['rating'])
                                    : Container();
                              }).toList(),
                            );
                    },
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget allDrivers(
      String profileImage,
      String email,
      String userName,
      String mobile,
      String companyName,
      String status,
      String docId,
      String vehicleimage,
      String enginNumber,
      String design,
      String chassiNumber,
      String pending,
      var rating) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .07,
                height: MediaQuery.of(context).size.height * .08,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                // child: Image.network(profileImage),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                  //  color: Colors.blue,
                  alignment: Alignment.bottomLeft,
                  width: MediaQuery.of(context).size.width * .1,
                  child: mytext(context, email)),
              Container(
                  alignment: Alignment.bottomLeft,

                  //  color: Colors.red,
                  width: MediaQuery.of(context).size.width * .1,
                  child: mytext(context, userName)),
              Container(
                  alignment: Alignment.bottomLeft,

                  //  color: Colors.amber,
                  width: MediaQuery.of(context).size.width * .1,
                  child: mytext(context, mobile)),
              Container(
                  //  color: Colors.pink,
                  alignment: Alignment.bottomLeft,
                  width: MediaQuery.of(context).size.width * .1,
                  child: mytext(context, companyName)),
              Container(
                  // color: Colors.pink,
                  alignment: Alignment.bottomLeft,
                  width: MediaQuery.of(context).size.width * .06,
                  child: mytext(context, rating.toString())),
              Container(
                decoration: BoxDecoration(
                  color: themeColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.only(right: 7),
                width: MediaQuery.of(context).size.width * .12,
                height: MediaQuery.of(context).size.height * 0.05,
                child: Center(
                  child: Text(
                    'Vehicle Details'.tr,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // myButton(context, Text('vehicleDetails'.tr), () {
              //   shwovehicleDetails(vehicleimage, enginNumber, design,
              //       chassiNumber, companyName);
              // }, .12, .05),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: MediaQuery.of(context).size.height * .05,
                  width: MediaQuery.of(context).size.width * .1,
                  decoration: BoxDecoration(
                      color: Color(0xffE3F8E5),
                      // color: Colors.red,
                      border: Border.all(color: Colors.grey.withOpacity(.3)),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Text(
                    status,
                    style: TextStyle(color: Color.fromARGB(255, 25, 43, 27)),
                  ))),
              SizedBox(
                width: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .02,
                // color: Colors.amber,
                child: pending == 'pending'
                    ? GestureDetector(
                        onTap: () {
                          shwoDialog(context, docId, () {
                            FirebaseFirestore.instance
                                .collection('drivers')
                                .doc(docId)
                                .update({'status': 'approved'}).then((value) {
                              Navigator.of(context).pop();
                            });
                          }, () {
                            FirebaseFirestore.instance
                                .collection('drivers')
                                .doc(docId)
                                .update({'status': 'rejected'}).then((value) {
                              Navigator.of(context).pop();
                            });
                          });
                        },
                        child: Icon(Icons.more_horiz_outlined))
                    : Container(),
              )
            ],
          ),
          Divider()
        ],
      ),
    );
  }

  shwovehicleDetails(String vehicleimage, String enginNumber, String design,
      String chassiNumber, String companyName) async {
    await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
          // title: new Text('Message'),
          content: Container(
        width: MediaQuery.of(context).size.width * .4,
        height: MediaQuery.of(context).size.height * .5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .25,
              height: MediaQuery.of(context).size.height * .12,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage('asset/DashboardIcons/red_circle.png'))),
              child: FadeInImage(
                  image: NetworkImage(vehicleimage),
                  placeholder: AssetImage('asset/car.png')
                  // CachedNetworkImage(
                  //   imageUrl: vehicleimage,
                  //   // scale: 4,
                  ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                detailsRow('enginNO'.tr, enginNumber),
                detailsRow('carDesign'.tr, design),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                detailsRow('chassiNO'.tr, chassiNumber),
                detailsRow('companyTitle'.tr, companyName),
              ],
            ),
          ],
        ),
      )),
    );
  }

  Widget detailsRow(String lable, String detail) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lable,
            style: TextStyle(
                color: themeColor,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * .01),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.15,
            decoration: BoxDecoration(
              border: Border.all(color: themeColor),
              borderRadius: BorderRadius.circular(5),
            ),
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * .01),
            child: Align(alignment: Alignment.centerLeft, child: Text(detail)),
          )
        ],
      ),
    );
  }
}

// DropdownButton<String>(
//                                           elevation: 0,
//                                           isExpanded: true,
//                                           autofocus: true,
//                                           focusColor: Color(0xffE3F8E5),
//                                           dropdownColor: Color(0xffE3F8E5),
//                                           style: TextStyle(
//                                             color: Color(0xff56C662),                                       
//                                           ),
//                                           borderRadius: BorderRadius.circular(30),
//                                           underline: SizedBox(),
//                                           hint: Text('Approved'),
//                                           items: <String>[
//                                             'Approved',
//                                             'Rejected'                                          
//                                           ].map((String value) {
//                                             return DropdownMenuItem<String>(
//                                               value: value,
//                                               child: Text(
//                                                 value,
//                                                 style: TextStyle(
//                                                     color: Colors.black),
//                                               ),
//                                             );
//                                           }).toList(),
//                                           onChanged: (value) {
//                                             print(value);
//                                             // propertyType = value!;
//                                             // print(propertyType);
//                                             // showSnack(context,'$propertyType selected!');
//                                           },
//                                         ),