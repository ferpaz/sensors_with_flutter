import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Settings {
  static GoogleMobileAdsSettings? _googleMobileAdsSettings;

  static GoogleMobileAdsSettings get googleMobileAdsSettings => _googleMobileAdsSettings!;

  static initialize() async {
    await dotenv.load(fileName: ".env");

    _googleMobileAdsSettings = GoogleMobileAdsSettings(
      adBannerId: Platform.isAndroid ? dotenv.env['AD_BANNER_ANDROID_ID']! : dotenv.env['AD_BANNER_IOS_ID']!,
      adInterstitialId: Platform.isAndroid ? dotenv.env['AD_INTERSTITIAL_ANDROID_ID']! : dotenv.env['AD_INTERSTITIAL_IOS_ID']!,
      adRewardedId: Platform.isAndroid ? dotenv.env['AD_REWARDED_ANDROID_ID']! : dotenv.env['AD_REWARDED_IOS_ID']!,
    );
  }
}

class GoogleMobileAdsSettings {
  String adBannerId;
  String adInterstitialId;
  String adRewardedId;

  GoogleMobileAdsSettings({
    required this.adBannerId,
    required this.adInterstitialId,
    required this.adRewardedId,
  });
}