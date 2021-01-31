import 'package:flutter/material.dart';
import 'package:tablas_de_verdad/const/conts.dart';
import 'package:tablas_de_verdad/models/Step.dart';
import 'package:tablas_de_verdad/models/TruthTable.dart';
import 'package:tablas_de_verdad/widgets/TableWidget.dart';

class StepWidget extends StatelessWidget {
  final StepProcess step;
  final TruthTable table;
  StepWidget({this.step, this.table});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      padding: EdgeInsets.all(10.0),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_label(), SizedBox(height: 10.0), _title(), _table()],
      ),
    );
  }

  Widget _table() {
    return TableWidget(
        title: "",
        table: table,
        columsKeys: getColumnsKeys(),
        resultColumnKey: step.toString());
  }

  List<String> getColumnsKeys() {
    if (step.isSingleVariable) {
      return [step.variable1];
    }
    return [step.variable1, step.variable2];
  }

  Widget _label() {
    return Text(
      "$STEP_LABEL ${step.index}: ${step.operator.esName}",
      style: TextStyle(
        color: kLabelColor,
      ),
    );
  }

  Widget _title() {
    if (step.isSingleVariable) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${step.operator.value}",
            style: TextStyle(
              color: kMainColor,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            " ${step.variable1}",
            style: TextStyle(
              fontSize: 20.0,
            ),
          )
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          " ${step.variable1} ",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        Text(
          "${step.operator.value}",
          style: TextStyle(
            color: kMainColor,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          " ${step.variable2}",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }
}
