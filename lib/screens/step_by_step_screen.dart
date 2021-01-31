import 'package:flutter/material.dart';
import 'package:tablas_de_verdad/models/Step.dart';
import 'package:tablas_de_verdad/models/TruthTable.dart';

class StepByStepScreen extends StatefulWidget {
  final TruthTable table;
  StepByStepScreen({@required this.table});

  @override
  _StepByStepScreenState createState() => _StepByStepScreenState();
}

class _StepByStepScreenState extends State<StepByStepScreen> {
  

  @override
  void initState() {
    widget.table.getSteps(widget.table.postfix);
    print("Cantidad de pasos ${widget.table.steps.length}");
    for(int i = 0; i < widget.table.steps.length; i++){
      var s = widget.table.steps[i];
      print("${i+1} .- $s");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Step by step"),),
    );
  }
}