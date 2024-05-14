import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geb_mobile_1/Controllers/AuthController.dart';
import 'package:geb_mobile_1/Widgets/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Views/Projects/ProfileSettings.dart';
import '../Views/Authentication/login.dart';
import 'ShareedPreferences.dart';

class RightSideDrawer extends StatefulWidget {
  const RightSideDrawer({Key? key}) : super(key: key);

  @override
  State<RightSideDrawer> createState() => _RightSideDrawerState();
}

class _RightSideDrawerState extends State<RightSideDrawer> {
  late User _currentUser;
  late Map<String, dynamic> _userData = {};



  Future<void> _fetchUserData() async {
    try {
      // Get a Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Query the users collection
      QuerySnapshot querySnapshot = await firestore
          .collection('users')
          .where('userId', isEqualTo: _currentUser.uid)
          .limit(1)
          .get();

      // Get the user data
      if (querySnapshot.docs.isNotEmpty) {
        _userData = querySnapshot.docs.first.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print('Failed to fetch user data: $e');
    }
    setState(() {});
  }



  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }


  @override
  void initState() {
    super.initState();
    _currentUser = FirebaseAuth.instance.currentUser!;
    _fetchUserData();
  }


  @override
  Widget build(BuildContext context) {
    var authController=Get.put(AuthController());
    return Drawer(
      backgroundColor: PrimaryColors.whitetext,
      child: Container(
        height: Get.height,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: Get.height,
                  width: Get.width,
                  color: PrimaryColors.whitetext,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Header of the Drawer
                      Material(
                        color: PrimaryColors.whitetext,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              alignment:Alignment.topRight,
                              padding: EdgeInsets.only(left:15.w, right: 15.w, top: 20.h, bottom: 10.h),
                              child: GestureDetector(
                                  onTap: (){
                                    Get.back();
                                  },
                                  child: SvgPicture.asset("assets/icons/cross.svg")),
                            ),

                          ],
                        ),
                      ),

