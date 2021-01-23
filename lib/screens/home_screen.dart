import 'package:flutter/material.dart';
import 'package:tablas_de_verdad/widgets/DisplayWidget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String input = "A+B";

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
          Display(input: input),
          _buttonContainer(),
        ],
      ),
    );
  }

  Widget _buttonContainer() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(offset: Offset(-1,-1),color: Colors.black12),
          
          ]
        ),
      ),
    );
  }
}
