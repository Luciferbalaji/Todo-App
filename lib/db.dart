import 'package:hive_flutter/adapters.dart';

import 'package:hive_flutter/hive_flutter.dart';

class database{

  List tooodo = [];
  final _mybox = Hive.box('my box');
   void initialstate(){
      tooodo = [
    ['make a list', true]
  ];
     
   }


   void load(){
    tooodo = _mybox.get("TODO");
   }


   void update(){
     _mybox.put("TODO", tooodo);
   }
}