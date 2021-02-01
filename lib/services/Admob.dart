import 'dart:io';

import 'package:tablas_de_verdad/const/conts.dart';

class AdmobService {
  static String getAdmobId() {
    if (Platform.isIOS) {
      return "";
    } else if (Platform.isAndroid) {
      if (IS_TESTING) {
        return "ca-app-pub-3940256099942544~3347511713";
      }
      return 'ca-app-pub-4665787383933447~4689744776';
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
      return 'ca-app-pub-4665787383933447/1334937592';
    }
  }
}