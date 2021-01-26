import 'package:flutter/material.dart';
import 'package:tablas_de_verdad/models/TruthTable.dart';

class ResultScreen extends StatelessWidget {
  final TruthTable table;

  ResultScreen({this.table});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado"),
      ),
    );
  }
}
