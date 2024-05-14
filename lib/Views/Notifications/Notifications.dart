import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geb_mobile_1/Widgets/HomePageList.dart';
import 'package:geb_mobile_1/Widgets/constants.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';



class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        color: PrimaryColors.whitetext,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 21.w, right: 21.w, top: 21.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap:(){
                        Get.back();
                      },
                      child: Container(
                        width:32.41.w,
                        height:30.71.h,
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              spreadRadius: 0,
                              blurRadius:4,
                              offset: Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/left.svg",
                        ),
                      ),
                    ),
                    Image.asset(
                      "assets/images/logo.png",
                      height: 60.h,
                      width: 75.65.w,
                    ),
                    Image.asset(
                      "assets/images/many.png",
                      height: 15.h,
                      width: 23.w,
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left:15.w, right:15, top: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Notifications: ",
                      style: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: PrimaryColors.background1,
                      ),
                    ),
                    Container(
                      height: 21.h,
                      width: 106.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.r),
                        color: PrimaryColors.gradient2
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SvgPicture.asset("assets/icons/correct.svg", height: 7.06.h,width: 12.46.w,),
                          Text(
                            " Mark all as read",
                            style: GoogleFonts.poppins(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w400,
                              color: PrimaryColors.whitetext,
                            ),
                          ),
                        ],
                      )
                    ),
                  ],
                ),
              ),

              ///List here for the below content....



              SizedBox(height: 20.h,),


              NotificationsList(),
              NotificationsList(),
              NotificationsList(),
              NotificationsList(),
              NotificationsList(),

            ],
          ),
        ),
      ),
    );
  }
}
