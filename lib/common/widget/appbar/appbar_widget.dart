import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

signInAppBar({String title=""}){
  return AppBar(
    title: Text(title),
    centerTitle: true,

  );
}

borderAppBar({String title=""}){
  return AppBar(
    title: Text(title),
    centerTitle: true,
    bottom: PreferredSize(
        preferredSize: Size.fromHeight(10.h),
        child: Container(
          height: 1.h,
          color: Colors.grey.withOpacity(0.3),
        )
    ),
  );
}

appGeneralAppBar({String title=""}){
  return AppBar(
    title: Text(title),
    centerTitle: true,
  );
}

appWidgetAppBar({Widget? title,bool centerTitle=false,PreferredSizeWidget? bottom,List<Widget>? actions}){
  return AppBar(
    //automaticallyImplyLeading: false,
    title: title,
    centerTitle: true,
    bottom: bottom,
    actions: actions,
  );
}