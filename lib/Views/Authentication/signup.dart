import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geb_mobile_1/Widgets/AuthenticationFormField.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controllers/AuthController.dart';
import '../../Widgets/constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  var authController=Get.put(AuthController());

  bool _hidepassword = false;

  bool _hidepassword1 = false;

  void _loader() {
    authController.isLoading.value=true;

    // Simulating a login process with a delay
    Future.delayed(Duration(seconds: 2), () {
      authController.isLoading.value=false;
    });
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/background.png",)
            ),
          ),
          child:Form(
            key: _formKey,
            child: Container(
              width: Get.width,
              height: Get.height,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25), // 0.25 black opacity
                    spreadRadius: 0,
                    blurRadius: 4.r,
                    offset: Offset(0, 4), // changes position of shadow
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
                child: Stack(
                  children: [

                    Positioned(
                      top: 147.11.h,
                      left: 67.w,

                      child: Container(
                        padding: EdgeInsets.only(left: 0.w),
                        height: 438.h,
                        width: 258.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Sign Up", style: GoogleFonts.poppins(
                              //fontFamily: 'Alice-Regular',
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w500,
                                color:PrimaryColors.whitetext
                            ),),

                            SizedBox(height: 10.h,),

                            AuthenticationField(
                                icon: Icons.person,
                                hintText: "Enter Name",
                                controller: authController.fullnameController),

                            SizedBox(height: 5.h,),

                            AuthenticationField(
                                icon: Icons.email,
                                hintText: "Enter Email",
                                controller: authController.emailController),

                            SizedBox(height: 5.h,),

                            AuthenticationField(
                                icon: Icons.phone,
                                hintText: "Enter Phone",
                                controller: authController.phoneController),


                            SizedBox(height: 5.h,),

                            AuthenticationField(
                                icon: Icons.remove_red_eye,
                                hintText: "Enter Password",
                                controller: authController.passController),


                            ///Confirm Password
                            ///
                            SizedBox(height: 5.h,),


                            AuthenticationField(
                                icon: Icons.remove_red_eye,
                                hintText: "Enter Password",
                                controller: authController.passController),

                            GestureDetector(
                                onTap: (){
                                  if (_formKey.currentState!.validate()) {
                                    FocusScope.of(context).unfocus();
                                    _loader();
                                    authController.register();
                                  }

                                },
                                child: Obx(()=>
                                  authController.isLoading.value?
                                  Container(
                                    margin: EdgeInsets.only(top:20.h, bottom: 0.h),
                                    height: 35.h,
                                    width: 35.h,
                                    child: CircularProgressIndicator(
                                      color: PrimaryColors.whitetext,
                                    ),
                                  ):
                                  Container(
                                      margin: EdgeInsets.only(top:20.h, bottom: 0.h),
                                      height: 35.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                          color: PrimaryColors.customebutton,
                                          borderRadius: BorderRadius.circular(30.w)
                                      ),
                                      child: Center(
                                        child: Text("Sign Up", style: GoogleFonts.roboto(
                                          //fontFamily: 'Alice-Regular',
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w500,
                                            color:PrimaryColors.whitetext.withOpacity(1)
                                        ),),
                                      ))

                                )),

                            SizedBox(height: 20.h,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Already have an account? ', style: GoogleFonts.poppins(
                                  //fontFamily: 'Alice-Regular',
                                    fontSize: 12.h,
                                    fontWeight: FontWeight.w400,
                                    color:PrimaryColors.whitetext.withOpacity(1)
                                ),),
                                GestureDetector(
                                  onTap: (){
                                    Get.back();
                                  },
                                  child: Text( 'Sign in',
                                    style: GoogleFonts.roboto(
                                      //fontFamily: 'Alice-Regular',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color:PrimaryColors.whitetext.withOpacity(1),
                                      decoration: TextDecoration.underline,
                                      decorationColor: PrimaryColors.whitetext.withOpacity(1),
                                    ),),
                                ),
                                Text( ' now ',style: GoogleFonts.roboto(
                                  //fontFamily: 'Alice-Regular',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color:PrimaryColors.whitetext.withOpacity(0.8)
                                ),),
                              ],
                            ),


                          ],
                        ),// Or any other color for overlay
                      ),
                    ),
                    Positioned(
                      top: 668.h,
                      left: 44.w,
                      bottom: -69.h,
                      child: Image.asset(
                        'assets/images/logo.png', // Replace with your image asset
                        height: 240.h,
                        width: 302.w,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


