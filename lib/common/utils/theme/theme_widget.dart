import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vesti/common/utils/theme/theme_provider.dart';
import 'package:vesti/common/widget/text/app_text.dart';

class AppThemeWidget {

  static Future<ThemeMode?> themeWidget(BuildContext context, WidgetRef ref) async {
    final themeNotifier = ref.read(themeModeProvider.notifier);
    final themeMode = ref.watch(themeModeProvider);
    return showModalBottomSheet<ThemeMode>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (BuildContext context) {

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              BigText(text: "Dark Mode",fontSize: 18,),
              SizedBox(height: 10.h,),
              Divider(),
              RadioListTile<ThemeMode>(
                title: Text('Off'),
                value: ThemeMode.light,
                groupValue: themeMode,
                onChanged: (value) => themeNotifier.setThemeMode(ThemeMode.light),
              ),
              RadioListTile<ThemeMode>(
                title: Text('On'),
                value: ThemeMode.dark,
                groupValue: themeMode,
                onChanged: (value) => themeNotifier.setThemeMode(ThemeMode.dark),
              ),
              RadioListTile<ThemeMode>(
                title: Text('Use system settings'),
                value: ThemeMode.system,
                groupValue: themeMode,
                onChanged: (value) =>
                    themeNotifier.setThemeMode(ThemeMode.system),
              ),
            ],
          ),
        );
      },
    );
  }
}


