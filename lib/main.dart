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
  UserPrefences userPrefrences = new UserPrefences();
  await userPrefrences.initPrefs();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppProvider(userPrefrences.language,
              userPrefrences.isShow01s, userPrefrences.isDarkMode, userPrefrences.isBasic),
        ),
      ],
      child: MyApp(userPrefrences.language, userPrefrences.isShow01s,
          userPrefrences.isDarkMode),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String lang;
  final bool isShow01s;
  final bool isDarkMode;

  MyApp(this.lang, this.isShow01s, this.isDarkMode);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<AppProvider>(context).currentTheme??ThemeData.light();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: TITLE_APP,
      home: HomeScreen(),
    );
  }
}

/*
return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider(lang, isShow01s, isDarkMode)),
      ],
      
    );
*/
