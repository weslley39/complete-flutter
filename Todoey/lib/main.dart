import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/providers/Task.dart';
import 'package:todoey/screens/Tasks.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => TaskProvider(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
