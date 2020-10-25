import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoPickerTest extends StatefulWidget {
  @override
  _CupertinoPickerTest createState() => _CupertinoPickerTest();

  CupertinoPickerTest({
    Key key,
  }) : super(key: key);
}

class _CupertinoPickerTest extends State<CupertinoPickerTest> {
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Colors.blue,
        ),
        child: Center(
          child: Container(
            height: 200,
            width: 200,
            child: CupertinoPicker(
              itemExtent: 50,
              onSelectedItemChanged: (int index) {
                print(index);
              },
              children: <Widget>[
                Text("item1"),
                Text("item2"),
                Text("item3"),
                Text("item4"),
                Text("item5"),
              ],
            ),
          ),
        ));
  }
}
