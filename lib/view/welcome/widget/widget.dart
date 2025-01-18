import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vesti/common/constant/color_constant.dart';
import 'package:vesti/common/constant/storage_constant.dart';
import 'package:vesti/common/route/app_route.dart';
import 'package:vesti/common/widget/image/image_widget.dart';
import 'package:vesti/common/widget/text/app_text.dart';
import 'package:vesti/global.dart';



Widget welcomeButton(BuildContext context,{int index=0,PageController? controller,String buttonTitle="Next"}){
  return GestureDetector(
    onTap: (){
      if(index<3){
        controller?.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.linear);
      }else{
        Global.storageService.setBool(AppStorage.APP_FIRST_TIME, true);
        Navigator.pushNamed(context, AppRoute.SIGN_IN);
      }
    },
    child: Container(
      width: 300.w,
      height: 50.h,
      child: Center(
        child: SmallText(
          text: buttonTitle,
          color: Colors.white
        )
      ),
      decoration: BoxDecoration(
        color: AppColor.mainColor,
        borderRadius: BorderRadius.circular(15.r)
      ),
    ),
  );
}