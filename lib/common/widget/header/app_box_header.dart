import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vesti/common/constant/color_constant.dart';
import 'package:vesti/common/widget/text/app_text.dart';

Widget appBoxHeader({String categoryTitle=""}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SmallText(
        text: categoryTitle,
        fontWeight: FontWeight.bold,
        fontSize: 10.sp,
      ),
      SmallText(text: "View all",color: AppColor.mainColor,fontSize: 10.sp)
    ],
  );
}