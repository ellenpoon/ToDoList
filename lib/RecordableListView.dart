import 'package:flutter/material.dart';

class RecordableListView extends StatefulWidget {
  RecordableListView({Key key}) : super(key: key);

  @override
  _RecordableListView createState() => _RecordableListView();
}

class _RecordableListView extends State<RecordableListView> {
  var data = [
    "Hey",
    "What's",
    "Up",
    "Dude",
    "This",
    "is",
    "a",
    "Flutter",
    "example",
    "got",
    "it"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter ListView Example'),
      ),
      body: Container(
          child: ReorderableListView(
        onReorder: (oldIndex, newIndex) {
          setState(() {
            _updateItems(oldIndex, newIndex);
          });
        },
        children: [
          for (final item in data)
            Container(
              key: ValueKey(item),
              height: 150,
              color: Colors.white,
              child:
                  Center(child: Text('$item', style: TextStyle(fontSize: 30))),
            )
        ],
      )),
    );
  }

  void _updateItems(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    final item = data.removeAt(oldIndex);
    data.insert(newIndex, item);
  }
}