                      /// Header Menu items
                      Container(
                        width:249.w,
                        height: 74.h,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _userData['imageUrl'] == null || _userData['imageUrl'] == ""
                                ? Container(
                                margin: EdgeInsets.only(left: 10.w, right: 10.w),
                                width: 52.w,
                                height: 53.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle
                                ),
                                child: Image.asset("assets/images/profile.png")):
                            Container(
                                margin: EdgeInsets.only(left: 10.w, right: 10.w),
                                width: 52.w,
                                height: 53.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.r),
                                  child: Image.network(
                                    _userData['imageUrl']! ,height: 53.h,width: 52.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _userData['userName'] ?? "Username",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: PrimaryColors.background1,
                                  ),
                                ),

                                Text(
                                  "Employee",
                                  style: GoogleFonts.poppins(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    color: PrimaryColors.background1.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),

                      ///List starts here ...

                      SizedBox(height: 20.h,),

                      Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: PrimaryColors.gradient2.withOpacity(0.2)
                                  )
                              )
                          ),
                          padding: EdgeInsets.only(left: 30.w, top: 20.h, bottom: 20.h),
                          width: 292.w,
                          height: 68.h,
                          child: Row(
                            children: [
                              Image.asset("assets/images/home.png",height:24.h, width: 24.w,),

                              SizedBox(width: 20.w,),

                              Text(
                                "Home",
                                style: GoogleFonts.poppins(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: PrimaryColors.background1,
                                ),
                              ),
                            ],
                          )
                      ),

                      Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: PrimaryColors.gradient2.withOpacity(0.2)
                                  )
                              )
                          ),
                          padding: EdgeInsets.only(left: 30.w, top: 20.h, bottom: 20.h),
                          width: 292.w,
                          height: 68.h,
                          child: Row(
                            children: [
                              Image.asset("assets/images/project.png", color: PrimaryColors.gradient2,height: 24.h, width: 24.w,),

                              SizedBox(width: 20.w,),

                              Text(
                                "Projects",
                                style: GoogleFonts.poppins(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: PrimaryColors.background1,
                                ),
                              ),
                            ],
                          )
                      ),

                      Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: PrimaryColors.gradient2.withOpacity(0.2)
                                  )
                              )
                          ),
                          padding: EdgeInsets.only(left: 30.w, top: 20.h, bottom: 20.h),
                          width: 292.w,
                          height: 68.h,
                          child: Row(
                            children: [
                              Image.asset("assets/images/notify.png",height:24.h, width: 24.w,),
                              SizedBox(width: 20.w,),

                              Text(
                                "Notifications",
                                style: GoogleFonts.poppins(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: PrimaryColors.background1,
                                ),
                              ),
                            ],
                          )
                      ),

                      GestureDetector(
                        onTap: (){
                          Get.to(()=>ProfileSetting());
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: PrimaryColors.gradient2.withOpacity(0.2)
                                    )
                                )
                            ),
                            padding: EdgeInsets.only(left: 30.w, top: 20.h, bottom: 20.h),
                            width: 292.w,
                            height: 68.h,
                            child: Row(
                              children: [
                                Image.asset("assets/images/setting.png", color: PrimaryColors.gradient2,height: 24.h, width: 24.w,),

                                SizedBox(width: 20.w,),

                                Text(
                                  "Settings",
                                  style: GoogleFonts.poppins(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: PrimaryColors.background1,
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),

                      Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: PrimaryColors.gradient2.withOpacity(0.2)
                                  )
                              )
                          ),
                          padding: EdgeInsets.only(left: 30.w, top: 20.h, bottom: 20.h),
                          width: 292.w,
                          height: 68.h,
                          child: Row(
                            children: [
                              Image.asset("assets/images/privacy.png", color: PrimaryColors.gradient2,height: 24.h, width: 24.w,),

                              SizedBox(width: 20.w,),

                              Text(
                                "Privacy",
                                style: GoogleFonts.poppins(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: PrimaryColors.background1,
                                ),
                              ),
                            ],
                          )
                      ),

                      Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: PrimaryColors.gradient2.withOpacity(0.2)
                                  )
                              )
                          ),
                          padding: EdgeInsets.only(left: 30.w, top: 20.h, bottom: 20.h),
                          width: 292.w,
                          height: 68.h,
                          child: Row(
                            children: [
                              Image.asset("assets/images/terms.png",height:24.h, width: 24.w, color: PrimaryColors.gradient2,),

                              SizedBox(width: 20.w,),

                              Text(
                                "Terms & Conditions",
                                style: GoogleFonts.poppins(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: PrimaryColors.background1,
                                ),
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: Get.width,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                height: 68.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Image.asset("assets/images/logout.png", height: 24.h, width: 24.w,)),

                    GestureDetector(
                      onTap: () async {
                        MySharedPreferences.setLoggedIn(false);
                        authController.signOut();
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 0.h, right: 0.w),
                        child: Text("Log Out", style: GoogleFonts.poppins(
                          //fontFamily: 'Alice-Regular',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color:PrimaryColors.background1.withOpacity(1)
                        ),),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}


class ProfileDrawerScreen extends StatefulWidget {
  const ProfileDrawerScreen({Key? key}) : super(key: key);

  @override
  State<ProfileDrawerScreen> createState() => _ProfileDrawerScreenState();
}

class _ProfileDrawerScreenState extends State<ProfileDrawerScreen> {

  late User _currentUser;
  late Map<String, dynamic> _userData = {};

  @override
  void initState() {
    super.initState();
    _currentUser = FirebaseAuth.instance.currentUser!;
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      // Get a Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Query the users collection
      QuerySnapshot querySnapshot = await firestore
          .collection('users')
          .where('userId', isEqualTo: _currentUser.uid)
          .limit(1)
          .get();

      // Get the user data
      if (querySnapshot.docs.isNotEmpty) {
        _userData = querySnapshot.docs.first.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print('Failed to fetch user data: $e');
    }
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: PrimaryColors.whitetext,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// Header of the Drawer
            Material(
              color: PrimaryColors.whitetext,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left:15.w, right: 15.w, top: 20.h, bottom: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My Profile: ",
                          style: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: PrimaryColors.background1,
                          ),
                        ),

                        GestureDetector(
                            onTap: (){
                              Get.back();
                            },
                            child: SvgPicture.asset("assets/icons/cross.svg"))
                      ],
                    ),
                  ),

                  Divider()
                ],
              ),
            ),

            /// Header Menu items
            Container(
              height: Get.height,
              color: PrimaryColors.whitetext,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 // _userData['imageUrl'] =="" ?  Container(
                 //     margin: EdgeInsets.only(top: 30.h),
                 //     width: 136.w,
                 //     height: 139.h,
                 //     decoration: BoxDecoration(
                 //         shape: BoxShape.circle,
                 //             color:PrimaryColors.gradient1,
                 //     ),
                 //     child: Center(child: Text("Upload Picture",
                 //       style: GoogleFonts.poppins(
                 //       color:PrimaryColors.whitetext,
                 //         fontWeight:FontWeight.w400,
                 //         fontSize:12.sp,
                 //     ),))):
                  _userData['imageUrl'] == null || _userData['imageUrl'] == ""
                      ? Container(
                     margin: EdgeInsets.only(top: 30.h),
                     width: 136.w,
                     height: 139.h,
                     decoration: BoxDecoration(
                         shape: BoxShape.circle
                     ),
                     child: Image.asset("assets/images/profile.png")) :
                 Container(
                     margin: EdgeInsets.only(top: 30.h),
                     width: 136.w,
                     height: 139.h,
                     decoration: BoxDecoration(
                         shape: BoxShape.circle
                     ),
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(100.r),
                       child: Image.network(
                         _userData['imageUrl'],height: 53.h,width: 52.w,
                         fit: BoxFit.cover,
                       ),
                     )),

                  Container(
                    margin: EdgeInsets.only(top:20.h),
                    child: Text(
                      _userData['userName'] ?? "Username",
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: PrimaryColors.background1,
                      ),
                    ),
                  ),

                  ///Rate here

                  Container(
                    margin: EdgeInsets.only(top:20.h),
                    child: Text(
                      "${_userData['userRate']}/Hr",
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

                              Container(
                                width: 187.w,
                                height: 48.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0,
                                      blurRadius: 4,
                                      offset: Offset(0, 0), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                                  child: TextFormField(
                                    enabled: false,
                                    style: GoogleFonts.poppins(
                                      //fontFamily: 'Alice-Regular',
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w400,
                                        color:PrimaryColors.drawercolor1
                                    ),
                                    decoration: InputDecoration(
                                      hintStyle: GoogleFonts.poppins(
                                        //fontFamily: 'Alice-Regular',
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                          color:PrimaryColors.drawercolor1
                                      ),
                                      hintText: _userData['userName'] ?? "Username",
                                      border: InputBorder.none,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

                              Container(
                                width: 187.w,
                                height: 48.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0,
                                      blurRadius: 4,
                                      offset: Offset(0, 0), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                                  child: TextFormField(
                                    enabled: false,
                                    keyboardType: TextInputType.text,
                                    style: GoogleFonts.poppins(
                                      //fontFamily: 'Alice-Regular',
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w400,
                                        color:PrimaryColors.drawercolor1
                                    ),
                                    decoration: InputDecoration(
                                      hintStyle: GoogleFonts.poppins(
                                        //fontFamily: 'Alice-Regular',
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                          color:PrimaryColors.drawercolor1
                                      ),
                                      hintText: _userData['userEmail'] ?? "UserEmail",
                                      border: InputBorder.none,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

                              Container(
                                width: 187.w,
                                height: 48.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0,
                                      blurRadius: 4,
                                      offset: Offset(0, 0), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                                  child: TextFormField(
                                    enabled: false,
                                    keyboardType: TextInputType.text,
                                    style: GoogleFonts.poppins(
                                      //fontFamily: 'Alice-Regular',
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w400,
                                        color:PrimaryColors.drawercolor1
                                    ),
                                    decoration: InputDecoration(
                                      hintStyle: GoogleFonts.poppins(
                                        //fontFamily: 'Alice-Regular',
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                          color:PrimaryColors.drawercolor1
                                      ),
                                      hintText: _userData['phoneNumber'] ?? "User number",
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
