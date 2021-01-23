import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tablas_de_verdad/const/conts.dart';
import 'package:tablas_de_verdad/models/operators.dart';
import 'package:tablas_de_verdad/provider/AppProvider.dart';
import 'package:tablas_de_verdad/widgets/ButtonWidget.dart';
import 'package:tablas_de_verdad/widgets/DisplayWidget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AppProvider appProvider;
  final double SPACE_BETWEEN_ROWS = 10.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      appProvider = context.read<AppProvider>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      child: Column(
        children: [
          Display(),
          _buttonContainer(),
        ],
      ),
    );
  }

  Widget _buttonContainer() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                offset: Offset(-4, -4),
                color: Colors.black12,
                blurRadius: 5.0,
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(
                  icon: FontAwesomeIcons.backspace,
                  onTap: handleClickButton,
                  label: REMOVE_LETTER,
                ),
                Button(onTap: handleClickButton, label: "(", isOperator: true),
                Button(onTap: handleClickButton, label: ")", isOperator: true),
                Button(
                    onTap: handleClickButton,
                    label: Operators.ABC,
                    isOperator: true),
                Button(
                    onTap: handleClickButton, label: "MODE", isOperator: true),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(
                    icon: FontAwesomeIcons.trash,
                    onTap: handleClickButton,
                    label: CLEAR_INPUT),
                Button(onTap: handleClickButton, label: "[", isOperator: true),
                Button(onTap: handleClickButton, label: "]", isOperator: true),
                Button(onTap: handleClickButton, label: "{", isOperator: true),
                Button(onTap: handleClickButton, label: "}", isOperator: true),
              ],
            ),
            _rowLettersWithOperator("A", "B", "C", "D", Operators.NOT),
            _rowLettersWithOperator("E", "F", "G", "H", Operators.NOT2),
            _rowLettersWithOperator("I", "J", "K", "L", Operators.OR),
            _rowLettersWithOperator("M", "N", "O", "P", Operators.AND),
            _rowLettersWithOperator("Q", "R", "S", "T", Operators.BICODICIONAL),
            _rowLettersWithOperator("U", "V", "W", "X", Operators.CODICIONAL),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(onTap: handleClickButton, label: "Y"),
                Button(onTap: handleClickButton, label: "Z"),
                Button(
                    onTap: handleClickButton,
                    label: Operators.ANTICODICIONAL,
                    isOperator: true),
                Button(
                    onTap: handleClickButton,
                    label: Operators.ANTICODICIONAL,
                    isOperator: true),
                Button(
                    onTap: handleClickButton,
                    label: Operators.EQUAL,
                    isOperator: true),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void handleClickButton(String label) {
    if (label == CLEAR_INPUT) {
      appProvider.clearInput();
    } else if (label == REMOVE_LETTER) {
      appProvider.removerLetter();
    } else {
      appProvider.addLeter(label);
    }
  }

  Widget _rowLetters(String a, String b, String c, String d) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Button(onTap: handleClickButton, label: a),
        Button(onTap: handleClickButton, label: b),
        Button(onTap: handleClickButton, label: c),
        Button(onTap: handleClickButton, label: d),
      ],
    );
  }

  Widget _rowLettersWithOperator(
      String a, String b, String c, String d, String oper) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Button(onTap: handleClickButton, label: a),
        Button(onTap: handleClickButton, label: b),
        Button(onTap: handleClickButton, label: c),
        Button(onTap: handleClickButton, label: d),
        Button(onTap: handleClickButton, label: oper, isOperator: true),
      ],
    );
  }
}
