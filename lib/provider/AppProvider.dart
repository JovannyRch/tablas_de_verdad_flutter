import 'package:flutter/cupertino.dart';
import 'package:tablas_de_verdad/models/Messages.dart';
import 'package:tablas_de_verdad/shared/UserPreferences.dart';

class AppProvider with ChangeNotifier {
  String _input = "";
  bool _isUppercase = true;
  bool _isBasic = true;
  bool _is0sAnd1s = false;
  Messages _messages = new Messages();

  UserPrefences _userPrefrences = new UserPrefences();
  String _language;

  AppProvider(String lang){
    _language = lang;
  }
  
  Messages get messages{
    return _messages;
  }

  void changeLanguage(String lang){
    _messages.language = lang;
    notifyListeners();
  }

  String get language{
    return _language;
  }

  set language(String val){
    _language = val;
    notifyListeners();
  }

  bool get is0sAnd1s {
    return _is0sAnd1s;
  }

  bool get isUppercase {
    return _isUppercase;
  }

  set isUppercase(bool data) {
    _isUppercase = data;
    notifyListeners();
  }

  bool get isBasic {
    return _isBasic;
  }

  set isBasic(bool data) {
    _isBasic = data;
    notifyListeners();
  }

  String get input {
    return _input;
  }

  set input(String data) {
    _input = data;
    notifyListeners();
  }

  void addLeter(String letter) {
    _input += _isUppercase ? letter.toUpperCase() : letter.toLowerCase();
    notifyListeners();
  }

  void removerLetter() {
    _input = _input.substring(0, _input.length - 1);
    notifyListeners();
  }

  void clearInput() {
    _input = "";
    notifyListeners();
  }

  void changeCase() {
    _isUppercase = !_isUppercase;
    if (_isUppercase) {
      _input = _input.toUpperCase();
    } else {
      _input = _input.toLowerCase();
    }
    notifyListeners();
  }

  void changeMode() {
    _isBasic = !_isBasic;
    notifyListeners();
  }

  void change01s(){
    _is0sAnd1s = !_is0sAnd1s;
    notifyListeners();
  }
}
