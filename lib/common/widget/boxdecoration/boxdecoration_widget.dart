import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vesti/common/constant/color_constant.dart';

BoxDecoration appBoxDecoration({Color backColor=Colors.white,int borderRadius=15,bool? borderSide}){
  return BoxDecoration(
    color: backColor, // Background color of the container
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withValues(alpha: 0.5), // Shadow color with opacity
        blurRadius: 2.0,
        spreadRadius: 1.0,
        offset: Offset(1.0, 1.0),
      ),
    ],
    borderRadius: BorderRadius.circular(12.r), // Rounded corners
  );
}