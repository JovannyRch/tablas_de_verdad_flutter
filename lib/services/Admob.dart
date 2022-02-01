import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:tablas_de_verdad/const/conts.dart';

class AdmobService {
 
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo();

  static String getAdmobId() {
    
    if (Platform.isIOS) {
      return "";
    } else if (Platform.isAndroid) {
      if (IS_TESTING) {
        return "ca-app-pub-3940256099942544~3347511713";
      }
      return ADMOB_ID;
    }
    return '';
  }

  static String videoId() {
    if (Platform.isIOS) {
      return "";
    } else if (Platform.isAndroid) {
      if (IS_TESTING) {
        return "ca-app-pub-3940256099942544/1033173712"; 
      }
      return VIDEO_ID; 
    }
  }

  static InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      targetingInfo: targetingInfo,
      adUnitId: AdmobService.videoId(),
      listener: (MobileAdEvent event) {},
    );
  }

  static BannerAd createBannerAdd() {
    return BannerAd(
      targetingInfo: targetingInfo,
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.smartBanner,
      listener: (MobileAdEvent event) {
        print('Bnner Event: $event');
      },
    );
  }
 
}