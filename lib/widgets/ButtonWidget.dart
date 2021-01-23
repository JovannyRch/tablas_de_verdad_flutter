import 'package:flutter/material.dart';
import 'package:tablas_de_verdad/const/conts.dart';

class Button extends StatelessWidget {
  final String label;
  final Function(String) onTap;
  final IconData icon;


  Button({this.label,@required this.onTap, this.icon});
  double radius  = 50.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: radius,
        width: radius,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kMainColor.withOpacity(0.2),
        ),
        child: Center(
          child: _renderBody(),
        ),
      ),
    );
  }

  Widget _renderBody(){
    if(icon != null){
      return Icon(icon);
    }
    return Text(label);
  }
}
