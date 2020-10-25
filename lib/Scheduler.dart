import 'package:flutter/material.dart';
import 'Class/to_do_item.dart';

class Scheduler extends StatefulWidget {
  @override
  _Scheduler createState() => _Scheduler();

  Scheduler({
    Key key,
  }) : super(key: key);
}
// class Scheduler2 extends StatelessWidget {
//   @override
//   // List<ToDoItem> TaskToday = List<ToDoItem>();
//   // ToDoItem ItemObject = ToDoItem(title: '', content: '');
//   // TaskToday.add (ItemObject);
//
//   Widget build(BuildContext context) {
//
//   }
// }

class _Scheduler extends State<Scheduler> {
  final whattodo = TextEditingController();
  final duration = TextEditingController();

  // List<ToDoItem> TaskToday = (ItemObject,24);

//   extension ListUpdate<ToDoItem> on List {
//   List update(int pos, ToDoItem t) {
//     List<ToDoItem> list = new List();
//     list.add(t);
//     replaceRange(pos, pos + 1, list);
//     return this;
//   }
// }

  _showDialog(int index) {
    showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Please enter task for' + timeslot[index]),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    TextField(
                      controller: whattodo,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepOrangeAccent)),
                        labelText: 'Title',
                        labelStyle: TextStyle(),
                        prefixIcon: Icon(
                          Icons.assignment,
                          color: Colors.orange,
                          size: 30,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Container(
                    //   width: 50,
                    //   height: 100,
                    //   child: TextField(
                    //     controller: duration,
                    //     obscureText: false,
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //               color: Colors
                    //                   .fordeepOrangeAccent)),
                    //       labelText: 'Duration',
                    //       labelStyle: TextStyle(),
                    //       prefixIcon: Icon(
                    //         Icons.assignment,
                    //         color: Colors.orange,
                    //         size: 30,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Container(
                        width: 40,
                        height: 40,
                        child: ListView.builder(
                            itemCount: listview_end - listview_start - index,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                  title: Text((index + 1).toString()),
                                  onTap: () {
                                    setState(() {
                                      duration.text = index.toString();
                                    });
                                  });
                            }))
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                    child: Text('OK'),
                    onPressed: () {
                      setState(() {
                        var tmp = int.parse(duration.text);
                        print(tmp);

                        for (int i = index; i <= index + tmp; i++) {
                          ToDoItem ItemObject =
                              ToDoItem(title: whattodo.text, content: "");
                          TaskToday[i] = ItemObject;

                          print(TaskToday.length);

                          //print(TaskToday[i].title);
                          //TaskToday.remove(i);
                          // TaskToday.insert(i, ItemObject);
                          //TaskToday[i].title = whattodo.text;
                          // if (i == index) {
                          //   TaskToday.update(
                          //   TaskToday.update(
                          //       i,
                          //       ToDoItem(
                          //         title: whattodo.text,
                          //         content: "new",
                          //       ));
                          // }
                        }
                        for (int i = 0; i <= 23; i++) {
                          print(i.toString() + ':  ' + TaskToday[i].title);
                        }
                        Navigator.of(context).pop();
                        whattodo.text = '';
                        // duration.text = 1;
                      });
                    })
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    ToDoItem ItemObject = ToDoItem(title: '', content: '');
    // var TaskToday = new List<ToDoItem>.from(ItemObject);
    List<ToDoItem> TaskToday = List.filled(24, ItemObject, growable: true);
    // TaskToday.add (ItemObject,24);
    return Scaffold(
      appBar: AppBar(
        title: Text("Scheduler"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Row(children: <Widget>[
                SizedBox(width: 15),
                Text('Time'),
                SizedBox(width: 30),
                Text('Task'),
              ]),
              Container(
                  width: 500,
                  height: 550,
                  child: ListView.builder(
                      itemCount: listview_end - listview_start,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Text(timeslot[index + listview_start]),
                          title: Text(TaskToday[1].content),
                          subtitle: Text('--'),
                          onTap: () {
                            _showDialog(index);
                          },
                        );
                      })),
            ]),
      ),
    );
  }
}
