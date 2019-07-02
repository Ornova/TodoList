import 'package:flutter/services.dart';

class Vibrate {
  static Future<void> vibrate() async {
    await SystemChannels.platform.invokeMethod<void>('HapticFeedback.vibrate');
  }
}
