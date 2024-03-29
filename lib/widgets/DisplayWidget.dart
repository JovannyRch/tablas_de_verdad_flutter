import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:launch_review/launch_review.dart';
import 'package:provider/provider.dart';
import 'package:tablas_de_verdad/const/conts.dart';
import 'package:tablas_de_verdad/provider/AppProvider.dart';
import 'package:tablas_de_verdad/screens/pro/pro_details_screen.dart';
import 'package:tablas_de_verdad/screens/settings_screen.dart';

class Display extends StatelessWidget {
  Display();
  Size _size;
  AppProvider appProvider;
  TextEditingController _textFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    appProvider = Provider.of<AppProvider>(context);
    _size = MediaQuery.of(context).size;
    var review = GestureDetector(
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
    );

    var pro_version = GestureDetector(
      onTap: () {
        this.callProVersion(context);
      },
      child: Container(
        width: 100.0,
        padding: EdgeInsets.all(2.0),
        margin: EdgeInsets.only(top: 15.0, left: 10.0),
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
            FaIcon(
              FontAwesomeIcons.gem,
              size: 16.0,
              color: kMainColor,
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              "Pro",
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
    );

    return SafeArea(
      child: Stack(
        children: [
          Container(
            height: _size.height * 0.25,
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 10.0, right: 20.0),
            /*  decoration: BoxDecoration(
                  color: appProvider.isDarkMode?ThemeData.dark().backgroundColor: Colors.white,
                ), */
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  appProvider.input,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 45.0,
                    color: appProvider.isDarkMode
                        ? Colors.grey.shade200
                        : Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 50.0,
            child: IconButton(
              icon: FaIcon(
                FontAwesomeIcons.pen,
                size: 20.0,
                color: kMainColor,
              ),
              onPressed: handleOnClickEdit,
            ),
          ),
          Positioned(
            right: 10.0,
            child: IconButton(
              icon: FaIcon(
                FontAwesomeIcons.cog,
                size: 20.0,
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
            child: Row(
              children: [review, IS_PRO_VERSION ? Container() : pro_version],
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

  void handleOnClickEdit(){
    
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('TextField in Dialog'),
          content: TextField(
            onChanged: (value) {
     
            },
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "Text Field in Dialog"),
          ),
        );
      });
}

  void callProVersion(BuildContext context) {
    String proId = "com.jovannyrch.tablasdeverdad.es.pro";
    LaunchReview.launch(
      androidAppId: proId,
      iOSAppId: "585027354",
    );
  }
}
