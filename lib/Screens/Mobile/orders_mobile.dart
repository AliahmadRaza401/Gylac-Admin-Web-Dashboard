// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unnecessary_new, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_local_variable, unnecessary_string_interpolations, avoid_print, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gylac_dashboard/Screens/order_details.dart';
import 'package:gylac_dashboard/Utils/widget.dart';

class OrdersMobile extends StatefulWidget {
  const OrdersMobile({Key? key}) : super(key: key);

  @override
  State<OrdersMobile> createState() => _OrdersMobileState();
}

class _OrdersMobileState extends State<OrdersMobile> {
  final ordersStream =
      FirebaseFirestore.instance.collection('orders');
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool isloading = false;
  addToTopRated(String deliveryName, String driverId, String parcel,
      String vehicle, String imageUrl, String price) async {
    try {
      setState(() {
        isloading = true;
      });
      String rating = '';
      String driverImage = '';
      String driverName = '';
      db.collection('drivers').doc(driverId).snapshots().listen((event) {
        setState(() {
          rating = event.data()!['rating'].toString();
          driverImage = event.data()!['dp'];
          driverName = event.data()!['fullName'];
        });
        db.collection("topRateds").doc().set({
          'orderName': deliveryName,
          'parcel': parcel,
          'driverName': driverName,
          'rating': rating,
          'price': price,
          'vehicleType': vehicle,
          'imageUrl': imageUrl,
          'driverImage': driverImage
        }).then((value) {
          print('object');
          setState(() {
            isloading = false;
          });
        });
      });
    } catch (e) {
      print(e.toString());
    }
    // }).onDone(() {print('done  '); });
    // .onError((e){
    //   print(e.toString());
  }

