// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class MyInputField extends StatefulWidget {
//   final String? hint;
//   final String? label;
//   final bool? isPasswordField;
//   final bool? isLable;
//   final bool? isRounded;
//   final TextStyle? textStyle;
//   final Function(String? value)? onChange;
//   final TextInputType? keyboardType;
//   final void Function(String)? onFieldSubmitted;
//   final Widget? prefix;
//   final int? limit;
//   final double? height;
//   final TextEditingController? controller;
//   final VoidCallback? onTap;
//   final bool? readOnly;
//   final Color? fillColor;
//   final int? maxLines;
//   final int? minLines;
//   final String? text;
//   final String? textLable;
//   final Color? counterColor;
//   final Color? lableColor;
//   final bool? showCounter;
//   final bool? showBorder;
//   final bool? isDense;
//   final Key? key;
//   final FocusNode? focusNode;
//   final EdgeInsetsGeometry? margin;
//   final String? Function(String?)? validator;
//   final Future<String?> Function(String?)? asyncValidator;
//   final Widget? suffix;
//   final InputBorder? border;
//   final InputBorder? enabledBorder;
//   final InputBorderType? borderType;
//   final EdgeInsetsGeometry? padding;
//
//   MyInputField(
//       {this.hint,
//         this.isPasswordField,
//         this.isLable=true,
//         this.isRounded=false,
//         this.onChange,
//         this.padding,
//         this.keyboardType,
//         this.prefix,
//         this.limit,
//         this.height,
//         this.controller,
//         this.onTap,
//         this.readOnly,
//         this.fillColor,
//         this.lableColor,
//         this.maxLines,
//         this.text,
//         this.textLable,
//         this.showCounter,
//         this.counterColor,
//         this.showBorder,
//         this.minLines,
//         this.margin,
//         this.suffix,
//         this.validator,
//         this.isDense,
//         this.onFieldSubmitted,
//         this.asyncValidator,
//         this.label,
//         this.key,
//         this.textStyle,
//         this.border,
//         this.enabledBorder,
//         this.borderType,
//         this.focusNode})
//       : super(key: key);
//
//   final _state = _MyInputFieldState();
//
//   @override
//   _MyInputFieldState createState() {
//     return _state;
//   }
//
//   Future<void> validate() async {
//     if (asyncValidator != null) {
//       //await _state.validate();
//     }
//   }
// }
//
// enum InputBorderType { outline, underline }
//
// class _MyInputFieldState extends State<MyInputField> {
//   late bool _isHidden;
//   String text = "";
//   bool isPasswordField = false;
//
//   @override
//   void initState() {
//     isPasswordField = widget.isPasswordField ?? false;
//     _isHidden = isPasswordField;
//     errorMessage = null;
//     if (widget.validator != null && widget.asyncValidator != null) {
//       throw "validator and asyncValidator are not allowed at same time";
//     }
//
//     if (widget.controller != null && widget.text != null) {
//       widget.controller!.text = widget.text!;
//     }
//
//     super.initState();
//   }
//
//   var isValidating = false;
//   var isValid = false;
//   var isDirty = false;
//   String? errorMessage;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//         maxLength: widget.limit,
//         key: widget.key,
//         onChanged: widget.asyncValidator == null
//             ? widget.onChange
//             : (value) {
//           text = value.toString();
//           validateValue(text);
//           if (widget.onChange != null) {
//             widget.onChange!(text);
//           }
//         },
//         style: widget.textStyle?? GoogleFonts.roboto(textStyle: TextStyle(
//             fontSize: 12.sp,color: AppColors.whiteTextColor.withOpacity(.6),fontWeight: FontWeight.w400
//         )),
//         obscureText: _isHidden,
//         onTap: widget.onTap,
//         validator: widget.validator ??
//             (widget.asyncValidator != null
//                 ? (value) {
//               text = value.toString();
//               return errorMessage;
//             }
//                 : null),
//         maxLines: widget.maxLines ?? 1,
//         minLines: widget.minLines,
//         readOnly: widget.readOnly ?? false,
//         keyboardType: widget.keyboardType,
//         controller: widget.controller,
//         initialValue: widget.controller == null ? widget.text : null,
//         onFieldSubmitted: widget.onFieldSubmitted,
//         focusNode: widget.focusNode,
//         enabled: widget.keyboardType != TextInputType.none,
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         buildCounter: (_, {required currentLength, maxLength, required isFocused}) {
//           return Visibility(
//             visible: widget.showCounter ?? false,
//             child: Padding(
//               padding: EdgeInsets.only(left: 16.0),
//               child: Container(
//                 alignment: Alignment.centerRight,
//                 child: Text(
//                   currentLength.toString() + (widget.limit != null ? "/" + maxLength.toString() : ""),
//                   style: TextStyle(color: widget.counterColor),
//                 ),
//               ),
//             ),
//           );
//         },
//         cursorHeight: 22.sp,
//         autocorrect: true,
//         decoration: InputDecoration(
//             prefixIcon: widget.prefix,
//             hintText: widget.hint,
//             labelText: widget.label,
//
//             labelStyle: TextStyle(color: Color(0xFF000000),fontSize: 13.sp,),
//             isDense: widget.isDense,
//             fillColor: widget.fillColor ?? /Color(0xFFECECEC)/
//             Colors.white.withOpacity(.1),
//         filled: widget.fillColor != null,
//         suffixIconConstraints: BoxConstraints(minWidth: 50),
//         suffixIcon: widget.suffix ??
//             (isPasswordField
//                 ? IconButton(
//               onPressed: () {
//                 if (isPasswordField) {
//                   if (mounted) {
//                     setState(() {
//                       _isHidden = !_isHidden;
//                     });
//                   }
//                 }
//               },
//               icon: Visibility(
//                 visible: isPasswordField,
//                 child: Icon(
//                   isPasswordField ? (_isHidden ? Icons.visibility : Icons.visibility_off) : null,
//                   color: AppColors.whiteTextColor.withOpacity(0.6),
//                   size: 16.h,
//                 ),
//               ),
//             )
//                 : (widget.asyncValidator != null ? _getSuffixIcon() : null)),
//         hintStyle:  GoogleFonts.roboto(textStyle: TextStyle(
//             fontSize: 12.sp,color: AppColors.whiteTextColor.withOpacity(.6),fontWeight: FontWeight.w400
//         )),
//         contentPadding:widget.padding?? EdgeInsets.only(right: 10.sp),
//         border: InputBorder.none,
//         focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Colors.white,width: 1.r)
//         ),
//         enabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Colors.white,width: 1.r)
//         )
//
//       // filled: true,
//       // fillColor: Color(0xF0BBBBBB),
//     ),
//     );
//   }