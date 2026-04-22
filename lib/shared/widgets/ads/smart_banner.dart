import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smooth_template/services/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SmartBanner extends ConsumerStatefulWidget {
  const SmartBanner({super.key, this.size = AdSize.banner});

  final AdSize size;

  @override
  ConsumerState<SmartBanner> createState() => _SmartBannerState();
}

class _SmartBannerState extends ConsumerState<SmartBanner> {
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  Future<void> _loadAd() async {
    final adsService = ref.read(adsServiceProvider);
    await adsService.initialize();
    final ad = await adsService.createBannerAd(widget.size);
    if (!mounted) return;
    setState(() {
      _bannerAd = ad;
    });
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_bannerAd == null) return const SizedBox.shrink();
    return SizedBox(
      width: _bannerAd!.size.width.toDouble(),
      height: _bannerAd!.size.height.toDouble(),
      child: AdWidget(ad: _bannerAd!),
    );
  }
}
