import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vesti/common/constant/color_constant.dart';
import 'package:vesti/common/route/app_route.dart';
import 'package:vesti/common/utils/loader/apploader_notifier.dart';
import 'package:vesti/common/widget/appbar/appbar_widget.dart';
import 'package:vesti/common/widget/button/button_widget.dart';
import 'package:vesti/common/widget/text/app_text.dart';
import 'package:vesti/common/widget/textfield/app_textfield.dart';
import 'package:vesti/main.dart';
import 'package:vesti/view/signin/controller/signin_controller.dart';
import 'package:vesti/view/signin/notifier/signin_notifier.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}


class _SignInState extends ConsumerState<SignIn> {

  late SignInController _controller;

  @override
  void didChangeDependencies(){
    _controller = SignInController();
    super.didChangeDependencies();
  }


  Widget build(BuildContext context) {
    final loader = ref.watch(appLoaderNotifierProvider);
    return Scaffold(
      appBar: signInAppBar(),
      body: loader==false ? SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 10.h,left: 15.w,right: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(
                text: "Let's sign you in",
                fontWeight: FontWeight.bold,
              ),
              SmallText(
                text: "Welcome back! You've been missed",
                color: AppColor.primaryGreyColor,
                fontSize: 11.sp,
              ),
              SizedBox(height: 35.h,),
              AppAuthTextField(
                onChange: (value)=>ref.read(signinNotifierProvider.notifier).onChangeEmail(value),
                labelText: "EMAIL *",
                hintText: "ovie@wevesti.com",
              ),
              AppAuthTextField(
                onChange: (value)=>ref.read(signinNotifierProvider.notifier).onChangePassword(value),
                labelText: "PASSWORD *",
                obscureText: true,
                hintText: "***********",
                isPassword: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {

                        },
                      ),
                      SmallText(
                        text: "Remember me",
                        color: AppColor.mainColor,
                        fontSize: 11.sp,
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: SmallText(
                      text: "Forgot Password?",
                      fontWeight: FontWeight.bold,
                      fontSize: 11.sp,
                    ),
                  )
                ],
              ),
              SizedBox(height: 30.h,),
              appButton(
                func: (){
                  _controller.handleSignIn(ref);
                },
                text: "Sign In",
                backColor: AppColor.mainColor,
                width: double.infinity,
                height: 30.h,
              ),
            ],
          ),
        ),
      ) : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
