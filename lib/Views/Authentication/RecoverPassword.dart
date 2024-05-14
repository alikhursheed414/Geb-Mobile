import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geb_mobile_1/Views/Authentication/signup.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../Widgets/constants.dart';
class Recoverpassword extends StatefulWidget {
   Recoverpassword({Key? key}) : super(key: key);

  @override
  State<Recoverpassword> createState() => _RecoverpasswordState();
}

class _RecoverpasswordState extends State<Recoverpassword> {

  TextEditingController emailController=new TextEditingController();





  @override
  Widget build(BuildContext context) {
    final defaultpinTheme=PinTheme(
      width: 25.w,
      height: 24.h,
      textStyle: GoogleFonts.poppins(
        //fontFamily: 'Alice-Regular',
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
          color:PrimaryColors.whitetext
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white, // Set your color here
            width: 1.0, // Set the width of the border
          ),
        ),
      ),
    );
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
          child:Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25), // 0.25 black opacity
                  spreadRadius: 0,
                  blurRadius: 4,
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
                    top: 235.11.h,
                    left: 50.w,
        
                    child: Container(
                      padding: EdgeInsets.only(left: 0.w, top: 20.h),
                      width: 271.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Recover Password ", style: GoogleFonts.poppins(
                            //fontFamily: 'Alice-Regular',
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w500,
                              color:PrimaryColors.whitetext
                          ),),
        
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: 0.h),
                            child: Text('Check your Email, We just you a recovery code', style: GoogleFonts.poppins(
                              //fontFamily: 'Alice-Regular',
                                fontSize: 11.h,
                                fontWeight: FontWeight.w400,
                                color:PrimaryColors.whitetext.withOpacity(0.8)
                            ),),
                          ),
        
                          SizedBox(height: 10.h,),
        
                          Pinput(
                            length: 4,
                            defaultPinTheme: defaultpinTheme,
                            focusedPinTheme: defaultpinTheme.copyWith(
                            ),
                            onCompleted: (pin)=>debugPrint(pin),
                          ),
        
        
                          SizedBox(height: 20.h,),
        
        
        
        
                          Center(
                            child: Text("00 : 34", style: GoogleFonts.poppins(
                              //fontFamily: 'Alice-Regular',
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w400,
                                color:PrimaryColors.whitetext.withOpacity(1)
                            ),),
                          ),
        
                          GestureDetector(
                              onTap: (){
        
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top:20.h, bottom: 0.h),
                                  height: 48.h,
                                  width: 171.w,
                                  decoration: BoxDecoration(
                                      color: PrimaryColors.customebutton,
                                      borderRadius: BorderRadius.circular(30.w)
                                  ),
                                  child: Center(
                                    child: Text("Recover Account", style: GoogleFonts.poppins(
                                      //fontFamily: 'Alice-Regular',
                                        fontSize: 13.h,
                                        fontWeight: FontWeight.w400,
                                        color:PrimaryColors.whitetext.withOpacity(1)
                                    ),),
                                  ))),
        
                          SizedBox(height: 20.h,),
        
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Didn\'t get the code? ', style: GoogleFonts.poppins(
                                //fontFamily: 'Alice-Regular',
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color:PrimaryColors.whitetext.withOpacity(1)
                              ),),
                              GestureDetector(
                                onTap: (){
                                  Get.back();
                                },
                                child: Text( 'Resend',
                                  style: GoogleFonts.poppins(
                                    //fontFamily: 'Alice-Regular',
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w700,
                                    color:PrimaryColors.whitetext.withOpacity(1),
                                    decoration: TextDecoration.underline,
                                    decorationColor: PrimaryColors.whitetext.withOpacity(1),
                                  ),),
                              ),
                            ],
                          ),
        
        
        
        
        
        
                        ],
                      ),// Or any other color for overlay
                    ),
                  ),
                  Positioned(
                    top: 668.h,
                    left: 44,
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
    );
  }
}

