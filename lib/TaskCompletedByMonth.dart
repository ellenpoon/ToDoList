import 'package:flutter/material.dart';

class TaskCompletedByMonth extends StatefulWidget {
  @override
  _TaskCompletedByMonth createState() => _TaskCompletedByMonth();

  TaskCompletedByMonth({Key key}) : super(key: key);
}

class _TaskCompletedByMonth extends State<TaskCompletedByMonth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Task Completed in Oct"),
        //  backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Text('Hi'),
    );
  }
}
