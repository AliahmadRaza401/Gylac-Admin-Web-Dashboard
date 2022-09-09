// ignore_for_file: prefer_const_constructors, unused_label

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gylac_dashboard/Screens/Mobile/login_mobile.dart';
import 'package:gylac_dashboard/Screens/login_screen.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'Utils/gyalic_strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyDzv8BE4FWuz7dTxPR38umPBKaNatMZLz4",
    appId: "1:658702519280:web:99f530f006f06d23206b35",
    messagingSenderId: "658702519280",
    projectId: "gylac-80caf",
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(1920, 2276),
        // minTextAdapt: true,
        // splitScreenMode: true,
        builder: (_, context) {
          return GetMaterialApp(
              translations:
                  WorldLanguage(), //Language class from world_languages.dart
              locale: Locale(
                  'en', 'US'),
               // translations will be displayed in that locale
              fallbackLocale: Locale('en', 'US'),
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: 'popinsFonts',
                primarySwatch: Colors.blue,
              ),
              home: ResponsiveBuilder(builder: (context, info) {
                if (info.deviceScreenType == DeviceScreenType.mobile) {
                  return LoginMobile();
                }
                if (info.deviceScreenType == DeviceScreenType.desktop) {
                  // return HomePage();
                  return LoginScreen();
                }
                return Container();
              }));
        });
  }
}
