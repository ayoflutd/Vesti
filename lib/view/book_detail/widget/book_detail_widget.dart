import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vesti/common/constant/color_constant.dart';
import 'package:vesti/common/widget/boxdecoration/boxdecoration_widget.dart';
import 'package:vesti/common/widget/text/app_text.dart';

Widget ratingIcon(){
  return Icon(Icons.star_rate_rounded,color: Colors.amber,size: 10.sp,);
}

Widget bookRating(){
  return Row(
    children: [
      ratingIcon(),
      ratingIcon(),
      ratingIcon(),
      ratingIcon(),
      Icon(Icons.star_rate_rounded,color: AppColor.primaryGreyColor,size: 10.sp,)

    ],
  );
}

Widget bookDetailBox({required String value, required String title, bool icon=false}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
    decoration: appBoxDecoration(),
    child: Column(
      children: [
        Center(
          child: SmallText(text: title,),
        ),
        SizedBox(height: 2.h,),
        Container(
          height: 1.h,
          width: 60.w,
          color: AppColor.primaryGreyColor,
        ),
        SizedBox(height: 2.h),
        Center(
          child: Row(
            children: [
              icon == true ? ratingIcon() : SizedBox(),
              SmallText(text: value,),
            ],
          ),
        )
      ],
    ),
  );
}