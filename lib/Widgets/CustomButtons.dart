import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geb_mobile_1/Widgets/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class NavButton extends StatelessWidget {
  final int height;
  final int width;
  final String iconPath;
  final String text;
  final Color backgroundColor;

  const NavButton({
    Key? key,
    required this.width,
    required this.height,
    required this.iconPath,
    required this.text,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 15.h,
            width: 15.w,
            color: PrimaryColors.whitetext,
          ),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 11.sp,
              fontWeight: FontWeight.w400,
              color: PrimaryColors.whitetext.withOpacity(1),
            ),
          ),
        ],
      ),
    );
  }
}


class SettingButton extends StatelessWidget {
  final int height;
  final bool whiteback;
  final int width;
  final String iconPath;
  final String text;
  final Color backgroundColor;
  final int Iconwidth;
  final int Iconheight;

  SettingButton({
    Key? key,
    required this.width,
    required this.height,
    required this.whiteback,
    required this.Iconwidth,
    required this.Iconheight,
    required this.iconPath,
    required this.text,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        color: whiteback ? Colors.white : backgroundColor,
        border: whiteback
            ? Border.all(width: 1, color: PrimaryColors.gradient2)
            : null,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 15.h,
            width: 15.w,
            color: whiteback ? PrimaryColors.gradient2 : PrimaryColors.whitetext,
          ),

          SizedBox(width: 5.w,),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: whiteback ? PrimaryColors.gradient2 : PrimaryColors.whitetext,
            ),
          ),
        ],
      ),
    );
  }
}
