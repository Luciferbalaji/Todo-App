import 'package:Todo/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';



class dailog extends StatelessWidget {
  final  controller;
   VoidCallback onsave;
   VoidCallback oncancel;
dailog({super.key,required this.controller,required this.onsave,required this.oncancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 140,
        child:  Column(
          children: [
            TextField(

              controller: controller,
              
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
              //

            ),
            SizedBox(height:10,),
            //
            Row(
              children: [

              Button(text: 'Add', onpressed: onsave,),
              SizedBox(width: 50,),
            
              Button(text: 'Cancel', onpressed: oncancel)  
              ],
            )
          ],
        ),
      ),
    );
  }
}