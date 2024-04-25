import 'package:flutter/services.dart';

class SystemChromeService {
  static Future<void> setSystemChrome() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await SystemChrome.restoreSystemUIOverlays();
  }
}
