import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tablas_de_verdad/const/conts.dart';
import 'package:tablas_de_verdad/provider/AppProvider.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String dropdownValue = 'es';
  AppProvider appProvider;
  @override
  Widget build(BuildContext context) {
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
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text(appProvider.messages.LANGUAGE[appProvider.language]),
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
                    appProvider.language  = newValue;
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
          ],
        ),
      ),
    );
  }
}
