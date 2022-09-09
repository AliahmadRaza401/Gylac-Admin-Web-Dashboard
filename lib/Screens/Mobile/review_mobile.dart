// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gylac_dashboard/Utils/widget.dart';


class ReviewsScreenMobile extends StatefulWidget {
  const ReviewsScreenMobile({Key? key}) : super(key: key);

  @override
  State<ReviewsScreenMobile> createState() => _ReviewsScreenMobileState();
}

class _ReviewsScreenMobileState extends State<ReviewsScreenMobile> {
  // double rating = 3.5;
  CollectionReference reviewsStream =
      FirebaseFirestore.instance.collection('feedback');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Text(
                    'Review',
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
                  inputFieldCircularMobile(context, 'Search here', null, null,
                      Icon(Icons.search,size: 10,), (value) {}),
                  Spacer(
                    flex: 10,
                  ),
              
                ],
              ),
            ),
            Expanded(
              // padding: EdgeInsets.all(20),
              child: StreamBuilder<QuerySnapshot>(
                stream: reviewsStream
                    // .orderBy('orderDate', descending: true)
                    .snapshots(),
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
                            return reviewRowMobile(
                              document['orderId'],
                              document['driverName'],
                              '${document['reviewDate'].toDate()}',
                              document['feedback'],
                              double.parse(document['rating']),
                            );
                          }).toList(),
                        );
                },
              ),
              //  Column(
              //   children: [
              //     ordersRow(
              //       'id',
              //       'date',
              //       'name',
              //       'location',
              //       'amount',
              //       'docid',
              //       'pending',
              //     )
              //   ],
              // ),
            ),
          ],
        ),
      ),
    );
  }

  Widget reviewRowMobile(
    String orderID,
    String userName,
    String date,
    String review,
    double rating,
  ) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Expanded(
        child: Container(
          // width: MediaQuery.of(context).size.width * .385,
          height: MediaQuery.of(context).size.height * .12,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * .05,
                          height: MediaQuery.of(context).size.height * .05,
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
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '#' + orderID,
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .02,
                              color: Colors.orange),
                        ),
                        Text(
                          userName,
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .014,
                              color: Colors.black),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .15,
                          child: Wrap(
                            children: [
                              Text(
                                date,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .01,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex:2,
                child: Wrap(
                  children: [Text(review,style: TextStyle(
                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .01,
                  ),)],
                ),
              ),
              // Spacer(
              //   flex: 1,
              // ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$rating',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * .02,
                              fontWeight: FontWeight.bold),
                        ),
                        RatingBar.builder(
                          itemSize: MediaQuery.of(context).size.width * .015,
                          initialRating: rating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Color(0xffFF8A00),
                          ),
                          onRatingUpdate: (rating) {
                            // print(rating);
                          },
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: Image.asset(
                                'asset/DashboardIcons/Vector.png',
                                height:
                                    MediaQuery.of(context).size.height * .025,
                              ),
                            ),
                           
                            Padding(
                                padding: const EdgeInsets.only(right: 5,left: 5),
                                child: Image.asset(
                                    'asset/DashboardIcons/x-circle 1.png',width: 15,)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
