
import 'package:Todo/home.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';



void main() async {
   await Hive.initFlutter();
  var box = await Hive.openBox('my box');


  runApp(MyApp());
}


class MyApp extends StatelessWidget {
   MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(backgroundColor: Colors.grey),      
      home: SigiPage(),
    );
  }
} 


