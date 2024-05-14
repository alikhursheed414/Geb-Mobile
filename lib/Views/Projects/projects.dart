import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geb_mobile_1/Widgets/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Widgets/CustomButtons.dart';
import '../../Widgets/HomePageList.dart';
import 'ProjectDetails.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {

  TextEditingController search= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        color: PrimaryColors.whitetext,
        padding: EdgeInsets.only(left:21.w, right:21.w, top: 21.h),
        child: SingleChildScrollView(
          child: Column(
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


             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                 Container(
                   width: 299.w,
                   height: 40.h,
                   margin: EdgeInsets.only(top: 20.h),
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(50.r),
                     boxShadow: [
                       BoxShadow(
                         color: Colors.black.withOpacity(0.1),
                         spreadRadius: 0,
                         blurRadius: 4,
                         offset: Offset(0, 0), // changes position of shadow
                       ),
                     ],
                   ),
                   child: Center(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Expanded(
                           child: Padding(
                             padding:EdgeInsets.only(bottom: 5.h, left: 10.w),
                             child: TextFormField(
                               controller: search,
                               style: GoogleFonts.poppins(
                                 //fontFamily: 'Alice-Regular',
                                   fontSize: 12.sp,
                                   fontWeight: FontWeight.w400,
                                   color:PrimaryColors.background1.withOpacity(0.5)
                               ),
                               decoration: InputDecoration(
                                 hintText: "Search Projects",
                                 hintStyle: GoogleFonts.poppins(
                                   //fontFamily: 'Alice-Regular',
                                     fontSize: 12.sp,
                                     fontWeight: FontWeight.w400,
                                     color:PrimaryColors.background1.withOpacity(0.5)
                                 ),
                                 border: InputBorder.none,
                                 contentPadding: EdgeInsets.all(10),
                               ),
                             ),
                           ),
                         ),
                         Padding(
                           padding: EdgeInsets.only(right: 12.w),
                           child: SvgPicture.asset(
                             'assets/icons/search.svg',
                             height: 10.92.h,
                             width: 10.92.w,
                             color: PrimaryColors.background1.withOpacity(0.5),
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),

                 Container(
                   height: 35.h,
                   width: 35.w,
                   alignment: Alignment.center,
                   padding: EdgeInsets.all(7.w),
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     color: PrimaryColors.gradient2
                   ),
                   child: SvgPicture.asset("assets/icons/others.svg", height: 14.63.h,width: 13.w,),
                 ),



               ],
             ),


              Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        margin: EdgeInsets.only(top: 20.h),
                        child: Text("Your Projects: ", style: GoogleFonts.poppins(
                          //fontFamily: 'Alice-Regular',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color:PrimaryColors.background1
                        ),),
                      ),

                      GestureDetector(
                          onTap: (){
                            Get.to(()=>ProjectDetails());
                          },
                          child: ProjectsList()),

                      GestureDetector(
                          onTap: (){
                            Get.to(()=>ProjectDetails());
                          },
                          child: ProjectsList()),

                      GestureDetector(
                          onTap: (){
                            Get.to(()=>ProjectDetails());
                          },
                          child: ProjectsList()),

                      GestureDetector(
                          onTap: (){
                            Get.to(()=>ProjectDetails());
                          },
                          child: ProjectsList()),

                      GestureDetector(
                          onTap: (){
                            Get.to(()=>ProjectDetails());
                          },
                          child: ProjectsList()),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
