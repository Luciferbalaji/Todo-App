import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  VoidCallback onpressed;
   Button({super.key, required this.text,required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onpressed,
    child: Text(text),
    color: Colors.blueAccent,
    
    );
  }
}