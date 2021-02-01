
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
    if(_prefs.containsKey("language")){
      return _prefs.getString("language");
    }
    else{
      language = EN;
      return EN;
    }
  }

  set language(String language) {
    _prefs.setString('language', language);
  }

}