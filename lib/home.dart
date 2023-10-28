import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:job_app/dailog.dart';
import 'package:job_app/db.dart';
import 'package:job_app/todo.dart';

class SigiPage extends StatefulWidget {
  SigiPage({Key? key}) : super(key: key);

  @override
  State<SigiPage> createState() => _SigiPageState();
}

class _SigiPageState extends State<SigiPage> {
  final _mybox = Hive.box('my box');
  database db = database();
  bool isDarkMode = false;
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (_mybox.isEmpty) {
      db.tooodo = []; // Initialize db.tooodo as an empty list if _mybox is empty
    } else {
      db.load();
    }
  }

  void onChanged(bool? value, int index) {
    setState(() {
      db.tooodo[index][1] = value ?? false;
    });
    db.update();
  }

  void _onsave() {
    setState(() {
      db.tooodo.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void alert() {
    showDialog(
      context: context,
      builder: (context) {
        return dailog(
          controller: _controller,
          onsave: _onsave,
          oncancel: () => Navigator.of(context).pop(),
        );
      },
    );
    db.update();
  }

  void deltetask(int index) {
    setState(() {
      db.tooodo.removeAt(index);
    });
    db.update();
  }

  @override
Widget build(BuildContext context) {
  return MaterialApp(
    theme: ThemeData(
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      appBarTheme: AppBarTheme(
        backgroundColor: isDarkMode ? Colors.grey[800] : Colors.grey,
      ),
    ),
    home: Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'TO-DO',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        actions: [
          Switch(
            value: isDarkMode,
            onChanged: (value) {
              setState(() {
                isDarkMode = value;
              });
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: alert,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.tooodo.length,
        itemBuilder: (context, index) {
          return TodoTile(
            task: db.tooodo[index][0],
            taskCompleted: db.tooodo[index][1],
            onChanged: (value) => onChanged(value, index),
            deletefunction: (context) => deltetask(index),
          );
        },
      ),
    ),
  );
}
}