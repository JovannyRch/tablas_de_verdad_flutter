import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tablas_de_verdad/const/conts.dart';
import 'package:tablas_de_verdad/provider/AppProvider.dart';
import 'package:tablas_de_verdad/screens/pro/credit_card_method.dart';

class PaymentMethod extends StatefulWidget {
  PaymentMethod({Key key}) : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
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
          PAYMENT_LABEL[appProvider.language],
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _renderPaymentMethod(FaIcon(FontAwesomeIcons.creditCard), "Credit Card",
            handleCreditCard),
        _renderPaymentMethod(
            FaIcon(FontAwesomeIcons.googlePay), "Google Pay", handleCreditCard),
      ],
    );
  }

  void handleCreditCard() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreditCardMethod()),
    );
  }

  Widget _renderPaymentMethod(FaIcon icon, String title, Function f) {
    return Center(
      child: GestureDetector(
        onTap: f,
        child: Container(
          height: 50.0,
          width: 300.0,
          margin: EdgeInsets.only(bottom: 20.0, left: 10.0, right: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: kMainColor, width: 1.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              icon,
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
