import 'package:flutter/material.dart';
import 'package:tablas_de_verdad/screens/home_screen.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tablas de Verdad',
      home: HomeScreen(),
    );
  }
}