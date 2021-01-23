import 'package:flutter/cupertino.dart';

class AppProvider with ChangeNotifier {
  

  String _input = "";
  bool _isUppercase = true;

  bool get isUppercase{
    return _isUppercase;
  }

  set isUppercase (bool data){
    _isUppercase = data;
    notifyListeners();
  }

  String get input{
    return _input;
  }

  set input (String data){
    _input = data;
    notifyListeners();
  }

  void addLeter(String letter){
    _input += letter;
    notifyListeners();
  }

  void removerLetter(){
    _input =  _input.substring(0,_input.length-1);
    notifyListeners();
  }

  void clearInput(){
    _input = "";
    notifyListeners();
  }

  void changeCase(){
    _isUppercase = !_isUppercase;
    if(_isUppercase){
      _input = _input.toUpperCase();
    }else{
      _input = _input.toLowerCase();
      
    }
    notifyListeners();
  }

}