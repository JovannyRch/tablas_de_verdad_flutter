import 'package:flutter/material.dart';
import 'package:tablas_de_verdad/models/TruthTable.dart';

class StepByStepScreen extends StatefulWidget {
  final TruthTable table;
  StepByStepScreen({@required this.table});

  @override
  _StepByStepScreenState createState() => _StepByStepScreenState();
}

class _StepByStepScreenState extends State<StepByStepScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Step by step"),),
    );
  }
}