import 'package:flutter/material.dart';

class SwipeToDel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CircleWidgets();
  }
}

class CircleWidgets extends State<SwipeToDel> {
  List items = getDummyList();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Dismissible(
          direction: DismissDirection.endToStart,
          key: Key(items[index]),
          background: Container(
            alignment: AlignmentDirectional.centerEnd,
            color: Colors.red,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
          onDismissed: (direction) {
            setState(() {
              items.removeAt(index);
            });
          },
          child: Container(
            height: 50.0,
            decoration: BoxDecoration(border: Border.all(width: 1.0)),
            padding: EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Text(
                  items[index],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                )
              ],
            ),
          ),
        );
      },
    ));
  }

  static List getDummyList() {
    List list = List.generate(10, (i) {
      return "Item ${i + 1}";
    });
    return list;
  }
}
