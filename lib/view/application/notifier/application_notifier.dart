import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'application_notifier.g.dart';

@riverpod
class ApplicationNotifier extends _$ApplicationNotifier{

  @override
  int build(){
    return 0;
  }

  void changeIndex(int index){
    state = index;
  }

}


