import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geb_mobile_1/Widgets/CustomButtons.dart';
import 'package:geb_mobile_1/Views/Projects/ProjectStarted.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

///Home RecenttList


class HomeRecentList extends StatelessWidget {
  const HomeRecentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 346.w,
      height:72.h,
      margin: EdgeInsets.only(top: 10.h),
      padding: EdgeInsets.only(left: 21.w, right: 21.w),
      decoration: BoxDecoration(
        color: PrimaryColors.gradient1.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Highway Building", style: GoogleFonts.poppins(
                //fontFamily: 'Alice-Regular',
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color:PrimaryColors.background1.withOpacity(1)
              ),),
              Text("40 Hours recorder", style: GoogleFonts.poppins(
                //fontFamily: 'Alice-Regular',
                fontSize: 9.sp,
                fontWeight: FontWeight.w400,
                color:PrimaryColors.background1.withOpacity(1),
              )
                ,),

              SizedBox(height: 10.h,),

              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    height: 3.w,
                    width: 192.w,
                    decoration: BoxDecoration(
                        color: PrimaryColors.gradient2.withOpacity(0.17),
                        borderRadius: BorderRadius.circular(10.r)
                    ),

                  ),

                  Container(
                    height: 3.w,
                    width: 150.w,
                    decoration: BoxDecoration(
                        color: PrimaryColors.gradient1.withOpacity(1),
                        borderRadius: BorderRadius.circular(10.r)
                    ),

                  )
                ],
              )
            ],
          ),

          Container(
            height: 57.h,
            width: 57.w,
            padding: EdgeInsets.all(15.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  PrimaryColors.gradient1,
                  PrimaryColors.gradient2
                ], // Add your colors here
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              shape: BoxShape.circle,

            ),
            child: SvgPicture.asset("assets/icons/tool.svg", color: PrimaryColors.whitetext, width: 31.79.w, height:29.21),
          )

        ],
      ),
    );
  }
}



class ProjectsList extends StatelessWidget {
  const ProjectsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 3.w, right: 3.w, top: 10.h),
          height: 118.h,
          width: 336.w,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            children: [
              Container(
                height:118.h,
                width: 227.w,
                padding: EdgeInsets.only(left: 20.w),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: PrimaryColors.background1.withOpacity(0.20),
                      blurRadius: 1.r,spreadRadius: 0.2,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    bottomLeft: Radius.circular(16.r),

                  ),
                  color: PrimaryColors.whitetext,
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Project ID : ", style: GoogleFonts.poppins(
                          //fontFamily: 'Alice-Regular',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color:PrimaryColors.background1
                        ),),
                        Text("3456", style: GoogleFonts.poppins(
                          //fontFamily: 'Alice-Regular',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color:PrimaryColors.background1
                        ),),
                      ],
                    ),
                    Text("Highway Builiding", style: GoogleFonts.poppins(
                      //fontFamily: 'Alice-Regular',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color:PrimaryColors.background1.withOpacity(0.3)
                    ),),

                    Text("Selveston Road, Shicago", style: GoogleFonts.poppins(
                      //fontFamily: 'Alice-Regular',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color:PrimaryColors.background1.withOpacity(0.3)
                    ),),

                    Container(
                      margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            height: 3.w,
                            width: 196.w,
                            decoration: BoxDecoration(
                                color: PrimaryColors.gradient2.withOpacity(0.17),
                                borderRadius: BorderRadius.circular(10.r)
                            ),

                          ),

                          Container(
                            height: 3.w,
                            width: 104.w,
                            decoration: BoxDecoration(
                                color: PrimaryColors.gradient1.withOpacity(1),
                                borderRadius: BorderRadius.circular(10.r)
                            ),

                          )
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        DialogueBox(context);
                      },
                      child: Container(
                        width: 114.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: PrimaryColors.gradient1,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/box.svg',
                              height: 12.h,
                              width: 12.w,
                              color: PrimaryColors.whitetext,
                            ),
                            Text(
                              "Log Working Hours",
                              style: GoogleFonts.poppins(
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w400,
                                color: PrimaryColors.whitetext.withOpacity(1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )


                  ],
                ),
              ),
              Expanded(
                child: Container(
                    padding: EdgeInsets.all(12.w),
                    height:Get.height,
                    width:Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16.r),
                        bottomRight: Radius.circular(16.r),

                      ),
                      gradient: LinearGradient(
                        colors: [
                          PrimaryColors.gradient1,
                          PrimaryColors.gradient2
                        ], // Add your colors here
                        begin: Alignment.topRight,
                        end: Alignment.topLeft,
                      ),

                    ),
                    child: Container(
                      width:64.w,
                      height: 75.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Due Date", style: GoogleFonts.poppins(
                            //fontFamily: 'Alice-Regular',
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color:PrimaryColors.whitetext.withOpacity(1)
                          ),),

                          Text("05", style: GoogleFonts.poppins(
                            //fontFamily: 'Alice-Regular',
                              fontSize: 38.sp,
                              fontWeight: FontWeight.w500,
                              color:PrimaryColors.whitetext.withOpacity(1)
                          ),),

                          Text("March", style: GoogleFonts.poppins(
                            //fontFamily: 'Alice-Regular',
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color:PrimaryColors.whitetext.withOpacity(1)
                          ),),
                        ],
                      ),
                    )
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void DialogueBox(context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.symmetric(horizontal: 60.w),
          content: Container(
            alignment: Alignment.center,
            height: 171.h,
            width: 290.w,
            decoration: BoxDecoration(
                color: PrimaryColors.whitetext,
                borderRadius: BorderRadius.circular(10.r)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                GestureDetector(
                  onTap:(){
                    Get.back();
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: 20.w, top: 10.h),
                    alignment:Alignment.topRight,
                    child: Text(
                      "X",
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: PrimaryColors.background1.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                Text(
                  "You are Logging into",
                  style: GoogleFonts.poppins(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: PrimaryColors.background1,
                  ),
                ),
                SizedBox(height: 0.h),
                Text(
                  "Project # 3305",
                  style: GoogleFonts.poppins(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: PrimaryColors.background1,
                  ),
                ),
                SizedBox(height: 15.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: SettingButton(
                          width: 104, height: 35, whiteback: true, Iconwidth: 12,
                          Iconheight: 9, iconPath: 'assets/icons/left.svg', text: ' Back', backgroundColor: PrimaryColors.whitetext,)
                    ),

                    GestureDetector(
                        onTap: (){
                          Get.to(()=>ProjectStarted());
                        },
                        child: NavButton(
                          width: 118, height: 35, iconPath: 'assets/icons/box.svg', text: 'Continue',
                          backgroundColor: PrimaryColors.gradient1,)
                    ),
                  ],
                ),

                SizedBox(height: 15.h),
              ],
            ),
          ),
        );
      },
    );
  }
}

