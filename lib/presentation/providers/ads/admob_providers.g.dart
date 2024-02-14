// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admob_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$adBannerHash() => r'67e25184c02fd5641c93a7fb3975b6d2d97d0ae1';

/// See also [adBanner].
@ProviderFor(adBanner)
final adBannerProvider = AutoDisposeFutureProvider<BannerAd?>.internal(
  adBanner,
  name: r'adBannerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$adBannerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AdBannerRef = AutoDisposeFutureProviderRef<BannerAd?>;
String _$adInterstitialHash() => r'4cd5a569b03b1ea72dca04ddb6cf5ce9d978319c';

/// See also [adInterstitial].
@ProviderFor(adInterstitial)
final adInterstitialProvider =
    AutoDisposeFutureProvider<InterstitialAd?>.internal(
  adInterstitial,
  name: r'adInterstitialProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$adInterstitialHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AdInterstitialRef = AutoDisposeFutureProviderRef<InterstitialAd?>;
String _$adRewardedHash() => r'5920a2dcb3f7494f618871f2f5081f268044ef4d';

/// See also [adRewarded].
@ProviderFor(adRewarded)
final adRewardedProvider = AutoDisposeFutureProvider<RewardedAd?>.internal(
  adRewarded,
  name: r'adRewardedProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$adRewardedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AdRewardedRef = AutoDisposeFutureProviderRef<RewardedAd?>;
String _$showAdsHash() => r'b2c579398b641f440a42e156de5c5050c21954de';

/// See also [ShowAds].
@ProviderFor(ShowAds)
final showAdsProvider = AutoDisposeNotifierProvider<ShowAds, bool>.internal(
  ShowAds.new,
  name: r'showAdsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$showAdsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowAds = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
