import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  void calculateBoxWidth() {
    if (widget.table.variables.length > 6) {
      boxWidth = 30.0;
    } else {
      boxWidth = size.width / (widget.table.variables.length ?? 1);
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
        title: Text(RESULT_LABEL),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: FaIcon(FontAwesomeIcons.tasks),
        label: Text(STEP_BY_STEP_LABEL),
        backgroundColor: kMainColor,
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
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            EXPRESSION_LABEL,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: kLabelColor,
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: kMainColor.withOpacity(0.12),
            ),
            child: Center(
              child: Text(
                "${widget.table.infix}",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _typeLabel() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 5.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10.0),
          Text(
            EVALUATION_LABEL,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: kLabelColor,
            ),
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(top: 8.0),
                decoration: BoxDecoration(
                  color: kMainColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Text(
                    "${widget.table.tipo}",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0.0,
                top: 5.0,
                child: IconButton(
                    icon: Icon(
                      Icons.help,
                      color: kMainColor.withOpacity(0.8),
                    ),
                    onPressed: handleEvaluationHelp),
              )
            ],
          ),
        ],
      ),
    );
  }

  void handleEvaluationHelp() {}

  Widget _loader() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _table() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.only(bottom: 100.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            FINAL_TABLE_LABEL,
            style: TextStyle(
              color: kLabelColor,
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _header(widget.table.variables, RESULT_LABEL),
                    ...widget.table.table.map((e) => _rowTable(e)).toList(),
                  ],
                ),
              ),
            ),
          ),
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

  String showValue(String val) {
    if (!appProvider.is0sAnd1s) {
      if (val == "1") {
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

  Widget _indexLabel(String index) {
    return Container(
      child: Text(index),
    );
  }

  Widget _box(String label,
      {double fontSize = 17.0,
      bool isHeader = false,
      bool isFocus = false,
      bool isResultado = false}) {
    return Container(
      width: boxWidth,
      height: 40.0,
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
          color: isHeader
              ? kDisableColor
              : !isFocus
                  ? !isResultado
                      ? Colors.grey.shade200
                      : kMainColor.withOpacity(0.25)
                  : !isResultado
                      ? Colors.transparent
                      : kMainColor.withOpacity(0.1),
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
