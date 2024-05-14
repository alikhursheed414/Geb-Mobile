import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';


class PorjectHistoryPurchaseList extends StatelessWidget {
  String text1="";
  String text2="";
   PorjectHistoryPurchaseList
       (this.text1, this.text2,
      {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
      height: 66.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "09:00 am",
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: PrimaryColors.gradient2,
                ),
              ),

              SizedBox(height: 10.h,),

              Container(
                height: 1.h,
                width: 47.5.w,
                color: PrimaryColors.gradient2,
              ),
            ],
          ),

          Container(
            padding: EdgeInsets.only(left: 20.w, top: 0.h),
            width: 214.w,
            height: 68.h,
            decoration: BoxDecoration(
              color: PrimaryColors.gradient2,
              borderRadius: BorderRadius.circular(10.r),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF94C960),
                  Color(0xFF538576),
                ],
                stops: [0.0, 1.0],
                transform: GradientRotation(166.47 * 3.141592 / 180),
              ),

            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: PrimaryColors.whitetext,
                  ),
                ),

                Text(
                  text2,
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: PrimaryColors.whitetext,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}



class PorjectHistoryTaskList extends StatelessWidget {
  String text1="";
  PorjectHistoryTaskList
      (this.text1,
      {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
      height: 66.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "09:00 am",
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: PrimaryColors.gradient2,
                ),
              ),

              SizedBox(height: 10.h,),

              Container(
                height: 1.h,
                width: 47.5.w,
                color: PrimaryColors.gradient2,
              ),
            ],
          ),

          Container(
            padding: EdgeInsets.only(left: 20.w, top: 0.h),
            width: 214.w,
            height: 68.h,
            decoration: BoxDecoration(
              color: PrimaryColors.gradient2,
              borderRadius: BorderRadius.circular(10.r),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF94C960),
                  Color(0xFF538576),
                ],
                stops: [0.0, 1.0],
                transform: GradientRotation(166.47 * 3.141592 / 180),
              ),

            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: PrimaryColors.whitetext,
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
