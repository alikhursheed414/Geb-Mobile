import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geb_mobile_1/Widgets/NotificationServices.dart';
import 'package:geb_mobile_1/Widgets/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Widgets/CustomButtons.dart';
import '../../Widgets/Drawers.dart';
import '../../Widgets/HomePageList.dart';

class HomePage extends StatefulWidget {
  final Function(BuildContext) openDrawer;
  final Function(BuildContext) openEndDrawer;


   HomePage(
      {
        required this.openDrawer,
        required this.openEndDrawer
      });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  NotificationServices notificationServices=NotificationServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    notificationServices.requestNotificationpermission();
    //notificationServices.isTokenrefresh();
    notificationServices.getDevicetoken().then((value) {
      print("Device token");
      notificationServices.UpdateFirebase(value!);
      print(value);
    });



    //notificationServices.isTokenrefresh();

    notificationServices.firebaseInit();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColors.whitetext,
      key: _scaffoldKey,
      body: Container(
        width: Get.width,
        height: Get.height,
        color: PrimaryColors.whitetext,
        padding: EdgeInsets.all(21.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
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

              Container(
                margin: EdgeInsets.only(left: 3.w, right: 3.w, top: 20.h),
                height: 84.h,
                width: 340.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  children: [
                    Container(
                      height:80.h,
                      width: 204.w,
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

                      child: Padding(
                        padding: EdgeInsets.only(left:28.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Hello ", style: GoogleFonts.poppins(
                                  //fontFamily: 'Alice-Regular',
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                    color:PrimaryColors.gradient2
                                ),),
                                Text("Danyel!", style: GoogleFonts.poppins(
                                  //fontFamily: 'Alice-Regular',
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                    color:PrimaryColors.gradient1
                                ),),

                                SvgPicture.asset("assets/icons/hand.svg", height: 16.01.sp,width: 16.01,)
                              ],
                            ),
                            Text("Let\'s see what\'s up today", style: GoogleFonts.roboto(
                              //fontFamily: 'Alice-Regular',
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                color:PrimaryColors.background1.withOpacity(0.3)
                            ),),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.only(left:12.w),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("03:20:50", style: GoogleFonts.poppins(
                                    //fontFamily: 'Alice-Regular',
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w400,
                                      color:PrimaryColors.whitetext.withOpacity(1)
                                  ),),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5.h),
                                    child: Text(" PM", style: GoogleFonts.poppins(
                                      //fontFamily: 'Alice-Regular',
                                        fontSize:12.sp,
                                        fontWeight: FontWeight.w400,
                                        color:PrimaryColors.whitetext.withOpacity(1)
                                    ),),
                                  ),
                                ],
                              ),

                              Text("Monday", style: GoogleFonts.poppins(
                                //fontFamily: 'Alice-Regular',
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color:PrimaryColors.whitetext.withOpacity(1)
                              ),),

                              Text("February 21, 2022", style: GoogleFonts.poppins(
                                //fontFamily: 'Alice-Regular',
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w400,
                                  color:PrimaryColors.whitetext.withOpacity(1)
                              ),),
                            ],
                          )
                      ),
                    )
                  ],
                ),
              ),


              SizedBox(height: 20.h,),

              ///Work percentage counter here ...


              Container(
                width: 169,
                height: 169,
                decoration: BoxDecoration(
                    color: PrimaryColors.whitetext,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: PrimaryColors.background1.withOpacity(0.20),
                        blurRadius: 1.r,spreadRadius: 0.2,
                      ),
                    ],
                    border: Border.all(
                        width: 22,
                        color: PrimaryColors.whitetext
                    )
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
                              blurRadius: 1.r,spreadRadius: 0.2,
                            ),
                          ],
                          color: PrimaryColors.whitetext,
                          shape: BoxShape.circle,
                        ),
                        child:  Container(
                          child: CircularProgressIndicator(
                            strokeWidth: 25, // Adjust the thickness of the progress indicator
                            value: 0.4, // Adjust the progress value between 0 and 1
                            valueColor: AlwaysStoppedAnimation<Color>(PrimaryColors.gradient1), // Change the color of the progress indicator
                            backgroundColor: PrimaryColors.inactivecircularindicator, // Change the background color of the progress indicator
                            semanticsLabel: 'Circular progress indicator', // Optional label for accessibility
                            semanticsValue: '40%',
                            strokeCap: StrokeCap.round,// Optional value for accessibility
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("40 Hours", style: GoogleFonts.poppins(
                            //fontFamily: 'Alice-Regular',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color:PrimaryColors.background1.withOpacity(0.8)
                          ),),
                          Text("Worked", style: GoogleFonts.roboto(
                            //fontFamily: 'Alice-Regular',
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w400,
                              color:PrimaryColors.background1.withOpacity(0.5)
                          ),),
                        ],
                      ),
                    ),

                  ],
                ),
              ),


              ///Buttons Row...


              Container(
                margin: EdgeInsets.only(left: 10.w, right:10.w, top: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NavButton(
                      iconPath: 'assets/icons/box.svg',
                      text: 'Log Working Hours',
                      backgroundColor: PrimaryColors.gradient1, width: 155, height: 37,
                    ),

                    NavButton(
                      iconPath: 'assets/icons/add.svg',
                      text: 'Add an expense',
                      backgroundColor: PrimaryColors.gradient2, width: 155, height: 37,
                    )

                  ],
                ),
              ),


              ///Recents Row ...

              Container(
                width: 340.w,
                margin: EdgeInsets.only(top: 20.h),
                padding: EdgeInsets.all(5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Recents", style: GoogleFonts.poppins(
                      //fontFamily: 'Alice-Regular',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color:PrimaryColors.background1.withOpacity(0.8)
                    ),),
                    Text("View all", style: GoogleFonts.poppins(
                      //fontFamily: 'Alice-Regular',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color:PrimaryColors.gradient2.withOpacity(1),
                        decoration:TextDecoration.underline
                    )
                      ,),
                  ],
                ),
              ),


              ///List here ...

              HomeRecentList(),

              HomeRecentList(),

              HomeRecentList(),





            ],
          ),
        ),
      ),
    );


  }
}
