import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geb_mobile_1/Controllers/AuthController.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class AuthenticationField extends StatefulWidget {

  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool isPassword;

  AuthenticationField({
    required this.icon,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    Key? key,
  }) : super(key: key);

  @override
  State<AuthenticationField> createState() => _AuthenticationFieldState();
}

class _AuthenticationFieldState extends State<AuthenticationField> {
  var authController=Get.put(AuthController());
  var _hidden = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      _hidden = widget.isPassword;
    });
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: GoogleFonts.roboto(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: PrimaryColors.whitetext.withOpacity(0.6),
      ),
      obscureText: _hidden,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 10, top: 10),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white, // Change the color here
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white, // Change the color here
          ),
        ),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.roboto(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: PrimaryColors.whitetext.withOpacity(0.6),
        ),
        suffixIcon: widget.isPassword
                  ? IconButton(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 0.sp),
                  child:
                  !_hidden ?
                  Icon(
                    Icons.visibility,
                    size: 14.h,
                    color: Colors.white,
                  ):
                  Icon(
                    Icons.visibility_off,
                    size: 14.h,
                    color: Colors.white,
                  ),
                  ),

                onPressed: () {
                setState(() {
                  _hidden = !_hidden;
                });
                  },
              )
            : Icon(
          widget.icon,
          color: PrimaryColors.whitetext,
          size: 10.sp,
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please ${widget.hintText}';
        }
        return null;
      },
    );
  }
}
