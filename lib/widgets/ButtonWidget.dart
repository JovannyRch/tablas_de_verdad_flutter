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
      {this.label,
      @required this.onTap,
      this.icon,
      this.isOperator = false,
      this.isExpanded = false});
  double radius = 40.0;

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
        width: isExpanded ? radius * 2.3 : radius,
        decoration: BoxDecoration(
            shape: isExpanded ? BoxShape.rectangle : BoxShape.circle,
            color: _getBgColor(),
            borderRadius: isExpanded ? BorderRadius.circular(20.0) : null,
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
        color: label == Operators.MODE.value? Colors.white:kMainColor,
      );
    }
    return Text(
      _getText(),
      style: TextStyle(
        color: getColorText(),
        fontWeight: isOperator ? FontWeight.w800 : FontWeight.w600,
        fontSize: getFontSize(),
      ),
    );
  }

  String _getText() {
    if (label == Operators.FALSE.value ||
        label == Operators.TRUE.value ||
        label == Operators.MODE.value) {
      return label;
    }

    if (label == Operators.ABC.value) {
      if (!appProvider.isUppercase) {
        return label.toUpperCase();
      } else {
        return label.toLowerCase();
      }
    }

    if (appProvider.isUppercase) {
      return label.toUpperCase();
    } else {
      return label.toLowerCase();
    }
  }

  Color getColorText() {
    if (label == Operators.EQUAL.value ||
        label == Operators.FALSE.value ||
        label == Operators.TRUE.value) {
      return Colors.white;
    }
    if (isOperator) {
      return kMainColor;
    }

    return appProvider.isDarkMode? Colors.grey.shade200:Colors.black54;
  }

  double getFontSize() {
    if (label == Operators.MODE.value || label == Operators.ABC.value) {
      return 14.0;
    }

    if (label == Operators.FALSE.value || label == Operators.TRUE.value) {
      return 10.0;
    }

    return 25.0;
  }

  Color _getBgColor() {
    if (label == CLEAR_INPUT || label == REMOVE_LETTER) {
      return appProvider.isDarkMode? Colors.grey.shade800:kSecondaryColor;
    }

    if (label == Operators.EQUAL.value) {
      return kMainColor;
    }

    if (label == Operators.TRUE.value) {
      return appProvider.isDarkMode? Colors.green.shade900:Colors.green;
    }

    if (label == Operators.FALSE.value) {
      return appProvider.isDarkMode? Colors.red.shade900:Colors.red;
    }

    if(label == Operators.MODE.value){
      return kMainColor; 
    }

    if (isOperator) {
      return appProvider.isDarkMode? Colors.grey.shade800:Colors.white;
    }

    return appProvider.isDarkMode? Colors.grey.shade800:Colors.white;
  }
}
