import 'package:tablas_de_verdad/models/Operator.dart';
import 'package:tablas_de_verdad/models/TruthTable.dart';

class StepProcess {
  String variable1;
  String variable2 = "";
  Operator operator;
  bool isSingleVariable;
  int index;
  static int currentIndex = 0;
  
  TruthTable table;

  StepProcess({this.variable1, this.variable2, this.operator, this.isSingleVariable = false}){
    index = ++currentIndex;
    table = new TruthTable(this.toString());
  }

  @override
  String toString() {
    if(this.isSingleVariable){
      return "${operator.value}$variable1";
    }
    return "$variable1${operator.value}$variable2";
  }
}