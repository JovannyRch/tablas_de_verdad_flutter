import 'package:credit_card/credit_card_form.dart';
import 'package:credit_card/credit_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tablas_de_verdad/const/conts.dart';
import 'package:tablas_de_verdad/models/TarjetaCredito.dart';
import 'package:tablas_de_verdad/provider/AppProvider.dart';

class CreditCardMethod extends StatefulWidget {

  @override
  _CreditCardMethodState createState() => _CreditCardMethodState();
}

class _CreditCardMethodState extends State<CreditCardMethod> {
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
          CREDIT_CARD[appProvider.language],
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

  Widget _body(){
    TarjetaCredito tarjetaCredito = tarjetas.first;
    return CreditCardWidget(
      cardNumber: tarjetaCredito.cardNumber,
      cvvCode: tarjetaCredito.cvv,
      showBackView: false,
      cardHolderName: tarjetaCredito.cardHolderName,
      expiryDate: tarjetaCredito.expiracyDate,
    );
  }
}