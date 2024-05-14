import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geb_mobile_1/Widgets/CustomButtons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Widgets/constants.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({Key? key}) : super(key: key);


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        padding: EdgeInsets.all(20.w),
        color: PrimaryColors.whitetext,
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (){
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      child: SvgPicture.asset("assets/icons/profile.svg", height: 23.h,width: 23.w,)),
                  Image.asset("assets/images/logo.png",height: 60.h,width: 75.65.w,),
                  GestureDetector(
                      onTap: () {
                        // Open drawer from the right
                        _scaffoldKey.currentState?.openEndDrawer();
                      },
                      child: Image.asset("assets/images/many.png",height: 15.h,width: 23.w,)),

                ],
              ),
            ),

            SizedBox(height: 20.h,),

            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Change Password:",
                style: GoogleFonts.poppins(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: PrimaryColors.background1,
                ),
              ),
            ),


            SizedBox(height: 20.h,),




            Container(
              alignment: Alignment.center,
                padding: EdgeInsets.only(left:20.w, right: 20.w,top: 10.h),
                child: Column(
                  children: [

                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Current Password:",
                        style: GoogleFonts.poppins(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: PrimaryColors.background1.withOpacity(0.6),
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 5.h),
                      child: Row(
                        children: [
                          Container(
                            height:46.69.h,
                            width: 47.88.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0.r),
                                border: Border.all(
                                  width: 1.w,
                                  color: PrimaryColors.drawercolor,
                                )
                            ),
                            child:  Center(child: SvgPicture.asset("assets/icons/passeye.svg", width: 24.w, height: 21.h,color: PrimaryColors.background1,)),
                          ),

                          SizedBox(width: 10.w,),

                          Container(
                            width: 222.w,
                            height: 48.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0.r),
                                border: Border.all(
                                  width: 1.w,
                                  color: PrimaryColors.drawercolor,
                                )
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left:12.w),
                              child: TextFormField(
                                style: GoogleFonts.poppins(
                                  //fontFamily: 'Alice-Regular',
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color:PrimaryColors.drawercolor1.withOpacity(0.6)
                                ),
                                decoration: InputDecoration(
                                  hintStyle: GoogleFonts.poppins(
                                    //fontFamily: 'Alice-Regular',
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                      color:PrimaryColors.drawercolor1.withOpacity(0.6)
                                  ),
                                  hintText: "Current Password",
                                  border: InputBorder.none,
                                 ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 15.h,),

                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Current Password:",
                        style: GoogleFonts.poppins(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: PrimaryColors.background1.withOpacity(0.6),
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 5.h),
                      child: Row(
                        children: [
                          Container(
                            height:46.69.h,
                            width: 47.88.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0.r),
                                border: Border.all(
                                  width: 1.w,
                                  color: PrimaryColors.drawercolor,
                                )
                            ),
                            child:  Center(child: SvgPicture.asset("assets/icons/passeye.svg", width: 24.w, height: 21.h,color: PrimaryColors.background1,)),
                          ),

                          SizedBox(width:
                          10.w,),

                          Container(
                            width: 222.w,
                            height: 48.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0.r),
                                border: Border.all(
                                  width: 1.w,
                                  color: PrimaryColors.drawercolor,
                                )
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                style: GoogleFonts.poppins(
                                  //fontFamily: 'Alice-Regular',
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color:PrimaryColors.drawercolor1.withOpacity(0.6)
                                ),
                                decoration: InputDecoration(
                                  hintStyle: GoogleFonts.poppins(
                                    //fontFamily: 'Alice-Regular',
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                      color:PrimaryColors.drawercolor1.withOpacity(0.6)
                                  ),
                                  hintText:"Confirm Password",
                                  border: InputBorder.none,
                                   ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 15.h,),

                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Confirm New Password:",
                        style: GoogleFonts.poppins(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: PrimaryColors.background1.withOpacity(0.6),
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 2.h),
                      child: Row(
                        children: [
                          Container(
                            height:46.69.h,
                            width: 47.88.w,
                            decoration: BoxDecoration(
                                color: PrimaryColors.whitetext,
                                borderRadius: BorderRadius.circular(5.0.r),
                                border: Border.all(
                                  width: 1.w,
                                  color: PrimaryColors.drawercolor,
                                )
                            ),
                            child:  Center(child: SvgPicture.asset("assets/icons/passeye.svg", color: PrimaryColors.background1,width: 24.w, height: 21.h,)),
                          ),

                          SizedBox(width:
                          10.w,),

                          Container(
                            width: 222.w,
                            height: 48.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0.r),
                                border: Border.all(
                                  width: 1.w,
                                  color: PrimaryColors.drawercolor,
                                )
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                style: GoogleFonts.poppins(
                                  //fontFamily: 'Alice-Regular',
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color:PrimaryColors.drawercolor1.withOpacity(0.6)
                                ),
                                decoration: InputDecoration(
                                  hintStyle: GoogleFonts.poppins(
                                    //fontFamily: 'Alice-Regular',
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                      color:PrimaryColors.drawercolor1.withOpacity(0.6)
                                  ),
                                  hintText: "Confirm New Password",
                                  border: InputBorder.none,
                                  ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
            ),

            SizedBox(height: 20.h,),



            SettingButton(
              width: 125, height: 31, whiteback: false,
              Iconwidth: 14, Iconheight: 14, iconPath: 'assets/icons/edit.svg',
              text: 'Save Password', backgroundColor: PrimaryColors.gradient2,)



          ],
        ),
      ),
    );
  }
}


