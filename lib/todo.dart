// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class TodoTile extends StatelessWidget {
  final String task;
  final bool taskCompleted;
  final ValueChanged<bool?>? onChanged;
  Function(BuildContext)?deletefunction;

  TodoTile({
    Key? key,
    required this.task,
    required this.taskCompleted,
    required this.onChanged,
    required this.deletefunction
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child:  Slidable
      (
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(onPressed: deletefunction,
          icon: Icons.delete,
          backgroundColor: const Color.fromARGB(255, 174, 41, 41),)
        ]),
        child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children:  [
                Checkbox (
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                ),
                Text(task,style: TextStyle(fontWeight: FontWeight.w500,
                decoration:  taskCompleted? TextDecoration.lineThrough : TextDecoration.none
              
                ),),
              ],
            ),
          ),
      ),
    
    );
  }
}