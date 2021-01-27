import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tablas_de_verdad/const/conts.dart';
import 'package:tablas_de_verdad/models/RowTable.dart';
import 'package:tablas_de_verdad/models/TruthTable.dart';
import 'package:tablas_de_verdad/provider/AppProvider.dart';

class ResultScreen extends StatefulWidget {
  final TruthTable table;

  ResultScreen({this.table});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool isLoading = false;
  double boxWidth = 60.0;
  Size size;

  AppProvider appProvider;

  @override
  void initState() {
    calculate();
    super.initState();
  }

  void calculate() {
    setIsLoading(true);
    widget.table.calculate();
    setIsLoading(false);
  }

  void calculateBoxWidth(){
   if(widget.table.variables.length > 6){
     boxWidth = 30.0;
   }else{
        boxWidth = size.width/(widget.table.variables.length??1);
   }

  }

  void setIsLoading(bool val) {
    setState(() {
      isLoading = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: Text("Resultado"),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    if (isLoading) return _loader();

    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            _inputLabel(),
            SizedBox(height: 10.0),
            Text("La preposición es una: "),
            _typeLabel(),
            SizedBox(height: 20.0),
            _table(),
          ],
        ),
      ),
    );
  }

  Widget _inputLabel() {
    return Container(
      child: Text(
        "${widget.table.infix}",
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _typeLabel() {
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      child: Text(
        "${widget.table.tipo}",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18.0,
        ),
      ),
    );
  }

  Widget _loader() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _table() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
          child: Column(
        children: [
          _header(widget.table.variables, "Resultado"),
          ...widget.table.table.map((e) => _rowTable(e)).toList(),
        ],
      ),
    );
  }

  Widget _rowTable(RowTable row) {
    bool isFocus = row.index % 2 == 0;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        /*   _indexLabel("${row.index}"), */
          ...row.combination
              .split("")
              .map((e) => _box(showValue(e), isFocus: isFocus))
              .toList(),
          _box(showValue(row.result), isFocus: isFocus, isResultado: true),
        ],
      ),
    );
  }

  String showValue(String val){
    if(!appProvider.is0sAnd1s){
      if(val == "1"){
        return T;
      }
      return F;
    }
    
    return val;
  }

  Widget _header(List<String> variables, String label) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...variables.map((e) => _box(e, isHeader: true)).toList(),
          _box(label, fontSize: 12.0, isHeader: true)
        ],
      ),
    );
  }

  Widget _indexLabel(String index){
    return Container(
      child: Text(index),
    );
  }

  Widget _box(String label,
      {double fontSize = 17.0, bool isHeader = false, bool isFocus = false, bool isResultado = false}) {
    return Container(
      width: boxWidth,
      height: 40.0,
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
          color: isHeader
              ? kDisableColor
              : !isFocus
                  ? !isResultado? Colors.grey.shade200: kMainColor.withOpacity(0.25)
                  : !isResultado?Colors.transparent: kMainColor.withOpacity(0.1),
          border: Border.all(color: kMainColor.withOpacity(0.15))),
      child: Center(
          child: Text(
        "$label",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: fontSize,
        ),
      )),
    );
  }
}
