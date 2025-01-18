import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'apploader_notifier.g.dart';

@riverpod
class AppLoaderNotifier extends _$AppLoaderNotifier{

  @override
  bool build(){
    return false;
  }

  void onLoad(bool value){
    state = value;
  }

}