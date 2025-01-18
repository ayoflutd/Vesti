import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vesti/common/constant/color_constant.dart';
import 'package:vesti/view/application/widget/application_widget.dart';
import '../notifier/application_notifier.dart';

class Application extends ConsumerWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    int index = ref.watch(applicationNotifierProvider);
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: applicationPages(index),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: "My Books"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "Favorites"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: "Menu"
            ),
          ],
          elevation: 0,
          currentIndex: index,
          onTap: (value)=>ref.read(applicationNotifierProvider.notifier).changeIndex(value),
          showUnselectedLabels: true,
          showSelectedLabels: true,
          iconSize: 22.w,
          selectedIconTheme: IconThemeData(color: AppColor.mainColor),
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          selectedLabelStyle: TextStyle(color: AppColor.mainColor,fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
