import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tablas_de_verdad/const/conts.dart';
import 'package:tablas_de_verdad/models/RowTable.dart';
import 'package:tablas_de_verdad/models/TruthTable.dart';
import 'package:tablas_de_verdad/provider/AppProvider.dart';

class TableWidget extends StatelessWidget {
  final String title;
  final TruthTable table;
  final List<String> columsKeys;
  final String resultColumnKey;
  TableWidget(
      {@required this.title,
      @required this.table,
      @required this.columsKeys,
      @required this.resultColumnKey});

  AppProvider appProvider;

  @override
  Widget build(BuildContext context) {
    appProvider = Provider.of<AppProvider>(context);
    return _table();
  }

  Widget _table() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.only(bottom: 100.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          title.isNotEmpty?Text(
            title,
            style: TextStyle(
              color: kLabelColor,
            ),
          ):Container(),
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
                    _header(columsKeys, RESULT_LABEL),
                    ...renderRows(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> renderRows() {
    List<Widget> rows = [];
    for (int i = 0; i < table.totalRows; i++) {
      String combination = "";
      for (int j = 0; j < columsKeys.length; j++) {
        combination += table.columns[columsKeys[j]][i];
      }
      String result = table.columns[resultColumnKey][i];
      rows.add(
          _rowTable(new RowTable(index: i, combination: combination, result: result)));
    }
    return rows;
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
          _box(label, fontSize: 8.0, isHeader: true)
        ],
      ),
    );
  }

  Widget _box(String label,
      {double fontSize = 17.0,
      bool isHeader = false,
      bool isFocus = false,
      bool isResultado = false}) {
    return Container(
      width: 50.0,
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
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: fontSize,
        ),
      )),
    );
  }
}
