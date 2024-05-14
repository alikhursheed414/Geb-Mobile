import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geb_mobile_1/CustomBottom_Bar.dart';
import 'package:geb_mobile_1/Widgets/constants.dart';
import 'package:geb_mobile_1/Views/Authentication/login.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/ShareedPreferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
     initSplashScreen();
  }

  Future<void> initSplashScreen() async {
    await MySharedPreferences.init();
    navigateToNextScreen();
  }


  Future<void> navigateToNextScreen() async {
    // Simulating a wait time for splash screen
    await Future.delayed(Duration(seconds: 3));

    // Check if user is logged in
    bool loggedIn = MySharedPreferences.isLoggedIn();

    // Navigate based on login status
    if (loggedIn) {
      Get.offAll(() => HomeBottomBar());
    } else {
      Get.offAll(() => LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/background.png"),
          ),
        ),
        child: Center(
          child: Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  // 0.25 black opacity
                  spreadRadius: 0,
                  blurRadius: 4.r,
                  offset: Offset(0, 4),
                  // changes position of shadow
                ),
              ],
              gradient: LinearGradient(
                colors: [
                  PrimaryColors.gradient1,
                  PrimaryColors.gradient2
                ], // Add your colors here
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: Image.asset(
                "assets/images/logo.png",
                height: 214.h,
                width: 272.w,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
