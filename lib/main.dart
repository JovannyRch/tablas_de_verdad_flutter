/* import 'package:admob_flutter/admob_flutter.dart'; */
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tablas_de_verdad/const/conts.dart';
import 'package:tablas_de_verdad/provider/AppProvider.dart';
import 'package:tablas_de_verdad/screens/home_screen.dart';
import 'package:tablas_de_verdad/shared/UserPreferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   UserPrefences userPrefrences= new UserPrefences();
   await userPrefrences.initPrefs();
   await Firebase.initializeApp();
  /* Admob.initialize(); */
  runApp(MyApp(userPrefrences.language));
}

class MyApp extends StatelessWidget {
  final String lang;
  
  MyApp(this.lang);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider(lang)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: TITLE_APP,
        home: HomeScreen(),
      ),
    );
  }
}
