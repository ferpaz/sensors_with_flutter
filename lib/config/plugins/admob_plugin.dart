import 'dart:async';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:miscelaneos/config/config.dart';

class AdmobPlugin {
  static Future<void> initialize() async {
    // Se inicializa el plugin de Admob
    await MobileAds.instance.initialize();
  }

  static Future<BannerAd> loadBannerAd() async {
    return BannerAd(
      adUnitId: Settings.googleMobileAdsSettings.adBannerId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {},

        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          // Dispose the ad here to free resources.
          ad.dispose();
        },
      ),
    )..load();
  }

  static Future<InterstitialAd> loadInterstitialAd() {
    Completer<InterstitialAd> completer = Completer<InterstitialAd>();

    InterstitialAd.load(
        adUnitId: Settings.googleMobileAdsSettings.adInterstitialId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            ad.fullScreenContentCallback = FullScreenContentCallback(
                // Called when the ad showed the full screen content.
                onAdShowedFullScreenContent: (ad) {},
                // Called when an impression occurs on the ad.
                onAdImpression: (ad) {},
                // Called when the ad failed to show full screen content.
                onAdFailedToShowFullScreenContent: (ad, err) {
                  // Dispose the ad here to free resources.
                  ad.dispose();
                },
                // Called when the ad dismissed full screen content.
                onAdDismissedFullScreenContent: (ad) {
                  // Dispose the ad here to free resources.
                  ad.dispose();
                },
                // Called when a click is recorded for an ad.
                onAdClicked: (ad) {});

            // Keep a reference to the ad so you can show it later.
            completer.complete(ad);
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            completer.completeError(error);
          },
        ));

    return completer.future;
  }

  static Future<RewardedAd> loadRewardedAd() {
    Completer<RewardedAd> completer = Completer<RewardedAd>();

    RewardedAd.load(
        adUnitId: Settings.googleMobileAdsSettings.adRewardedId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            // Keep a reference to the ad so you can show it later.
            completer.complete(ad);
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            completer.completeError(error);
          },
        ));

    return completer.future;
  }
}
