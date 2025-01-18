import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vesti/common/constant/color_constant.dart';
import 'package:vesti/common/constant/image_constant.dart';
import 'package:vesti/common/route/app_route.dart';
import 'package:vesti/common/widget/button/button_widget.dart';
import 'package:vesti/common/widget/image/image_widget.dart';
import 'package:vesti/common/widget/text/app_text.dart';
import 'package:vesti/main.dart';
import 'package:vesti/view/welcome/widget/widget.dart';


class Welcome extends ConsumerWidget {
  Welcome({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppImageConstant.ONBOARDING),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(
                  text: "Enjoy The Best Features",
                  color: AppColor.primaryWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
                SmallText(
                  text: "Experience the magic of requesting books anytime,anywhere",
                  color: AppColor.primaryWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 8.sp,
                  maxLine: 2,
                )
              ],
            ),
            left: 15.w,
            right: 15.w,
            bottom: 100.h,
          ),
          Positioned(
            child: Container(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DotsIndicator(
                        position: 2,
                        dotsCount: 3,
                      decorator: DotsDecorator(
                        activeColor: AppColor.mainColor
                      ),
                    ),
                    appButton(
                      func: (){
                        navKey.currentState!.pushNamed(AppRoute.GET_STARTED);
                      },
                      text: "Get Started",
                      fontSize: 10,
                      backColor: AppColor.mainColor,
                      width: 100.w,
                      height: 30.h,
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
