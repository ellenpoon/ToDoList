import 'package:flutter/material.dart';
import 'Class/to_do_item.dart';
import 'Scheduler.dart';
import 'Task Completed.dart';
import 'To Do List.dart';
import 'package:flutter/foundation.dart';

Color listtile_background = const Color.fromRGBO(55, 55, 55, 1.0);
Color listtile_background2 = const Color.fromRGBO(65, 65, 65, 1.0);
Color listtile_highlighted = const Color.fromRGBO(30, 0, 30, 1.0);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        //accentColor: Colors.cyan[600],
        accentColor: Color.fromRGBO(245, 245, 245, 1.0),
        appBarTheme: AppBarTheme(
            centerTitle: true,
            color: Colors.black54,
            textTheme: TextTheme(
              title: TextStyle(
                  color: Colors.orange,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                  wordSpacing: 3.0),
            )),
        //buttonTheme: ,
        // Define the default font family.
        fontFamily: 'Herculanum',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(
              color: Colors.orange,
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
              wordSpacing: 3.0,
              fontFamily: 'Hind'),
          bodyText2: TextStyle(fontSize: 16.0, fontFamily: 'Hind'),
        ),
      ),
      home: MyHomePage(title: 'To Do List'),
    );
  }
}
