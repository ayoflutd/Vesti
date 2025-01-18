import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vesti/common/route/app_route.dart';
import 'package:vesti/global.dart';
import 'package:vesti/view/application/view/application.dart';
import 'package:vesti/view/book_detail/view/book_detail.dart';
import 'package:vesti/view/signin/view/signin.dart';
import 'package:vesti/view/welcome/view/get_started.dart';
import 'package:vesti/view/welcome/view/welcome.dart';


class AppRouteGenerator{

  static List<RouteEntity> routes(){
    return [
      RouteEntity(path: AppRoute.WELCOME, page: Welcome()),
      RouteEntity(path: AppRoute.GET_STARTED, page: GetStarted()),
      RouteEntity(path: AppRoute.SIGN_IN, page: SignIn()),
      // RouteEntity(path: AppRoute.SIGN_UP, page: SignUp()),
      RouteEntity(path: AppRoute.APPLICATION, page: Application()),

      RouteEntity(path: AppRoute.BOOK_DETAIL, page: BookDetail()),

      //Comment

      //Bookmark

    ];
  }

  static MaterialPageRoute generateRouteSetting(RouteSettings setting) {

    if(setting.name != null){

      var result = routes().where((element) => element.path==setting.name);

      if(result.isNotEmpty){

        bool isFirstOpen = Global.storageService.isFistOpen();
        if(result.first.path==AppRoute.WELCOME && isFirstOpen){
          bool isLoggedIn = Global.storageService.isLoggedIn();

          if(isLoggedIn){
            return MaterialPageRoute(
                builder: (_)=> Application(),
                settings: setting
            );
          }else{
            return MaterialPageRoute(
                builder: (_)=> SignIn(),
                settings: setting
            );
          }
        }else{
          return MaterialPageRoute(
              builder: (_)=> result.first.page,
              settings: setting
          );
        }
      }

    }

    return MaterialPageRoute(
        builder: (_)=> Welcome(),
        settings: setting
    );
  }

}

class RouteEntity{
  final String path;
  final Widget page;
  RouteEntity({required this.path,required this.page});
}