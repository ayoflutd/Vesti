import 'package:flutter/cupertino.dart';
import 'package:vesti/common/storage/app_storage.dart';

class Global{

  static late StorageService storageService;

  static Future<void> init()async{
    WidgetsFlutterBinding.ensureInitialized();
    storageService = await StorageService().init();
  }
}