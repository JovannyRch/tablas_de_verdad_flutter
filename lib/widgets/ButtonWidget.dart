import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final Function onTap;
  Button({@required this.label, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Center(
          child: Text(label),
        ),
      ),
    );
  }
}
