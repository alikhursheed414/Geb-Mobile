import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geb_mobile_1/Widgets/HomePageList.dart';
import 'package:geb_mobile_1/Views/Projects/LogWorkingHours.dart';
import 'package:geb_mobile_1/Widgets/constants.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'AddExpense.dart';
import '../../Widgets/CustomButtons.dart';


class ProjectStarted extends StatefulWidget {
  const ProjectStarted({Key? key}) : super(key: key);

  @override
  State<ProjectStarted> createState() => _ProjectStartedState();
}

class _ProjectStartedState extends State<ProjectStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                          Scaffold.of(context).openDrawer();
                        } ,
                        child: SvgPicture.asset(
                          "assets/icons/profile.svg",
                          height: 23.h,
                          width: 23.w,
                        ),
                      ),
                      Image.asset(
                        "assets/images/logo.png",
                        height: 60.h,
                        width: 75.65.w,
                      ),
                      GestureDetector(
                        onTap:(){
                          Scaffold.of(context).openEndDrawer();
                        },
                        child: Image.asset(
                          "assets/images/many.png",
                          height: 15.h,
                          width: 23.w,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.h),
                  child: Divider(
                    height: 1.h,
                    color: PrimaryColors.background1.withOpacity(0.09),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 22.w, right: 22.w, top: 21.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Project Details: ",
                        style: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: PrimaryColors.background1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Wokring Site: ",
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: PrimaryColors.text500,
                            ),
                          ),
                          Text(
                            "Selveston Road, Chicago",
                            style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: PrimaryColors.background1.withOpacity(0.4),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Project Deadline: ",
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: PrimaryColors.text500,
                            ),
                          ),
                          Text(
                            "22nd Jan, 2025",
                            style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: PrimaryColors.background1.withOpacity(0.4),
                            ),
                          ),
                          Text(
                            " (Due in 3 days)",
                            style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.red.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
        
                      ///Percentage and two buttons here ...
                      Container(
                        margin: EdgeInsets.only(top: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 169,
                              height: 169,
                              decoration: BoxDecoration(
                                color: PrimaryColors.whitetext,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: PrimaryColors.background1.withOpacity(0.20),
                                    blurRadius: 1.r,
                                    spreadRadius: 0.2,
                                  ),
                                ],
                                border: Border.all(
                                  width: 22,
                                  color: PrimaryColors.whitetext,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Container(
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: PrimaryColors.background1.withOpacity(0.20),
                                            blurRadius: 1.r,
                                            spreadRadius: 0.2,
                                          ),
                                        ],
                                        color: PrimaryColors.whitetext,
                                        shape: BoxShape.circle,
                                      ),
                                      child: CircularProgressIndicator(
                                        strokeWidth: 25,
                                        value: 0.4,
                                        valueColor: AlwaysStoppedAnimation<Color>(PrimaryColors.gradient1),
                                        backgroundColor: PrimaryColors.inactivecircularindicator,
                                        semanticsLabel: 'Circular progress indicator',
                                        semanticsValue: '40%',
                                        strokeCap: StrokeCap.round,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "40 Hours",
                                          style: GoogleFonts.poppins(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                            color: PrimaryColors.background1.withOpacity(0.8),
                                          ),
                                        ),
                                        Text(
                                          "Worked",
                                          style: GoogleFonts.roboto(
                                            fontSize: 9.sp,
                                            fontWeight: FontWeight.w400,
                                            color: PrimaryColors.background1.withOpacity(0.5),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 155.w,
                                  height: 37.h,
                                  decoration: BoxDecoration(
                                    color: PrimaryColors.pauseButton,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/pause.svg",
                                        height: 17.h,
                                        width: 17.w,
                                        color: PrimaryColors.whitetext,
                                      ),
        
                                      SizedBox(width: 5.w,),
                                      Text(
                                        " Pause Project",
                                        style: GoogleFonts.poppins(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                          color: PrimaryColors.whitetext,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                NavButton(
                                  iconPath: 'assets/icons/add.svg',
                                  text: 'Add an expense',
                                  backgroundColor: PrimaryColors.gradient2,
                                  width: 155,
                                  height: 37,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
        
                      Container(
                        margin: EdgeInsets.only(top: 20.h),
                        child: Text(
                          "Your Expenses",
                          style: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: PrimaryColors.background1.withOpacity(1),
                          ),
                        ),
                      ),
        
                      Container(
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.only(top: 20.h),
                        child: Text(
                          "Today",
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: PrimaryColors.background1.withOpacity(0.5),
                          ),
                        ),
                      ),
        
                      ///List here ....
        
                      ProjectStartedExpensesList(),
        
                      ProjectStartedExpensesList(),
        
                      Container(
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.only(top: 20.h),
                        child: Text(
                          "Yesterday",
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: PrimaryColors.background1.withOpacity(0.5),
                          ),
                        ),
                      ),
        
        
                      ProjectStartedExpensesList(),
        
                      ProjectStartedExpensesList(),
        
                      ProjectStartedExpensesList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
