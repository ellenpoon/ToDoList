import 'package:flutter/material.dart';
import 'Class/to_do_item.dart';
import 'To Do List.dart';

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

  // var TaskToday = new List<ToDoItem>.from(ItemObject);
  List<ToDoItem> TaskToday =
      List<ToDoItem>.generate(24, (index) => ToDoItem(title: ''));
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
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      Text('Duration'),
                      RawMaterialButton(
                          child: Text(
                            'up',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          constraints: BoxConstraints.tight(Size(40, 40)),
                          fillColor: Colors.orange,
                          splashColor: Colors.deepOrange,
                          shape: StadiumBorder(),
                          onPressed: () {
                            setState(() {
                              // timeslotcontrol.animateTo(
                              //     timeslotcontrol.offset - 40,
                              //     curve: Curves.linear,
                              //     duration: Duration(milliseconds: 500));
                            });
                          }),
                      SizedBox(height: 20),
                      Container(
                        width: 80,
                        height: 60,
                        child: ListView.builder(
                            itemCount: listview_end - listview_start - index,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                  title: Center(
                                      child: Text((index + 1).toString())),
                                  onTap: () {
                                    setState(() {
                                      duration.text = index.toString();
                                    });
                                  });
                            }),
                      ),
                      SizedBox(height: 20),
                      RawMaterialButton(
                          child: Text(
                            'down',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          constraints: BoxConstraints.tight(Size(40, 40)),
                          fillColor: Colors.orange,
                          splashColor: Colors.deepOrange,
                          shape: StadiumBorder(),
                          onPressed: () {
                            setState(() {
                              // timeslotcontrol.animateTo(
                              //     timeslotcontrol.offset - 40,
                              //     curve: Curves.linear,
                              //     duration: Duration(milliseconds: 500));
                            });
                          }),
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                FlatButton(
                    child: Text('OK'),
                    onPressed: () {
                      setState(() {
                        var tmp = int.parse(duration.text);
//                        print(tmp);
                        //  print('input text for index$index: ${whattodo.text}');

                        for (int i = index; i <= index + tmp; i++) {
                          TaskToday[i].title = whattodo.text;
                        }
                        //
//                        for (int i = 0; i <= 23; i++) {
//                          print(i.toString() + ':  ' + TaskToday[i].title);
//                        }
                        Navigator.of(context).pop();
                        //List<ToDoItem> _TaskToday = List<ToDoItem>();
                        // _TaskToday = TaskToday;
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => MyHomePage(
                        //           TaskToday: TaskToday,
                        //         )));
                        whattodo.text = '';

                        // duration.text = 1;
                      });
                    })
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    for (var j = 0; j < TaskToday.length; j++)
      print('$j : ' + TaskToday[j].title ?? "N/A");
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
//                        print('building $index');
                        return ListTile(
                          leading: Text(timeslot[index + listview_start]),
                          title: Text('Title: ' + TaskToday[index].title),
                          //trailing: Icon(Icons.call_missed_outgoing),
                          subtitle:
                              Text('Content: ' + TaskToday[index].content),
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
