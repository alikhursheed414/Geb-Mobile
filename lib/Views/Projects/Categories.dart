import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Widgets/constants.dart';

class ToolssBought extends StatefulWidget {
  const ToolssBought({Key? key}) : super(key: key);

  @override
  State<ToolssBought> createState() => _ToolssBoughtState();
}

class _ToolssBoughtState extends State<ToolssBought> {

  bool _isExpanded = false;


  String? selectedpayment;


  // final List<String> _words = ['Nayapay', 'Sadapay', 'MasterCard', 'Credit card', ];

  late TextEditingController _controller=TextEditingController();
  String? _selectedWord;

  List<String> _words=[
    "Tool bought",
    "Vendor Cost"
  ];

  List<String> expensetypesvg=[
    "assets/icons/tool.svg",
    "assets/icons/tool.svg",
  ];

  late TextEditingController _paidcontroller=TextEditingController();
  String? _selectedpaid;

  List<String> _paidby=[
    "Self",
    "Company"
  ];


  late TextEditingController _paymentcontroller=TextEditingController();
  String? _selectedmethod;

  List<String> _paymentethodList=[
    "Nayapay",
    "Sadaypay",
    "MasterCard",
    "Meezan Bank",

  ];

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Expense",
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: PrimaryColors.expensecolor,
              ),
            ),
          ),

          SizedBox(height: 5.h,),

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
            child: TextFormField(
              keyboardType: TextInputType.phone,
              style: GoogleFonts.poppins(
                //fontFamily: 'Alice-Regular',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color:PrimaryColors.drawercolor1.withOpacity(0.6)
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 15.w, bottom: 10.h),
                hintStyle: GoogleFonts.poppins(
                  //fontFamily: 'Alice-Regular',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color:PrimaryColors.drawercolor1.withOpacity(0.6)
                ),
                hintText: "Enter Amount",
                border: InputBorder.none,
              ),
            ),
          ),

          ///Paid By ....

          SizedBox(height: 15.h,),

          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Paid By",
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
              isExpanded: true, // Add this line to expand the dropdown menu
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Paid By',
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
              value: _selectedpaid,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedpaid = newValue;
                  _paidcontroller = (_selectedpaid ?? '') as TextEditingController;
                });
              },
              items: _paidby.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: PrimaryColors.gradient2,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),


          ///Payment Method ....


          SizedBox(height: 15.h,),



          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Payment Method",
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
              isExpanded: true, // Add this line to expand the dropdown menu
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Payment method',
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
              value: _selectedmethod,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedmethod = newValue ;
                  _paymentcontroller = (_selectedmethod ?? '') as TextEditingController;
                });
              },
              items: _paymentethodList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: PrimaryColors.gradient2,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),


          ///Attach Invoice


          SizedBox(height: 15.h,),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Attach Invoice",
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: PrimaryColors.expensecolor,
              ),
            ),
          ),
          SizedBox(height: 10.h,),
          Container(
            height: 89.h,
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0.r),
              border: Border.all(
                width: 1.w,
                color: Colors.grey,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/upload.svg"),
                Text(
                  "Upload Image",
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: PrimaryColors.gradient2,
                  ),
                ),

                SizedBox(height: 5.h,),
                Text(
                  "PNG or JPG < 200KB",
                  style: GoogleFonts.poppins(
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w400,
                    color: PrimaryColors.expensecolor2,
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}






















///////////////////////////////////////////////////////////////////////////////////










class VendorCosts extends StatefulWidget {
  const VendorCosts({Key? key}) : super(key: key);

  @override
  State<VendorCosts> createState() => _VendorCostsState();
}

class _VendorCostsState extends State<VendorCosts> {

  late TextEditingController expenseConstroller=TextEditingController();
  late TextEditingController taskCondtroller=TextEditingController();


  // final List<String> _words = ['Nayapay', 'Sadapay', 'MasterCard', 'Credit card', ];



  late TextEditingController _vendorController=TextEditingController();
  String? _selectedvencdor;

  List<String> _vendorsList=[
    "Vendor1",
    "Vendor2",
    "Vendor3",
    "Vendor4"
  ];



  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: Column(
        children: [

          ///Choose vendor....



          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Choose Vendor",
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
              isExpanded: true, // Add this line to expand the dropdown menu
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Choose vendor',
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
              value: _selectedvencdor,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedvencdor = newValue;
                  _vendorController = (_selectedvencdor ?? '') as TextEditingController;
                });
              },
              items: _vendorsList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: PrimaryColors.gradient2,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          SizedBox(height: 15.h,),

          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Expense",
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: PrimaryColors.expensecolor,
              ),
            ),
          ),

          SizedBox(height: 5.h,),

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
            child: TextFormField(
              controller: expenseConstroller,
              keyboardType: TextInputType.phone,
              style: GoogleFonts.poppins(
                //fontFamily: 'Alice-Regular',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color:PrimaryColors.drawercolor1.withOpacity(0.6)
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 15.w, bottom: 10.h),
                hintStyle: GoogleFonts.poppins(
                  //fontFamily: 'Alice-Regular',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color:PrimaryColors.drawercolor1.withOpacity(0.6)
                ),
                hintText: "Enter Amount",
                border: InputBorder.none,
              ),
            ),
          ),



          ///Task Details ...
          SizedBox(height: 15.h,),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Task",
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: PrimaryColors.expensecolor,
              ),
            ),
          ),

          SizedBox(height: 5.h,),

          Container(
            height: 62.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0.r),
              border: Border.all(
                width: 1.w,
                color: Colors.grey,
              ),
            ),
            child: TextFormField(
              controller: taskCondtroller,
              keyboardType: TextInputType.phone,
              style: GoogleFonts.poppins(
                //fontFamily: 'Alice-Regular',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color:PrimaryColors.drawercolor1.withOpacity(0.6)
              ),
              maxLines: 2,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 15.w, bottom: 10.h),
                hintStyle: GoogleFonts.poppins(
                  //fontFamily: 'Alice-Regular',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color:PrimaryColors.drawercolor1.withOpacity(0.6)
                ),
                hintText: "Task Details",
                border: InputBorder.none,
              ),
            ),
          ),



          ///Attach Invoice


          SizedBox(height: 15.h,),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Attach Invoice",
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: PrimaryColors.expensecolor,
              ),
            ),
          ),
          SizedBox(height: 10.h,),
          Container(
            height: 89.h,
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0.r),
              border: Border.all(
                width: 1.w,
                color: Colors.grey,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/upload.svg"),
                Text(
                  "Upload Image",
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: PrimaryColors.gradient2,
                  ),
                ),

                SizedBox(height: 5.h,),
                Text(
                  "PNG or JPG < 200KB",
                  style: GoogleFonts.poppins(
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w400,
                    color: PrimaryColors.expensecolor2,
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
