
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:job_app/home.dart';



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

