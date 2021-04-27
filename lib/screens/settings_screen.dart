import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tablas_de_verdad/const/conts.dart';
import 'package:tablas_de_verdad/provider/AppProvider.dart';
import 'package:tablas_de_verdad/shared/UserPreferences.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  AppProvider appProvider;
  UserPrefences userPrefences = new UserPrefences();
  String dropdownValue;
  Size _size;

  @override
  Widget build(BuildContext context) {
    dropdownValue = userPrefences.language;
    _size = MediaQuery.of(context).size;
    appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kMainColor, //change your color here
        ),
        title: Text(
          appProvider.messages.SETTINGS[appProvider.language],
          style: TextStyle(
            color: kMainColor,
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: [],
        elevation: 0,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    var container = Container(
      height: _size.height,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text(appProvider.messages.LANGUAGE[appProvider.language]),
              leading: FaIcon(FontAwesomeIcons.language),
              trailing: DropdownButton<String>(
                value: dropdownValue,
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 1,
                  color: kMainColor,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                    userPrefences.language = newValue;
                    appProvider.language = newValue;
                  });
                },
                items: <String>['en', 'es']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.arrowUp),
              title: Text(ADVANCE_MODE_LABEL[appProvider.language]),
              trailing: Switch(
                activeColor: kMainColor,
                value: !appProvider.isBasic,
                onChanged: (value) {
                  appProvider.isBasic = !value;
                  userPrefences.isBasic = !value;
                },
              ),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.moon),
              title: Text(DARK_MODE_LABEL[appProvider.language]),
              trailing: Switch(
                activeColor: kMainColor,
                value: appProvider.isDarkMode,
                onChanged: (value) {
                  appProvider.isDarkMode = value;
                  userPrefences.isDarkMode = value;
                },
              ),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.table),
              title: Text(SHOW_01s_LABEL[appProvider.language]),
              trailing: Switch(
                activeColor: kMainColor,
                value: appProvider.is0sAnd1s,
                onChanged: (value) {
                  appProvider.is0sAnd1s = value;
                  userPrefences.isShow01s = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
    return Stack(
      children: [
        container,
        IS_PRO_VERSION
            ? Container()
            : Positioned(
                left: 10.0,
                bottom: 55.0,
                child: RaisedButton(
                  color: Colors.green,
                  child: Row(children: [
                    FaIcon(
                      FontAwesomeIcons.ticketAlt,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      NO_ADS_LABEL[appProvider.language],
                      style: TextStyle(),
                    )
                  ]),
                  onPressed: () async {
                    final Uri _emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: 'jovannyrch@gmail.com',
                        queryParameters: {
                          'subject': NO_ADS_SUBJECT[appProvider.language]
                        });
                    await launch(_emailLaunchUri.toString());
                  },
                ),
              ),
       /*  IS_PRO_VERSION
            ? Container()
            : Positioned(
                left: 10.0,
                bottom: 10.0,
                child: RaisedButton(
                  child: Row(children: [
                    FaIcon(
                      FontAwesomeIcons.paypal,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      DONATE_LABEL[appProvider.language],
                      style: TextStyle(),
                    )
                  ]),
                  onPressed: () async {
                    const url = "https://paypal.me/jovannyrch";
                    await launch(url);
                  },
                ),
              ), */
        Positioned(
          right: 10.0,
          bottom: 10.0,
          child: GestureDetector(
            child: Text(
              "www.jovannyrch.com",
              style: TextStyle(
                letterSpacing: 2.5,
              ),
            ),
            onTap: () async {
              const url = "https://www.jovannyrch.com/";
              await launch(url);
            },
          ),
        )
      ],
    );
  }
}
