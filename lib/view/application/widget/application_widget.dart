import 'package:flutter/cupertino.dart';
import 'package:vesti/view/home/view/home.dart';
import 'package:vesti/view/menu/view/menu.dart';


Widget applicationPages(int index){
  var listPages = [
    Home(),
    Center(child: Text("My Books"),),
    Center(child: Text("Favorites"),),
    Menu(),
  ];
  return listPages[index];
}