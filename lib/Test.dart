import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Class/to_do_item.dart';
import 'To Do List.dart';

class ShowImage extends StatefulWidget {
  @override
  _ShowImage createState() => _ShowImage();

  ShowImage({Key key}) : super(key: key);
}

class _ShowImage extends State<ShowImage> {
  // var todolistlen = 0;
  // List<ToDoItem> todoList_Completed = List<ToDoItem>();
  double valueonchange = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("ShowImage"),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => MyHomePage())),
            )
            // backgroundColor: Colors.deepPurpleAccent,
            ),
        body: Center(
            child: Column(children: [
          Container(
            width: 300,
            height: 300,
            child: ListView(
              children: <Widget>[
                Container(
                  width: 200,
                  height: 150,
                  child: Image.asset('cat1.jpg'),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    border: Border.all(color: Colors.orange),
                    borderRadius: (BorderRadius.all(Radius.circular(0))),
                  ),
                ),
                Container(
                  width: 100,
                  height: 50,
                  child: Text('Cat 1'),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      border: Border.all(color: Colors.grey),
                      borderRadius:
                          (BorderRadius.all(Radius.elliptical(20, 20)))),
                ),
              ],
            ),
          ),
          RaisedButton(
            child: Text('test'),
            onPressed: () {
              print(DateTime.now().toString()[11] +
                  DateTime.now().toString()[12]);
            },
          ),

          ListView.builder(
              itemCount: listview_end - listview_start,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: ListTile(
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {});
                        }),
                  ),
                );
              })
          // Slider(
          //   min: 1,
          //   max: 10,
          //   divisions: 9,
          //   value: valueonchange,
          //
          //      onChanged: setState(){ valueonchange = newValue;},
          // )
        ])));
  }
}
