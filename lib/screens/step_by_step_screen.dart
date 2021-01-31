import 'package:flutter/material.dart';
import 'package:tablas_de_verdad/const/conts.dart';
import 'package:tablas_de_verdad/models/Step.dart';
import 'package:tablas_de_verdad/models/TruthTable.dart';

class StepByStepScreen extends StatefulWidget {
  final TruthTable table;
  StepByStepScreen({@required this.table});

  @override
  _StepByStepScreenState createState() => _StepByStepScreenState();
}

class _StepByStepScreenState extends State<StepByStepScreen> {
  
  bool _isLoading = false;

  void setIsLoading(bool val){
    setState(() {
      _isLoading = val;
    });
  }

  @override
  void initState() {
    setIsLoading(true);
    widget.table.getSteps(widget.table.postfix);
    print("Cantidad de pasos ${widget.table.steps.length}");
    for(int i = 0; i < widget.table.steps.length; i++){
      var s = widget.table.steps[i];
      print("${i+1} .- $s");
    }
    setIsLoading(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body(){
    if(_isLoading){
      return _renderLoading();
    }

    return Container(child: Text("Step by step"),);
  }


  Widget _renderLoading(){
    return Container(
      child: Center(child: CircularProgressIndicator(
         valueColor: new AlwaysStoppedAnimation<Color>(kMainColor),
      ),),
    );
  }
  

}