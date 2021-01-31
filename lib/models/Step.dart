import 'package:tablas_de_verdad/models/Operator.dart';

class Step {
  String variable1;
  String variable2 = "";
  Operator operator;
  bool isSingleVariable;
  Step({this.variable1, this.variable2, this.operator, this.isSingleVariable = false});

  @override
  String toString() {
    if(this.isSingleVariable){
      return " ${operator.value}$variable1 ";
    }
    return "$variable1 ${operator.value} $variable2";
  }
}