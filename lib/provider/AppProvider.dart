import 'package:flutter/cupertino.dart';

class AppProvider with ChangeNotifier {
  

  String _input;

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
    _input =  _input.substring(0,_input.length-2);
    notifyListeners();
  }

  void clearInput(){
    _input = "";
    notifyListeners();
  }

}