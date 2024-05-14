
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geb_mobile_1/Views/Projects/Categories.dart';
import 'package:geb_mobile_1/Widgets/CustomButtons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../Widgets/ProjectHistoryList.dart';
import '../../Widgets/constants.dart';

class ProjectHistory extends StatefulWidget {
  ProjectHistory({Key? key}) : super(key: key);

  @override
  State<ProjectHistory> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<ProjectHistory> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  bool visible=true;

  void toggleVisibility() {
    setState(() {
      visible = !visible;
    });
  }



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(0.w),
          color: PrimaryColors.whitetext,
          height: Get.height,
          width: Get.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: (){
                            Scaffold.of(context).openDrawer();
                          },
                          child: SvgPicture.asset("assets/icons/profile.svg", height: 23.h,width: 23.w,)),
                      Image.asset("assets/images/logo.png",height: 60.h,width: 75.65.w,),
                      GestureDetector(
                          onTap: () {
                            // Open drawer from the right
                            Scaffold.of(context).openEndDrawer();
                          },
                          child: Image.asset("assets/images/many.png",height: 15.h,width: 23.w,)),

                    ],
                  ),
                ),
                Divider(),
                SizedBox(height: 10.h,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "User Timeline:",
                        style: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: PrimaryColors.background1,
                        ),
                      ),
            
                      GestureDetector(
                          onTap: (){
                            toggleVisibility();
                          },
                          child: Image.asset("assets/images/call2.png", height: 17.h, width: 17.w,color: PrimaryColors.expensecolor2.withOpacity(0.5),))
                    ],
                  )
                ),

                Visibility(
                  visible: !visible,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),

                    child: TableCalendar(
                      firstDay: DateTime.utc(2010, 1, 1),
                      lastDay: DateTime.utc(2030, 12, 31),
                      focusedDay: _focusedDay,
                      calendarFormat: CalendarFormat.month,
                      selectedDayPredicate: (day) {
                        // Use `selectedDayPredicate` to determine which day is currently selected.
                        // If this returns true, then `day` will be marked as selected.

                        // Using `isSameDay` is recommended to disregard the time-part of DateTime objects.
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        if (!isSameDay(_selectedDay, selectedDay)) {
                          // Call `setState()` when updating the selected day
                          setState(() {
                            _selectedDay = selectedDay;
                            _focusedDay = focusedDay; // update `_focusedDay` here as well
                          });
                        }
                      },
                      onPageChanged: (focusedDay) {
                        // No need to call `setState()` here unless you decide to change `_focusedDay`
                        _focusedDay = focusedDay;
                      },
                    ),
                  ),
                ),

                Visibility(
                  visible: visible,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 64.w,
                          height: 94.h,
                          decoration: BoxDecoration(
                            color: PrimaryColors.whitetext.withOpacity(0.3),
                          ),
                          child: Opacity(
                            opacity: 0.3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Sun",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: PrimaryColors.background1.withOpacity(0.5),
                                  ),
                                ),
                                Text(
                                  "3",
                                  style: GoogleFonts.poppins(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600,
                                    color: PrimaryColors.background1,
                                  ),
                                ),
                                Text(
                                  "March",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: PrimaryColors.background1.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),


                        Container(
                          width: 64.w,
                          height: 94.h,
                          decoration: BoxDecoration(
                            color: PrimaryColors.whitetext.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Opacity(
                            opacity: 0.6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Mon",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: PrimaryColors.background1.withOpacity(0.5),
                                  ),
                                ),

                                Text(
                                  "4",
                                  style: GoogleFonts.poppins(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600,
                                    color: PrimaryColors.background1,
                                  ),
                                ),

                                Text(
                                  "March",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: PrimaryColors.background1.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Container(
                          width: 64.w,
                          height: 94.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: PrimaryColors.gradient1.withOpacity(0.1),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Tue",
                                style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: PrimaryColors.background1.withOpacity(0.5),
                                ),
                              ),

                              Text(
                                "5",
                                style: GoogleFonts.poppins(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                  color: PrimaryColors.gradient2,
                                ),
                              ),

                              Text(
                                "March",
                                style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: PrimaryColors.background1.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width: 64.w,
                          height: 94.h,
                          decoration: BoxDecoration(
                            color: PrimaryColors.whitetext.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Opacity(
                            opacity: 0.6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Wed",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: PrimaryColors.background1.withOpacity(0.5),
                                  ),
                                ),

                                Text(
                                  "6",
                                  style: GoogleFonts.poppins(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600,
                                    color: PrimaryColors.background1,
                                  ),
                                ),

                                Text(
                                  "March",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: PrimaryColors.background1.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Container(
                          width: 64.w,
                          height: 94.h,
                          decoration: BoxDecoration(
                            color: PrimaryColors.whitetext.withOpacity(0.3),
                          ),
                          child: Opacity(
                            opacity: 0.3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Thurs",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: PrimaryColors.background1.withOpacity(0.5),
                                  ),
                                ),
                                Text(
                                  "7",
                                  style: GoogleFonts.poppins(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600,
                                    color: PrimaryColors.background1,
                                  ),
                                ),
                                Text(
                                  "March",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: PrimaryColors.background1.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
            
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h,),
            
                      PorjectHistoryPurchaseList("You purchased a Hammer", "\$40.00"),
            
                      SizedBox(height: 10.h,),
            
                      PorjectHistoryTaskList("Project \#3456 started."),
            
                      SizedBox(height: 10.h,),
            
                      PorjectHistoryPurchaseList("Vendor delivered the tools", "\$40.00"),
            
                      SizedBox(height: 10.h,),
            
                      PorjectHistoryTaskList("You logged out of the project \#4456."),
            
                      SizedBox(height: 10.h,),
            
                      PorjectHistoryTaskList("Project \#3456 completed."),
            
                      SizedBox(height: 10.h,),
            
                      PorjectHistoryPurchaseList("You purchased a Hammer", "\$40.00"),
            
                      SizedBox(height: 10.h,),
            
                      PorjectHistoryTaskList("Project \#3456 started."),
            
                      SizedBox(height: 10.h,),
            
                      PorjectHistoryPurchaseList("Vendor delivered the tools", "\$40.00"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

