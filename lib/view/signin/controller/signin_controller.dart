import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vesti/common/constant/image_constant.dart';
import 'package:vesti/common/constant/storage_constant.dart';
import 'package:vesti/common/route/app_route.dart';
import 'package:vesti/common/utils/loader/apploader_notifier.dart';
import 'package:vesti/common/utils/toast/app_toast.dart';
import 'package:vesti/global.dart';
import 'package:vesti/main.dart';
import 'package:vesti/model/signin.dart';
import 'package:vesti/model/user.dart';
import 'package:vesti/view/signin/notifier/signin_notifier.dart';

class SignInController{
  SignInController();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Future<void> handleSignIn(WidgetRef ref) async {
    var state = ref.read(signinNotifierProvider);


    ref.read(appLoaderNotifierProvider.notifier).onLoad(true);

    String email = state.email;
    String password = state.password;

    emailController.text = email;
    passwordController.text = password;

    if(email == "" && state.email==""){
      toastMessage("Email can't be empty");
    }

    if(password == "" && state.password==""){
      toastMessage("Password can't be empty");
    }



      User user = User();
      user.id = 1;
      user.name = "Mark";
      user.lastname = "Edwards";
      user.email = "vesti@gmail.com";
      user.avatar = AppImageConstant.USER;

      emailController.text = "";
      passwordController.text = "";
      email = "";
      password = "";

      final userProfile = jsonEncode(user);
      Global.storageService.setString(AppStorage.USER_ACCESS_TOKEN, "AE4T5KITYOGDF");
      Global.storageService.setBool(AppStorage.APP_ISLOGGED_IN, true);
      Global.storageService.setString(AppStorage.USER_PROFILE, userProfile);
      navKey.currentState?.pushNamedAndRemoveUntil(AppRoute.APPLICATION,(bool)=>false);


    ref.read(appLoaderNotifierProvider.notifier).onLoad(false);
  }
}