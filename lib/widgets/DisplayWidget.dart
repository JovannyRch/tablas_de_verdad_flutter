import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:launch_review/launch_review.dart';
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
          Positioned(
            left: 10.0,
            child: GestureDetector(
              onTap: () {
                this.callReview();
              },
              child: Container(
                width: 150.0,
                padding: EdgeInsets.all(2.0),
                margin: EdgeInsets.only(top: 15.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kMainColor,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: kMainColor,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      RATE_LABEL[appProvider.language],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kMainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void callReview() {
    LaunchReview.launch(
      androidAppId: APP_ID,
      iOSAppId: "585027354",
    );
  }
}
