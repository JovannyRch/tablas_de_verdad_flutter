import 'package:flutter/material.dart';
import 'package:tablas_de_verdad/const/conts.dart';

import 'package:tablas_de_verdad/models/TruthTable.dart';
import 'package:tablas_de_verdad/widgets/StepWidget.dart';

class StepByStepScreen extends StatefulWidget {
  final TruthTable table;
  StepByStepScreen({@required this.table});

  @override
  _StepByStepScreenState createState() => _StepByStepScreenState();
}

class _StepByStepScreenState extends State<StepByStepScreen> {
 

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kMainColor, //change your color here
        ),
        title: Text(
          widget.table.initialInfix,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: kMainColor,
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: [],
        elevation: 0,
      ),
      body: _body(),
    );
  }

  Widget _body() {
   

    return Container(
      padding: EdgeInsets.all(10.0),
      width: double.infinity,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ...widget.table.steps.map((s) => StepWidget(step: s, table: widget.table,)).toList()
          ],
        ),
      ),
    );
  }

  Widget _renderLoading() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(kMainColor),
        ),
      ),
    );
  }
}
