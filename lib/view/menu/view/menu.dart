import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vesti/common/constant/color_constant.dart';
import 'package:vesti/common/constant/storage_constant.dart';
import 'package:vesti/common/route/app_route.dart';
import 'package:vesti/common/utils/theme/theme_provider.dart';
import 'package:vesti/common/utils/theme/theme_widget.dart';
import 'package:vesti/common/widget/appbar/appbar_widget.dart';
import 'package:vesti/common/widget/button/button_widget.dart';
import 'package:vesti/global.dart';
import 'package:vesti/main.dart';

class Menu extends ConsumerWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: borderAppBar(title: "Menu"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            appButton(
              func: (){
                AppThemeWidget.themeWidget(context,ref);
              },
              text: "Theme mode",
              backColor: AppColor.mainColor,
              width: double.infinity,
              height: 30.h,
            ),
            SizedBox(height: 20.h,),
            appButton(
              func: (){
                Global.storageService.setString(AppStorage.USER_PROFILE, "");
                Global.storageService.setString(AppStorage.USER_ACCESS_TOKEN, "");
                Global.storageService.setBool(AppStorage.APP_ISLOGGED_IN, false);
                navKey.currentState?.pushNamedAndRemoveUntil(AppRoute.SIGN_IN,(bool)=>false);
              },
              text: "Logout",
              backColor: AppColor.mainColor,
              width: double.infinity,
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
