// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gylac_dashboard/Utils/color.dart';
import 'package:gylac_dashboard/Utils/gradient_text.dart';
import 'package:gylac_dashboard/Utils/image.dart';


class TopRatedCardMobile extends StatefulWidget {
  String orderName;
  String details;
  String verhicleImg;
  String driverImg;
  String driverName;
  double rating;
  String price;
  String vehicletype;
  TopRatedCardMobile(
      {required this.orderName,
      required this.details,
      required this.driverImg,
      required this.driverName,
      required this.price,
      required this.rating,
      required this.vehicletype,
      required this.verhicleImg});

  @override
  State<TopRatedCardMobile> createState() => _TopRatedCardMobileState();
}

class _TopRatedCardMobileState extends State<TopRatedCardMobile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * .35,
        width: MediaQuery.of(context).size.width / 2.4,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.amber, width: 1),
          boxShadow: [
            BoxShadow(
                offset: const Offset(2, 3),
                blurRadius: 5,
                color: black.withOpacity(0.25))
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              // color: Colors.black,
              height: MediaQuery.of(context).size.height * .14,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.orderName.toUpperCase(),
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize:
                                  MediaQuery.of(context).size.width * .02,
                              fontWeight: FontWeight.bold)),
                      Text(widget.details.toUpperCase(),
                          style: const TextStyle(
                              fontFamily: 'Roboto',
                              // fontSize: 8,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: Container(
                              height: MediaQuery.of(context).size.height * .08,
                              width: MediaQuery.of(context).size.width * .04,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  // color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage('asset/download.png'),
                                      onError: (error, context) {
                                        AssetImage('asset/profileImage.png');
                                      })),
                            ),
                          ),
                          Column(
                            children: [
                              Text(widget.driverName.toUpperCase(),
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              .02,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 10),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * .14,
                                  height:
                                      MediaQuery.of(context).size.height * .04,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.orange,
                                          blurRadius: 5,
                                          offset: Offset(0,
                                              0), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: EdgeInsets.all(2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CircleAvatar(
                                        radius:
                                            MediaQuery.of(context).size.width *
                                                .01,
                                        child: Image.asset(badg),
                                      ),
                                      Text("Top High Rated",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontFamily: 'Poppins',
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .015,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        // width: 80,
                        // height: 20,
                        child: RatingBar.builder(
                          initialRating: widget.rating,
                          itemSize: MediaQuery.of(context).size.height * .03,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .4,
                  height: MediaQuery.of(context).size.height * .12,
                  decoration: BoxDecoration(
                    border: Border.all(color: black, width: 1),
                    borderRadius: BorderRadius.circular(10),
                    // color: Colors.blue,
                  ),
                  child: Image.asset("asset/bike.png"),
                ),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GradientText(
                      "\$${widget.price}",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: MediaQuery.of(context).size.width * .02,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF7C6414),
                          Color(0xFFFFC961),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    Image.asset(
                      widget.vehicletype == "CAR"
                          ? car
                          : widget.vehicletype == "VAN"
                              ? van
                              : widget.vehicletype == "SCOOTER"
                                  ? cycle
                                  : widget.vehicletype == "TRUCK"
                                      ? truck
                                      : widget.vehicletype == "BIKE"
                                          ? cycle
                                          : widget.vehicletype ==
                                                  "MINI TRUCK"
                                              ? mini_truck
                                              : "asset/Group 8503.png",
                      width: MediaQuery.of(context).size.width * .1,
                      height: MediaQuery.of(context).size.height * .1,
                      fit: BoxFit.contain,
                    ),
                    GradientText(
                      widget.vehicletype,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .02,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF7C6414),
                          Color(0xFFFFC961),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
