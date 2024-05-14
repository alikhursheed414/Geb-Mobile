import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geb_mobile_1/Views/Authentication/signup.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'RecoverPassword.dart';
import '../../Widgets/constants.dart';
class Forgotpassword extends StatefulWidget {
  const Forgotpassword({Key? key}) : super(key: key);

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {

  TextEditingController emailController=new TextEditingController();
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
                          Text("Forgot Password ?", style: GoogleFonts.poppins(
                            //fontFamily: 'Alice-Regular',
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w500,
                              color:PrimaryColors.whitetext
                          ),),
        
                          SizedBox(height: 10.h,),
        
                          TextFormField(
                            controller:emailController,
                            style:  GoogleFonts.roboto(
                              //fontFamily: 'Alice-Regular',
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                color:PrimaryColors.whitetext.withOpacity(0.6)
                            ),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left:10, top: 20),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white, // Change the color here
                                  ),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white, // Change the color here
                                  ),
                                ),
                                hintText:  "Email",
                                hintStyle: GoogleFonts.roboto(
                                  //fontFamily: 'Alice-Regular',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    color:PrimaryColors.whitetext.withOpacity(0.6)
                                ),// No visible border
                                suffixIcon: Icon(Icons.mail, color: PrimaryColors.whitetext, size: 10.sp,)
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Email';
                              }
                              return null;
                            },
                          ),
        
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(top: 5.h),
                            child: Text('A link will be sent to your email to reset your  password', style: GoogleFonts.poppins(
                              //fontFamily: 'Alice-Regular',
                                fontSize: 9.h,
                                fontWeight: FontWeight.w300,
                                color:PrimaryColors.whitetext.withOpacity(1)
                            ),),
                          ),
        
        
                          GestureDetector(
                              onTap: (){
                                Get.to(()=>Recoverpassword());
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top:25.h, bottom: 0.h),
                                  height: 48.h,
                                  width: 184.w,
                                  decoration: BoxDecoration(
                                      color: PrimaryColors.customebutton,
                                      borderRadius: BorderRadius.circular(40.r)
                                  ),
                                  child: Center(
                                    child: Text("Send Recovery Link", style: GoogleFonts.poppins(
                                      //fontFamily: 'Alice-Regular',
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                        color:PrimaryColors.whitetext.withOpacity(1)
                                    ),),
                                  ))),
        
        
        
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

