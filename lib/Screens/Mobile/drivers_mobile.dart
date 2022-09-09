// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, sized_box_for_whitespace, prefer_is_empty, avoid_unnecessary_containers

import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gylac_dashboard/Utils/color.dart';
import 'package:gylac_dashboard/Utils/widget.dart';

class DriversScreenForMobile extends StatefulWidget {
  const DriversScreenForMobile({Key? key}) : super(key: key);

  @override
  State<DriversScreenForMobile> createState() => _DriversScreenForMobileState();
}

class _DriversScreenForMobileState extends State<DriversScreenForMobile>
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
                    text: "All Drivers",
                  ),
                  Tab(
                    text: "Accepted",
                  ),
                  Tab(
                    text: "Rejected",
                  ),
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
                                );
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
                                child: Text("Noting to show!"),
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
                                      )
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
                                      )
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

  // shwoDialog(String id) async {
  //   await showDialog(
  //     context: context,
  //     builder: (context) => new AlertDialog(
  //       // title: new Text('Message'),
  //       content: Container(
  //         height: MediaQuery.of(context).size.height * .15,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //             GestureDetector(
  //               onTap: () {
  //                 FirebaseFirestore.instance
  //                     .collection('drivers')
  //                     .doc(id)
  //                     .update({'status': 'approved'});
  //               },
  //               child: Row(
  //                 children: [
  //                   Image.asset('asset/DashboardIcons/check-circle 1.png'),
  //                   SizedBox(
  //                     width: MediaQuery.of(context).size.width * .01,
  //                   ),
  //                   Text(
  //                     "Approved",
  //                     style: TextStyle(fontWeight: FontWeight.bold),
  //                   )
  //                 ],
  //               ),
  //             ),
  //             SizedBox(
  //               height: MediaQuery.of(context).size.height * .02,
  //             ),
  //             GestureDetector(
  //               onTap: () {
  //                 FirebaseFirestore.instance
  //                     .collection('drivers')
  //                     .doc(id)
  //                     .update({'status': 'rejected'});
  //               },
  //               child: Row(
  //                 children: [
  //                   Image.asset('asset/DashboardIcons/x-circle 1.png'),
  //                   SizedBox(
  //                     width: MediaQuery.of(context).size.width * .01,
  //                   ),
  //                   Text(
  //                     "Rejected",
  //                     style: TextStyle(fontWeight: FontWeight.bold),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

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
      String pending) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .03,
                height: MediaQuery.of(context).size.height * .02,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(1)),
                // child: Image.network(profileImage),
              ),
              Container(
                  // color: Colors.blue,
                  alignment: Alignment.bottomLeft,
                  width: MediaQuery.of(context).size.width * .15,
                  child: mytextForMobile(
                    context,
                    email,
                  )),
              Container(
                  alignment: Alignment.bottomLeft,
                  // color: Colors.red,
                  width: MediaQuery.of(context).size.width * .1,
                  child: mytextForMobile(context, userName)),
              Container(
                  alignment: Alignment.bottomLeft,
                  // color: Colors.amber,
                  width: MediaQuery.of(context).size.width * .1,
                  child: mytextForMobile(context, mobile)),
              Container(
                  // color: Colors.pink,
                  alignment: Alignment.bottomLeft,
                  width: MediaQuery.of(context).size.width * .12,
                  child: mytextForMobile(context, companyName)),

                  SizedBox(
                    height: 15,
                    child: ElevatedButton(onPressed: (){
shwovehicleDetails(vehicleimage, enginNumber, design,
                    chassiNumber, companyName);
                    }, 
                    
                     style: ElevatedButton.styleFrom(
                primary: themeColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                )),child: Text(
                     'Details',
                      style: TextStyle(fontSize:9),
                    ), ),
                  ),
              // myButtonMobile(
              //     context,
              //     Text(
              //       'Details',
              //       style: TextStyle(fontSize:10),
              //     ), () {
              //   shwovehicleDetails(vehicleimage, enginNumber, design,
              //       chassiNumber, companyName);
              // }, .1, .03),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: MediaQuery.of(context).size.height * .03,
                  width: MediaQuery.of(context).size.width * .12,
                  decoration: BoxDecoration(
                      color: Color(0xffE3F8E5),
                      border: Border.all(color: Colors.grey.withOpacity(.3)),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Text(
                    status,
                    
                    style: TextStyle(
                      fontSize: 9,
                      color: Color.fromARGB(255, 25, 43, 27)),
                  ))),
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
                detailsRow('Engine Number', enginNumber),
                detailsRow('Car Design', design),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                detailsRow('Chaasis Number', chassiNumber),
                detailsRow('Company Title', companyName),
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