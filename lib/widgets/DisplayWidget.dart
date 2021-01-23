import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String input;


  Display({@required this.input});
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Container(
      height: _size.height * 0.25,
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 10.0, right: 20.0),
      decoration: BoxDecoration(

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            this.input,
            style: TextStyle(
              fontSize: 45.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
