import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vesti/common/constant/color_constant.dart';
import 'package:vesti/common/constant/image_constant.dart';
import 'package:vesti/common/constant/storage_constant.dart';
import 'package:vesti/common/route/app_route.dart';
import 'package:vesti/common/widget/button/button_widget.dart';
import 'package:vesti/common/widget/image/image_widget.dart';
import 'package:vesti/common/widget/text/app_text.dart';
import 'package:vesti/global.dart';
import 'package:vesti/main.dart';
import 'package:vesti/view/welcome/widget/widget.dart';


class GetStarted extends ConsumerWidget {
  GetStarted({super.key});


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImageConstant.GET_STARTED),
              fit: BoxFit.fitHeight
          )
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            child: Center(
              child: appAssetImage(
                  imagePath: AppImageConstant.LOGO,
                  height: 50.h,
                  width: 50.w
              ),
            ),
            top: 40.h,
          ),

          Positioned(
            child: Container(
                //height: 100.h,
                padding: EdgeInsets.only(top: 30.h,bottom: 40.h,left: 15.w,right: 15.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withAlpha(50),
                      Colors.black.withAlpha(150),
                      Colors.black.withAlpha(200),
                      Colors.black.withAlpha(250),
                      Colors.black,
                      Colors.black,
                      Colors.black,
                      Colors.black,
                      Colors.black,
                      Colors.black,
                      Colors.black,
                      Colors.black,
                    ],
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      appButton(
                        func: (){
                          Global.storageService.setBool(AppStorage.APP_FIRST_TIME, true);
                          Navigator.pushNamed(context, AppRoute.SIGN_IN);
                        },
                        text: "Create an account",
                        backColor: AppColor.mainColor,
                        width: double.infinity,
                        height: 30.h,
                      ),
                      SizedBox(height: 20.h),
                      RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(color: AppColor.primaryWhiteColor, fontSize: 13.sp),
                          children: <InlineSpan>[
                            TextSpan(
                              text: 'Sign In',
                              style: TextStyle(
                                fontSize: 13.sp
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Global.storageService.setBool(AppStorage.APP_FIRST_TIME, true);
                                  Navigator.pushNamed(context, AppRoute.SIGN_IN);
                                },
                            ),
                          ],
                        ),
                      )

                    ],
                  ),
                )
            ),
            bottom: 0,
            right: 0,
            left: 0,
          )
        ],
      ),
    );
  }
}
