import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget appAssetImage({String imagePath="",double width=20,double height=20}){
  return Container(
    height: height.h,
      width: width.w,
      child: Image.asset(
          imagePath,
          width: width.w,
          height: height.h
      )
  );
}


Widget bookDetailImage({String imgPath="",double height=150,double width=100}){
  return Container(
    width: width.w,
    height: height.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.r),
      image: DecorationImage(
        fit: BoxFit.cover,
          image: AssetImage(imgPath)
      )
    ),
  );
}

Widget userProfileImage({String imgPath="",double radius=15}){
  return CircleAvatar(
    backgroundImage: AssetImage(imgPath),
    radius: radius.r,
  );
}
