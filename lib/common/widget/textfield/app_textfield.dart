import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vesti/common/constant/color_constant.dart';
import 'package:vesti/view/signin/notifier/signin_notifier.dart';

class AppAuthTextField extends ConsumerWidget {
    final String labelText;
    final bool obscureText;
    final String hintText;
    final IconData icon;
    final Function(String value)? onChange;
    final TextEditingController? controller;
    final bool isPassword;
    String? initialValue;
    final bool readOnly;
    final int maxLines;
    Function(String?)? validator;
    AppAuthTextField({super.key,this.labelText="",this.obscureText=false,
      this.hintText="", this.icon=Icons.person,this.onChange,this.controller,
      this.isPassword=false,this.initialValue,this.readOnly=false,this.maxLines=1,
      this.validator});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordNotifier = ref.watch(passwordNotifierProvider);
    final passwordChange = ref.read(passwordNotifierProvider.notifier);
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: TextFormField(
        onChanged: onChange,
        readOnly: readOnly,
        maxLines: maxLines,
        initialValue: initialValue,
        validator: (value)=>validator!(value),
        obscureText: obscureText == true ? passwordNotifier : false,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText.toUpperCase(),
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.sp
          ),
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(
            vertical: 20.h,
            horizontal: 20.w,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always, // Always show label at the border
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r), // Rounded corners
              borderSide: BorderSide(
              color: AppColor.primaryGreyColor
            )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r), // Rounded corners
              borderSide: BorderSide(
                  color: AppColor.primaryGreyColor,
              )
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r), // Rounded corners
              borderSide: BorderSide(
                  color: AppColor.primaryGreyColor
              )
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r), // Rounded corners
              borderSide: BorderSide(
                  color: AppColor.primaryGreyColor
              )
          ),
          suffixIcon: isPassword == true ?
            Padding(
              padding: EdgeInsets.only(right: 5.w),
              child: GestureDetector(
                onTap: (){
                  passwordChange.onChangePassword();
                },
                  child: Icon(passwordNotifier== true ? Icons.visibility : Icons.visibility_off)),
            ) : SizedBox()
        ),

      ),
    );
  }
}