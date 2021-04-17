import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tablas_de_verdad/const/conts.dart';
import 'package:tablas_de_verdad/provider/AppProvider.dart';
import 'package:tablas_de_verdad/screens/pro/payment_method.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
class ProDetailScreen extends StatelessWidget {
  AppProvider appProvider;
  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kMainColor, //change your color here
        ),
        title: Text(
          CHECKOUT_LABEL[appProvider.language],
          style: TextStyle(
            color: kMainColor,
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: [],
        elevation: 0,
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _summaryContainer(),
          SizedBox(height: 15.0),
          _buttonPayment(context),
        ],
      ),
    );
  }

  Widget _buttonPayment(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      onPressed: () {
        handleCompletePaymentButton(context);
      },
      color: kMainColor,
      child: Text(
        "Complete payment",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  void handleCompletePaymentButton(BuildContext context) {
    
  }

  Widget _summaryContainer() {
    return Container(
      height: size.height * 0.5,
      width: size.width * 0.75,
      decoration: BoxDecoration(
        color: kDisableColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FaIcon(
            FontAwesomeIcons.gem,
            color: kMainColor,
            size: 35.0,
          ),
          SizedBox(height: 10.0),
          Text(
            "Summary",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                _renderFeature("Remove ads"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _renderFeature(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(FontAwesomeIcons.star),
        SizedBox(width: 10.0),
        Text(
          text,
          style: TextStyle(fontSize: 16.0),
        )
      ],
    );
  }
}
