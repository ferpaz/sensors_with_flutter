import 'package:flutter_app_badger/flutter_app_badger.dart';

class AppBadgePlugin {
  static Future<bool> get isAppBadgeSupported async {
    return await FlutterAppBadger.isAppBadgeSupported();
  }

  static void updateBadgeCount(int count) async {
    if (!await isAppBadgeSupported) return;

    FlutterAppBadger.updateBadgeCount(count);
    if (count == 0) removeBadge();
  }

  static void removeBadge() async {
    if (!await isAppBadgeSupported) return;

    FlutterAppBadger.removeBadge();
  }
}