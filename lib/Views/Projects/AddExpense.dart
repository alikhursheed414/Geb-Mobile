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

import '../../Widgets/constants.dart';

class AddExpense extends StatefulWidget {
  AddExpense({Key? key}) : super(key: key);

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool category = false;

  late TextEditingController _controller = TextEditingController();
  String? _selectedWord;

  List<String> _words = ["Tool bought", "Vendor Cost"];

  final TextEditingController _selectedCategoryController = TextEditingController();

  late Widget _categoryWidget;

  @override
  void initState() {
    super.initState();
    _selectedCategoryController.text = "Tool bought";
    _categoryWidget = ToolssBought();
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
                        onTap: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        child: SvgPicture.asset(
                          "assets/icons/profile.svg",
                          height: 23.h,
                          width: 23.w,
                        )),
                    Image.asset(
                      "assets/images/logo.png",
                      height: 60.h,
                      width: 75.65.w,
                    ),
                    GestureDetector(
                        onTap: () {
                          // Open drawer from the right
                          _scaffoldKey.currentState?.openEndDrawer();
                        },
                        child: Image.asset(
                          "assets/images/many.png",
                          height: 15.h,
                          width: 23.w,
                        )),
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 10.h,),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Add Expense",
                  style: GoogleFonts.poppins(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: PrimaryColors.background1,
                  ),
                ),
              ),
              SizedBox(height: 20.h,),
              ///Category
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Category",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: PrimaryColors.expensecolor,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0.r),
                        border: Border.all(
                          width: 1.w,
                          color: Colors.grey,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12,),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Choose Expense type',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: PrimaryColors.expensecolor1,
                          ),
                        ),
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: PrimaryColors.expensecolor1,
                        ),
                        value: _selectedWord,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedWord = newValue;
                            _controller.text = _selectedWord ?? '';
                            if (_selectedWord == "Tool bought") {
                              _categoryWidget = ToolssBought();
                              _selectedCategoryController.text = "Tool bought";
                            } else {
                              _categoryWidget = VendorCosts();
                              _selectedCategoryController.text = "Vendor Cost";
                            }
                          });
                        },
                        items: _words.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: PrimaryColors.gradient2,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 15.h,),
                    ///Code for the type 1 here ////
                    _categoryWidget,
                    ///Code for the type here ...
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              GestureDetector(
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        contentPadding: EdgeInsets.zero,
                        insetPadding: EdgeInsets.symmetric(horizontal: 80.w),
                        content: Container(
                          alignment: Alignment.center,
                          height: 150.h,
                          width: 240.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.r)
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
                                "Expense Added",
                                style: GoogleFonts.poppins(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: PrimaryColors.background1,
                                ),
                              ),
                              SizedBox(height: 0.h),
                              Text(
                                "\$40.00",
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: PrimaryColors.background1.withOpacity(0.6),
                                ),
                              ),
                              SizedBox(height: 15.h),

                              GestureDetector(
                                onTap: (){
                                  Get.back();
                                },
                                child: Container(
                                  width: 136.w,
                                  height: 35.h,
                                  decoration: BoxDecoration(
                                    color: PrimaryColors.gradient1,
                                    borderRadius: BorderRadius.circular(50.r)
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Ok",
                                      style: GoogleFonts.poppins(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        color: PrimaryColors.whitetext,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 15.h),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: SettingButton(
                  width: 155,
                  height: 37,
                  whiteback: false,
                  Iconwidth: 14,
                  Iconheight: 15,
                  iconPath: 'assets/icons/add.svg',
                  text: 'Add an Expense',
                  backgroundColor: PrimaryColors.gradient2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

