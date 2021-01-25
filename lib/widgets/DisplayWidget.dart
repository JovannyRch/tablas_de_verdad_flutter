import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tablas_de_verdad/provider/AppProvider.dart';

class Display extends StatelessWidget {
 


  Display();
  Size _size;
  AppProvider appProvider;

  @override
  Widget build(BuildContext context) {
    appProvider = Provider.of<AppProvider>(context);
    _size = MediaQuery.of(context).size;
    return Container(
      height: 150.0,
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 10.0, right: 20.0),
      decoration: BoxDecoration(

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            appProvider.input,
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
