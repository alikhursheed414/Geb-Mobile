import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geb_mobile_1/Widgets/CustomButtons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Authentication/ChangePassword.dart';
import '../../Widgets/constants.dart';

class ProfileSetting extends StatelessWidget {
   ProfileSetting({Key? key}) : super(key: key);


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: PrimaryColors.whitetext,
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
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
              alignment: Alignment.center,
              child: Text(
                "Settings",
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: PrimaryColors.background1,
                ),
              ),
            ),


            Stack(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 30.h),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle
                    ),
                    child: Image.asset("assets/images/profile.png",width: 136.w,
                      height: 139.h,)),

                Positioned(
                  right: 0.w,
                  top: 40.h,
                  child: Icon(Icons.edit, color: PrimaryColors.gradient2.withOpacity(0.5), size: 13.sp,),
                )
              ],
            ),


            SizedBox(height: 20.h,),

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Rida e Noor Gillani",
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: PrimaryColors.background1,
                    ),
                  ),

                  SizedBox(width: 3.w,),

                  Icon(Icons.edit, color: PrimaryColors.gradient2.withOpacity(0.5), size: 9.sp,),
                ],
              )
            ),



            Container(
              margin: EdgeInsets.only(top:20.h),
              child: Text(
                "\$40.00/Hr",
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: PrimaryColors.background1.withOpacity(0.5),
                ),
              ),
            ),


            Container(
                padding: EdgeInsets.only(left:20.h, right: 20.h,top: 10.h),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                            child:  Center(child: SvgPicture.asset("assets/icons/profile1.svg", color: PrimaryColors.background1,)),
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
                                  hintText: "JohnSmith@gmail.com",
                                  border: InputBorder.none,
                                  suffixIcon:  Icon(Icons.edit, color: PrimaryColors.gradient2.withOpacity(0.5), size: 13.sp,),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                            child:  Center(child: SvgPicture.asset("assets/icons/sms.svg", color: PrimaryColors.background1,)),
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
                                  hintText:"johnsmith@gmail.com",
                                  border: InputBorder.none,
                                  suffixIcon:  Icon(Icons.edit, color: PrimaryColors.gradient2.withOpacity(0.5), size: 13.sp,),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                            child:  Center(child: SvgPicture.asset("assets/icons/call.svg", color: PrimaryColors.background1,)),
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
                                  hintText: "+92 3077843056",
                                  border: InputBorder.none,
                                  suffixIcon:  Icon(Icons.edit, color: PrimaryColors.gradient2.withOpacity(0.5), size: 13.sp,),
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



            Container(
              margin: EdgeInsets.only(left:50.h, right: 50.h,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap:(){
                      Get.to(()=>ChangePassword());
                      },
                    child: SettingButton(
                      width: 125, height: 31, whiteback: true,
                      Iconwidth: 14, Iconheight: 14, iconPath: 'assets/icons/delete.svg',
                      text: 'Delete Account', backgroundColor: PrimaryColors.gradient2,),
                  ),

                  SettingButton(
                    width: 125, height: 31, whiteback: false,
                    Iconwidth: 14, Iconheight: 14, iconPath: 'assets/icons/edit.svg',
                    text: 'Save changes', backgroundColor: PrimaryColors.gradient2,)
                ],
              ),
            )



          ],
        ),
      ),
    );
  }
}
