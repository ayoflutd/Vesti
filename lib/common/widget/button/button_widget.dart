import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vesti/common/constant/color_constant.dart';
import 'package:vesti/common/widget/text/app_text.dart';


Widget appButton({void Function()? func, String text="" ,double fontSize=12,Color backColor=AppColor.mainColor, Color textColor=Colors.white,double height=0, double width=0}){
  return GestureDetector(
    onTap: func,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),
      width: width.w,
      height: height.h,
      child: Center(child: SmallText(text: text,color: textColor,fontSize: fontSize.sp)),
      decoration: BoxDecoration(
        color: AppColor.mainColor,
        borderRadius: BorderRadius.circular(10.r)
      ),
    ),
  );
}