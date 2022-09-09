// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../Utils/color.dart';
import '../../Utils/image.dart';
import '../home_page.dart';
int selectedIndex=0;
class MobileHome extends StatefulWidget {
  const MobileHome({ Key? key }) : super(key: key);

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
   Widget screens() {
    if (selectedIndex == 4) {
      // return DashBoard();
    }
    if (selectedIndex == 1) {
      // return DriversScreen();
    }
    if (selectedIndex == 2) {
      // return Orders();
    }
    if (selectedIndex == 3) {
      // return ReviewsScreen();
    }
     if (selectedIndex == 0) {
      return MobileHome();
    }
     if (selectedIndex == 5) {
      // return TopRatedCard();
    }
    return Center(
      child: Text('Comming soon'),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
                height: double.infinity,
                width: double.infinity,
                color: themeColor,
                child: Row(
                  children: [
                    Expanded(flex: 2, child: MobileSideBar()),
                    Expanded(
                        flex: 10,
                        child: Container(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: MobileHeader(),
                              ),
                              Expanded(
                                  flex: 6,
                                  child: screens()
                                      )
                            ],
                          ),
                        ))
                  ],
                )),
    );
  }
}



class MobileSideBar extends StatefulWidget {
  const MobileSideBar({Key? key}) : super(key: key);

  @override
  State<MobileSideBar> createState() => _MobileSideBarState();
}

class _MobileSideBarState extends State<MobileSideBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color:Colors.amber,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(logo), fit: BoxFit.cover)),
              // width: double.infinity,
              height: MediaQuery.of(context).size.height / 7,
            ),
            Expanded(
                child:  Expanded(
              child: Container(
                  width: double.infinity,
                  color: Colors.black,
                  child: ListView.builder(
                      itemCount: sideItems.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: dashboardSelectionForMobile(
                              sideItems[index]['icon'],
                              selectedIndex == index
                                  ? sideItems[index]['activeColor']
                                  : sideItems[index]['incativeColor'],
                              selectedIndex == index
                                  ? sideItems[index]['text']
                                  : '',
                              selectedIndex == index
                                  ? sideItems[index]['bgActive']
                                  : sideItems[index]['bgInactive'],
                            )
                            );
                      }))),
            )
          ],
        ),
      ),
    );
  }

    dashboardSelectionForMobile(image, imagecolor, text, bgColor) {
    return Container(
      height: MediaQuery.of(context).size.height * .1,
      color: bgColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image,
                height: MediaQuery.of(context).size.height * .03,
                color: imagecolor),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: purpleDashboard,
                fontSize: MediaQuery.of(context).size.width * .01,
              ),
            )
          ],
        ),
      ),
    );
  }

//  int selectedIndex = 0;
  List sideItems = [
    {
      'icon': 'asset/DashboardIcons/ic_dashboard.png',
      'text': 'Dashboard',
      'activeColor': purpleDashboard,
      'incativeColor': Colors.white,
      'bgInactive': Colors.transparent,
      'bgActive': themeColor
    },
    {
      'icon': 'asset/DashboardIcons/profile.png',
      'text': 'Users',
      'activeColor': purpleDashboard,
      'incativeColor': Colors.white,
      'bgInactive': Colors.transparent,
      'bgActive': themeColor
    },
    {
      'icon': 'asset/DashboardIcons/Group.png',
      'text': 'Orders',
      'activeColor': purpleDashboard,
      'incativeColor': Colors.white,
      'bgInactive': Colors.transparent,
      'bgActive': themeColor
    },
    {
      'icon': 'asset/DashboardIcons/profileGroup.png',
      'text': 'Reviews',
      'activeColor': purpleDashboard,
      'incativeColor': Colors.white,
      'bgInactive': Colors.transparent,
      'bgActive': themeColor
    },
    {
      'icon': 'asset/DashboardIcons/notifications.png',
      'text': 'Notifications',
      'activeColor': purpleDashboard,
      'incativeColor': Colors.white,
      'bgInactive': Colors.transparent,
      'bgActive': themeColor
    },
    {
      'icon': 'asset/DashboardIcons/doc.png',
      'text': 'Docs',
      'activeColor': purpleDashboard,
      'incativeColor': Colors.white,
      'bgInactive': Colors.transparent,
      'bgActive': themeColor
    },
    {
      'icon': 'asset/DashboardIcons/document.png',
      'text': 'Document',
      'activeColor': purpleDashboard,
      'incativeColor': Colors.white,
      'bgInactive': Colors.transparent,
      'bgActive': themeColor
    },
    {
      'icon': 'asset/DashboardIcons/pinloction.png',
      'text': 'PinLocation',
      'activeColor': purpleDashboard,
      'incativeColor': Colors.white,
      'bgInactive': Colors.transparent,
      'bgActive': themeColor
    },
    {
      'icon': 'asset/DashboardIcons/setting.png',
      'text': 'Settings',
      'activeColor': purpleDashboard,
      'incativeColor': Colors.white,
      'bgInactive': Colors.transparent,
      'bgActive': themeColor
    },
  ];
 
}