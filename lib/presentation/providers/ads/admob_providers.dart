import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:miscelaneos/config/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'admob_providers.g.dart';

@riverpod
Future<BannerAd?> adBanner(AdBannerRef ref) async {

  final showAds = ref.watch(showAdsProvider);
  if (!showAds) return null;

  final ad = await AdmobPlugin.loadBannerAd();
  return ad;
}

@riverpod
Future<InterstitialAd?> adInterstitial(AdInterstitialRef ref) async {

  final showAds = ref.watch(showAdsProvider);
  if (!showAds) return null;

  final ad = await AdmobPlugin.loadInterstitialAd();
  return ad;
}

@riverpod
Future<RewardedAd?> adRewarded(AdRewardedRef ref) async {

  final showAds = ref.watch(showAdsProvider);
  if (!showAds) return null;

  final ad = await AdmobPlugin.loadRewardedAd();
  return ad;
}

final adsRewardPointsProvider = StateProvider<int>((ref) => 0);

@riverpod
class ShowAds extends _$ShowAds {
  @override
  bool build() {
    return true;
  }

  void checkAdsState() async {
    state = await SharedReferencesPlugin.getBool('adsAreVisible', defaultValue: true);
  }

  void showAds() async {
    state = true;
    await SharedReferencesPlugin.setBool('adsAreVisible', true);
  }

  void removeAds() async {
    state = false;
    await SharedReferencesPlugin.setBool('adsAreVisible', false);
  }

  void toggleAds() async {
    state = !state;
    await SharedReferencesPlugin.setBool('adsAreVisible', state);
  }
}
