import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vesti/common/utils/theme/app_theme.dart';
import 'package:vesti/common/utils/theme/theme_provider.dart';
import 'package:vesti/global.dart';


import 'common/route/app_generate_route.dart';

Future<void> main() async {
  await Global.init();

  runApp(
      const ProviderScope(
          child: MyApp()
      )
  );
}

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final appThemeMode = ref.watch(themeModeProvider);

    // Update system bar style based on theme
    final SystemUiOverlayStyle overlayStyle =
    appThemeMode == ThemeMode.dark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;

    SystemChrome.setSystemUIOverlayStyle(overlayStyle);
    return ScreenUtilInit(
      designSize: const Size(360, 750),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        navigatorKey: navKey,
        onGenerateRoute: AppRouteGenerator.generateRouteSetting,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: appThemeMode,
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        //   useMaterial3: true,
        //   visualDensity: VisualDensity.adaptivePlatformDensity,
        // ),
      ),
    );
  }
}

