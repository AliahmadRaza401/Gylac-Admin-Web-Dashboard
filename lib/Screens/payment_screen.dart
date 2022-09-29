import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  CollectionReference ordersStream =
      FirebaseFirestore.instance.collection('orders');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Payments'.tr,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .04,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'orderId'.tr,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * .012,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Delivery Name'.tr,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * .012,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'pickup Name'.tr,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * .012,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'delivery Address'.tr,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * .012,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'pickup Delivery Price'.tr,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * .012,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              // width: 1000,
              child: StreamBuilder<QuerySnapshot>(
                stream: ordersStream.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  // return post();
                  if (snapshot.hasError) {
                    return const Center(child: Text('Something went wrong'));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return snapshot.data!.docs.length == 0
                      ? Container(
                          height: MediaQuery.of(context).size.height * 0.7,
                          // color: Colors.amber,
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: const Center(
                            child: Text("Noting to show!"),
                          ))
                      : ListView(
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            return Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                          document['orderId'],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                          document['deliveryName'],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                          document['pickupName'],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                          document['pickupAddress'],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 200,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            document['pickupDeliveryPrice'],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Divider()
                                ],
                              ),
                            );
                          }).toList(),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
