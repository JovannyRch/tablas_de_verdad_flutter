import 'package:shared_preferences/shared_preferences.dart';
import 'package:tablas_de_verdad/const/conts.dart';

class UserPrefences {
  static final UserPrefences _instance = new UserPrefences._internal();

  factory UserPrefences() {
    return _instance;
  }

  UserPrefences._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String get language {
    if (_prefs.containsKey("language")) {
      return _prefs.getString("language");
    } else {
      language = DEFAULT_LANG;
      return DEFAULT_LANG;
    }
  }

  set language(String language) {
    _prefs.setString('language', language);
  }

  bool get isShow01s {
    if (_prefs.containsKey("isShow01s")) {
      return _prefs.getBool("isShow01s");
    } else {
      isShow01s = false;
      return false;
    }
  }

  set isShow01s(bool isShow01s) {
    _prefs.setBool('isShow01s', isShow01s);
  }

  bool get isDarkMode {
    if (_prefs.containsKey("isDarkMode")) {
      return _prefs.getBool("isDarkMode");
    } else {
      isDarkMode = false;
      return false;
    }
  }

  set isDarkMode(bool isDarkMode) {
    _prefs.setBool('isDarkMode', isDarkMode);
  }

  bool get isBasic {
    if (_prefs.containsKey("isBasic")) {
      return _prefs.getBool("isBasic");
    } else {
      isBasic = true;
      return true;
    }
  }

  set isBasic(bool isBasic) {
    _prefs.setBool('isBasic', isBasic);
  }

  bool get isProMode {
    if (_prefs.containsKey("isProMode")) {
      return _prefs.getBool("isProMode");
    } else {
      isProMode = false;
      return false;
    }
  }

  set isProMode(bool isProMode) {
    _prefs.setBool('isProMode', isProMode);
  }
}
