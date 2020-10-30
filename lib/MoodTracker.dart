import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoodTracker extends StatefulWidget {
  @override
  _MoodTracker createState() => _MoodTracker();

  MoodTracker({
    Key key,
  }) : super(key: key);
}

class _MoodTracker extends State<MoodTracker> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mood Tracker"),
      ),
      body: Center(),
    );
  }
}