///Expenses list ...


class ExpensesList extends StatelessWidget {
  const ExpensesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      height: 80.h,
      width: 346.w,
      decoration: BoxDecoration(
        color: PrimaryColors.whitetext,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height:54.h,
            width:65.w,
            padding: EdgeInsets.all(10),
            decoration:BoxDecoration(
                color: PrimaryColors.gradient1.withOpacity(0.1),
                shape: BoxShape.circle
            ),
            child: SvgPicture.asset("assets/icons/tool.svg", color: PrimaryColors.gradient1.withOpacity(1),),
          ),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Text(

                    "You purchased a Hammer",
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: PrimaryColors.gradient2,
                    ),
                  ),
                ),

                Text(
                  "\$04.00",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: PrimaryColors.gradient2,
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(right: 10.w, top: 0.h),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "00:21",
                    style: GoogleFonts.poppins(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w400,
                      color: PrimaryColors.texttime,
                    ),
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


///Project Started Expenses list ...


class ProjectStartedExpensesList extends StatelessWidget {
  const ProjectStartedExpensesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      height: 80.h,
      width: 346.w,
      decoration: BoxDecoration(
        color: PrimaryColors.whitetext,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height:54.h,
            width:65.w,
            padding: EdgeInsets.all(10),
            decoration:BoxDecoration(
                color: PrimaryColors.gradient1.withOpacity(0.1),
                shape: BoxShape.circle
            ),
            child: SvgPicture.asset("assets/icons/tool.svg", color: PrimaryColors.gradient1.withOpacity(1),),
          ),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Text(

                    "You purchased a Hammer",
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: PrimaryColors.gradient2,
                    ),
                  ),
                ),

                Text(
                  "\$04.00",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: PrimaryColors.gradient2,
                  ),
                ),

                Text(
                  "Paid by:Self",
                  style: GoogleFonts.poppins(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: PrimaryColors.gradient2.withOpacity(0.7),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(right: 10.w, top: 0.h),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "00:21",
                    style: GoogleFonts.poppins(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w400,
                      color: PrimaryColors.texttime,
                    ),
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


///Notifications list ....

class NotificationsList extends StatelessWidget {
   NotificationsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left:20.w),
      margin: EdgeInsets.only(top: 0.h),
      height: 80.h,
      width: 390.w,
      decoration: BoxDecoration(
        color: PrimaryColors.whitetext,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height:54.h,
            width:65.w,
            padding: EdgeInsets.all(10),
            decoration:BoxDecoration(
                color: PrimaryColors.gradient1.withOpacity(0.1),
                shape: BoxShape.circle
            ),
            child: SvgPicture.asset("assets/icons/tool.svg", color: PrimaryColors.gradient1.withOpacity(1),),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left:10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Text(

                      "You started a project",
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: PrimaryColors.background1,
                      ),
                    ),
                  ),

                  Text(

                    "Tap to get more information",
                    style: GoogleFonts.poppins(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: PrimaryColors.background1,
                    ),
                  ),


                ],
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 10.w),
            height: Get.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 20.h,),
                Container(
                    width:18.w,
                    height: 10.h,
                    child: SvgPicture.asset("assets/icons/correct.svg", color: Colors.grey,)),
                Container(
                  margin: EdgeInsets.only(left: 10.w, bottom: 5.h),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "00:21",
                    style: GoogleFonts.poppins(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w400,
                      color: PrimaryColors.texttime,
                    ),
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










