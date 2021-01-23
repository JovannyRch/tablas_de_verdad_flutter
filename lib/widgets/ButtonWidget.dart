import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tablas_de_verdad/const/conts.dart';
import 'package:tablas_de_verdad/models/operators.dart';
import 'package:tablas_de_verdad/provider/AppProvider.dart';

class Button extends StatelessWidget {
  final String label;
  final Function(String) onTap;
  final IconData icon;
  final bool isOperator;
  final bool isExpanded;

  AppProvider appProvider;

  Button(
      {this.label, @required this.onTap, this.icon, this.isOperator = false, this.isExpanded = false});
  double radius = 55.0;

  @override
  Widget build(BuildContext context) {
    appProvider = Provider.of<AppProvider>(context);
    return GestureDetector(
      onTap: () {
        onTap(label);
      },
      child: Container(
       /*  margin: EdgeInsets.only(right: 5.0), */
        height: radius,
        width: isExpanded? radius*2.3:radius,
        decoration: BoxDecoration(
          shape: isExpanded?BoxShape.rectangle: BoxShape.circle,
            color: _getBgColor(),
            borderRadius: isExpanded?BorderRadius.circular(20.0):null,
            boxShadow: [
              BoxShadow(
                offset: Offset(2, 1),
                color: Colors.black.withOpacity(0.1),
                blurRadius: 3.0,
              ),
            ]),
        child: Center(
          child: _renderBody(),
        ),
      ),
    );
  }

  Widget _renderBody() {
    if (icon != null) {
      return FaIcon(
        icon,
        size: 18.0,
        color: kMainColor,
      );
    }
    return Text(
      appProvider.isUppercase ? label.toUpperCase() : label.toLowerCase(),
      style: TextStyle(
        color: getColorText(),
        fontWeight: isOperator ? FontWeight.w800 : FontWeight.w600,
        fontSize: getFontSize(),
      ),
    );
    
  }

  Color getColorText(){
    
    if(label == Operators.EQUAL){
      return Colors.white;
    }

    if(isOperator){
      return kMainColor;
    }

    return Colors.black54;
  }

  double getFontSize(){
    if(label == Operators.MODE){
      return 14.0;
    }

    if(label == Operators.ABC){
      return 14.0;
    }
    return 25.0;
  }

  Color _getBgColor() {
    if (label == CLEAR_INPUT) {
      return kSecondaryColor;
    }

    if (label == REMOVE_LETTER) {
      return kSecondaryColor;
    }
    if(label == Operators.EQUAL){
      return kMainColor;
    }



    if (isOperator) {
      return Colors.white;
    }

    return Colors.white;
  }
}
