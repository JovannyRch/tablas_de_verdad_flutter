import 'package:flutter/material.dart';
import 'package:tablas_de_verdad/const/conts.dart';
import 'package:tablas_de_verdad/models/Step.dart';

class StepWidget extends StatelessWidget {
  final StepProcess step;
  StepWidget({this.step});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      padding: EdgeInsets.all(10.0),
      width: double.infinity,
      height: 500.0,
      decoration: BoxDecoration(
          border: Border.all(color: kDisableColor, width: 2.0),
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _title(),
        ],
      ),
    );
  }

  Widget _title() {
    return Text(
      "$STEP_LABEL ${step.index}",
      style: TextStyle(
        color: kLabelColor,
      ),
    );
  }
}
