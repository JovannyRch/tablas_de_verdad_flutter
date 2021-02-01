import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tablas_de_verdad/const/conts.dart';
import 'package:tablas_de_verdad/models/TruthTable.dart';
import 'package:tablas_de_verdad/provider/AppProvider.dart';
import 'package:tablas_de_verdad/screens/step_by_step_screen.dart';
import 'package:tablas_de_verdad/services/Admob.dart';

import 'package:tablas_de_verdad/widgets/TableWidget.dart';

class ResultScreen extends StatefulWidget {
  final TruthTable table;

  ResultScreen({this.table});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool isLoading = false;
  double boxWidth = 60.0;
  Size size;
  AppProvider appProvider;
/*   AdmobInterstitial interstitialAd; */

//Ads
  //Ads
  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;

  @override
  void initState() {
    calculate();
    showAd();
    FirebaseAdMob.instance.initialize(appId: AdmobService.getAdmobId());
    _bannerAd = AdmobService.createBannerAdd()..load();
    _interstitialAd = AdmobService.createInterstitialAd()..load();
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    super.dispose();
  }

  void showAd() {
    /*  interstitialAd = AdmobInterstitial(
      adUnitId: AdmobService.videoId(),
    );
    interstitialAd.load(); */
  }

  void calculate() {
    setIsLoading(true);
    widget.table.calculate();
    setIsLoading(false);
  }

  void calculateBoxWidth() {
    if (widget.table.variables.length > 6) {
      boxWidth = 30.0;
    } else {
      boxWidth = size.width / (widget.table.variables.length ?? 1);
    }
  }

  void setIsLoading(bool val) {
    setState(() {
      isLoading = val;
    });
  }

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
          RESULT_LABEL[appProvider.language],
          style: TextStyle(
            color: kMainColor,
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: [],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: handleStepByStepClickButton,
        icon: FaIcon(FontAwesomeIcons.tasks),
        label: Text(STEP_BY_STEP_LABEL[appProvider.language]),
        backgroundColor: kMainColor,
      ),
      body: _body(),
    );
  }

  void handleStepByStepClickButton() {
     _interstitialAd?.show().then((value) => _interstitialAd = AdmobService.createInterstitialAd()..load());
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => StepByStepScreen(
          table: widget.table,
        ),
      ),
    );
  }

  Widget _body() {
    if (isLoading) return _loader();

    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            _inputLabel(),
            SizedBox(height: 10.0),
            _typeLabel(),
            SizedBox(height: 20.0),
            _table(),
          ],
        ),
      ),
    );
  }

  Widget _inputLabel() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            EXPRESSION_LABEL[appProvider.language],
            textAlign: TextAlign.left,
            style: TextStyle(
              color: kLabelColor,
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: kMainColor.withOpacity(0.12),
            ),
            child: Center(
              child: Text(
                "${widget.table.initialInfix}",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _typeLabel() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 5.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10.0),
          Text(
            EVALUATION_LABEL[appProvider.language],
            textAlign: TextAlign.left,
            style: TextStyle(
              color: kLabelColor,
            ),
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(top: 8.0),
                decoration: BoxDecoration(
                  color: kMainColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Text(
                    "${widget.table.tipo}",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              /*   Positioned(
                right: 0.0,
                top: 5.0,
                child: IconButton(
                    icon: Icon(
                      Icons.help,
                      color: kMainColor.withOpacity(0.8),
                    ),
                    onPressed: handleEvaluationHelp),
              ) */
            ],
          ),
        ],
      ),
    );
  }

  void handleEvaluationHelp() {}

  Widget _loader() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _table() {
    if (widget.table.steps.length == 0) {
      return Center(child: Text("No steps"));
    }

    return TableWidget(
      title: FINAL_TABLE_LABEL[appProvider.language],
      table: widget.table,
      columsKeys: [
        ...widget.table.variables,
      ],
      resultColumnKey: widget.table.steps.last.toString(),
    );
  }
}