  // bool isLoaing = false;
  // addToTopRated(
  //   String orderName,
  //   String parcel,
  //   String driverName,
  //   String rating,
  //   String price,
  //   String vehicleType,
  //   String imageUrl,
  // ) async {
  //   try {
  //     setState(() {
  //       isLoaing = true;
  //     });
  //     db.collection("topRateds").doc().set({
  //       'orderName': orderName,
  //       'parcel': parcel,
  //       'driverName': driverName,
  //       'rating': rating,
  //       'price': price,
  //       'vehicleType': vehicleType,
  //       'imageUrl': imageUrl,
  //     }).then((value) {
  //       print('Data post');
  //       setState(() {
  //         isLoaing = false;
  //       });
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   // }).onDone(() {print('done  '); });
  //   // .onError((e){
  //   //   print(e.toString());
  // }
Stream<QuerySnapshot> stream() async* {
  var _stream = FirebaseFirestore.instance.collection('orders').snapshots();
  yield* _stream;
}


Stream<QuerySnapshot> searchData(String string) async* {
  var firestore = FirebaseFirestore.instance;
  var _search = firestore
      .collection('orders')
      .where('pickupEmail', isEqualTo: string)
      .snapshots();

  yield* _search;
}
  int i = 0;
 String search='';
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
                  'Order List',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .025,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                inputFieldCircularMobile(
                    context, 'Search here', null, null, Icon(Icons.search,size: 10,),
                    (value) {
                  setState(() {
                    search=value;
                    // final ordersStream =
                    //     FirebaseFirestore.instance.collection('orders').where('pickupEmail',isEqualTo: value);
                  });
                  // print(ordersStream.parameters);
                  print(value);
                }),
                // Spacer(
                //   flex: 2,
                // ),
                // iconContainerWithdoubleIcon(
                //     context,
                //     Image.asset('asset/DashboardIcons/filter.png',width: 10,),
                //     'Filter',
                //     Colors.white,
                //     Colors.black,
                //     .05,
                //     .03,
                //     Icon(
                //       Icons.keyboard_arrow_down_outlined,
                //       color: Colors.deepOrange,
                //     )),
                // Spacer(
                //   flex: 1,
                // ),
                Image.asset(
                  'asset/DashboardIcons/refreshs.png',
                  width: MediaQuery.of(context).size.width * .03,
                ),
                // Spacer(
                //   flex: 1,
                // ),
              ],
            ),
          ),
          headingRow('Order ID', 'Date', 'Customer Name', 'Location', 'Amount',
              'Status Order'),
          Expanded(
            // padding: EdgeInsets.all(20),
            child: StreamBuilder<QuerySnapshot>(
              stream: search==''?stream():searchData(search),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Something went wrong'));
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
                          child: Text("Noting to show!"),
                        ))
                    : ListView(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          i++;
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => OrderDetails(
                                        document['trackStatus'],
                                        document['deliveryPhone'],
                                        document['deliveryAddress'],
                                        document['deliveryName'],
                                        document['pickupName'],
                                        document['duration'],
                                        document['tracking'],
                                        document['pickupLong'],
                                        document['pickupLat'],
                                        document['pickupParcelDesc'],
                                        document['orderId'],
                                        document['pickupParcelName'],
                                        document['pickupDeliveryPrice'],
                                      )));
                              // showOrderDetails(
                              //   context,
                              //   document['orderId'],
                              // );
                            },
                            child: ordersRow(
                                i,
                                document['orderId'],
                                document['orderDate'],
                                document['userName'],
                                document['pickupAddress'],
                                document['pickupDeliveryPrice'],
                                document['orderId'],
                                document['orderStatus'], () {
                              addToTopRated(
                                  document["deliveryName"],
                                  document['driverId'],
                                  document["parcel"],
                                  document['vehicle'],
                                  '',
                                  document['pickupDeliveryPrice']);
                              // addToTopRated(
                              //   document["deliveryName"],
                              //   document["deliveryAddress"],
                              //   document["deliveryEmail"],
                              //   document["deliveryLat"],
                              //   document["deliveryLong"],
                              //   document["deliveryName"],
                              //   document["deliveryParcelDesc"],
                              //   // document["deliveryPhone"],
                              //   // document["distance"],
                              //   // document['driverId'],
                              //   // document["orderId"],
                              //   // document["parcel"],
                              //   // document['pickupAddress'],
                              //   // document['pickupDeliveryPrice'],
                              //   // document['pickupEmail'],
                              //   // document['pickupLat'],
                              //   // document['pickupLong'],
                              //   // document['pickupName'],
                              //   // document['pickupParcelDesc'],
                              //   // document['pickupParcelName'],
                              //   // document['pickupParcelWeight'],
                              //   // document['pickupPhone'],
                              //   // document['orderTime'],
                              //   // document['userName'],
                              //   // document['vehicle']
                              // );
                            }),
                          );
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

  // shwoOrderDetails(
  //   String orderid,
  // ) async {
  //   await showDialog(
  //     context: context,
  //     builder: (context) => new AlertDialog(
  //         content: Container(
  //       width: MediaQuery.of(context).size.width * .8,
  //       height: MediaQuery.of(context).size.height * .8,
  //       child: SingleChildScrollView(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //             Row(
  //               children: [
  //                 Text('Order ID #$orderid'),
  //               ],
  //             ),
  //             Container(
  //               // width: MediaQuery.of(context).size.width * .25,
  //               height: MediaQuery.of(context).size.height * .2,
  //               decoration: BoxDecoration(color: Colors.white, boxShadow: [
  //                 BoxShadow(
  //                     color: Colors.grey,
  //                     offset: Offset(2, 2),
  //                     spreadRadius: 1,
  //                     blurRadius: 3)
  //               ]),
  //               child: Stepper(
  //                 type: StepperType.horizontal,
  //                 steps: [
  //                 Step(title:Text('data'), content: Container(
  //                   child:Image.asset(mini_truck),
  //                 )),
  //                 Step(title:Text('data'), content: Container()),
  //                 Step(title:Text('data'), content: Container()),
  //                 Step(title:Text('data'), content: Container()),
  //                 Step(title:Text('data'), content: Container()),
  //               ])
  //               // ImageStepper(

  //               //   images: [
  //               //     AssetImage(mini_truck),
  //               //     AssetImage(truck),
  //               //     AssetImage(sortIcon)
  //               //   ],
  //               //   activeStep: activeStep,
  //               //   onStepReached: (index) {
  //               //     setState(() {
  //               //       activeStep = index;
  //               //     });
  //               //   },
  //               // ),
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: [
  //                 Column(children: [
  //                  Container(
  //                    width: MediaQuery.of(context).size.width*.4,
  //                    height: MediaQuery.of(context).size.height*.4,
  //                    color: Colors.blue,
  //                  ),
  //                  Row(children: [
  //                     Container(
  //                    width: MediaQuery.of(context).size.width*.4,
  //                    height: MediaQuery.of(context).size.height*.4,
  //                    color: Colors.blue,
  //                  ),
  //                   Container(
  //                    width: MediaQuery.of(context).size.width*.4,
  //                    height: MediaQuery.of(context).size.height*.4,
  //                    color: Colors.blue,
  //                  ),
  //                  ],)
  //                 ],),
  //                 Column(children: [
  //                     Container(
  //                    width: MediaQuery.of(context).size.width*.2,
  //                    height: MediaQuery.of(context).size.height*.4,
  //                    color: Colors.blue,
  //                  )
  //                 ],)
  //               ],
  //             ),

  //           ],
  //         ),
  //       ),
  //     )),
  //   );
  // }

  bool showDetailscard = true;

  showDetails(String name) {
    return Visibility(
        visible: showDetailscard,
        child: Container(
          child: Text(name),
        ));
  }

  Widget ordersRow(
      number,
      String orderId,
      String date,
      String customerName,
      String location,
      String amount,
      String docId,
      String pending,
      VoidCallback addtoTop) {
    return Stack(
      children: [
        Container(
          // height: MediaQuery.of(context).size.height *.13,
          width: 800,
          color: Colors.transparent,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  mytextForMobile(context, '$number'),
                  Container(
                      // color: Colors.blue,
                      alignment: Alignment.bottomLeft,
                      width: MediaQuery.of(context).size.width * .08,
                      child: mytextForMobile(context, orderId)),
                  Container(
                      alignment: Alignment.bottomLeft,
                      // color: Colors.red,
                      width: MediaQuery.of(context).size.width * .15,
                      child: mytextForMobile(context, date)),
                  Container(
                      alignment: Alignment.bottomLeft,
                      // color: Colors.amber,
                      width: MediaQuery.of(context).size.width * .12,
                      child: mytextForMobile(context, customerName)),
                  Container(
                      // color: Colors.pink,
                      alignment: Alignment.bottomLeft,
                      width: MediaQuery.of(context).size.width * .15,
                      child: mytextForMobile(context, location)),
                  Container(
                      // color: Colors.yellow,
                      alignment: Alignment.bottomLeft,
                      width: MediaQuery.of(context).size.width * .1,
                      child: mytextForMobile(context, amount)),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: MediaQuery.of(context).size.height * .03,
                      width: MediaQuery.of(context).size.width * .12,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color(0xffE3F8E5),
                          border:
                              Border.all(color: Colors.grey.withOpacity(.3)),
                          borderRadius: BorderRadius.circular(3)),
                      child: Text(
                        pending,
                        
                        style: TextStyle(color: Color(0xff56C662),fontSize: 9),
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width * .03,
                    height: MediaQuery.of(context).size.width * .01,
                    // color: Colors.amber,
                    child: pending == 'pending'
                        ? GestureDetector(
                            onTap: () {
                              shwoDialog(context, docId, () {
                                FirebaseFirestore.instance
                                    .collection('orders')
                                    .doc(docId)
                                    .update({'orderStatus': 'approved'});
                              }, () {
                                FirebaseFirestore.instance
                                    .collection('orders')
                                    .doc(docId)
                                    .update({'orderStatus': 'rejected'});
                              });
                            },
                            child: Icon(Icons.more_horiz_outlined))
                        : Container(),
                  ),
                ],
              ),
              Divider()
            ],
          ),
        ),
        // Positioned(
        //     right: 0,
        //     top: 2,
        //     child: myButton(
        //         context,
        //         Text(
        //           'Top Rated',
        //           style: TextStyle(fontSize: 11),
        //         ),
        //         addtoTop,
        //         .07,
        //         .05))
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
              mytextForMobile(context, ''),
              // mobileheading(context, '$number'),
              // Image.asset(sortIcon),
              Container(
                  // color: Colors.blue,
                  alignment: Alignment.bottomLeft,
                  width: MediaQuery.of(context).size.width * .08,
                  child: mobileheading(context, orderId)),
              Container(
                  alignment: Alignment.bottomLeft,
                  // color: Colors.red,
                  width: MediaQuery.of(context).size.width * .15,
                  child: mobileheading(context, date)),
              Container(
                  alignment: Alignment.bottomLeft,
                  // color: Colors.amber,
                  width: MediaQuery.of(context).size.width * .12,
                  child: mobileheading(context, customerName)),
              Container(
                  // color: Colors.pink,
                  alignment: Alignment.bottomLeft,
                  width: MediaQuery.of(context).size.width * .15,
                  child: mobileheading(context, location)),
              Container(
                  // color: Colors.yellow,
                  alignment: Alignment.bottomLeft,
                  width: MediaQuery.of(context).size.width * .1,
                  child: mobileheading(context, amount)),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  // height: MediaQuery.of(context).size.height * .05,
                  width: MediaQuery.of(context).size.width * .1,
                  child: Center(
                      child: mobileheading(
                    context,
                    'Status',
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
