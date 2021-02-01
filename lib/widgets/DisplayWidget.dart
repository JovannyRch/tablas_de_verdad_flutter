import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tablas_de_verdad/const/conts.dart';
import 'package:tablas_de_verdad/provider/AppProvider.dart';
import 'package:tablas_de_verdad/screens/settings_screen.dart';

class Display extends StatelessWidget {
  Display();
  Size _size;
  AppProvider appProvider;

  @override
  Widget build(BuildContext context) {
    appProvider = Provider.of<AppProvider>(context);
    _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: [
          Container(
            height: _size.height * 0.25,
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 10.0, right: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  appProvider.input,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 45.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10.0,
            child: IconButton(
              icon: FaIcon(
                FontAwesomeIcons.cog,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => SettingsScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
