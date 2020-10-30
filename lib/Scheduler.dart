import 'package:flutter/material.dart';
import 'Class/to_do_item.dart';
import 'To Do List.dart';
import 'main.dart';
import 'SchdulerDialog.dart';
import 'Task Completed.dart';
//import 'package:flutter_material_pickers/flutter_material_pickers.dart/';
//import 'package:flutter_sparkline/flutter_sparkline.dart';
//import 'package:flutter_material_pickers/flutter_material_pickers.dart';

class Scheduler extends StatefulWidget {
  @override
  _Scheduler createState() => _Scheduler();

  final List<PassToDoItem> itemToPass;
  Scheduler({Key key, this.itemToPass}) : super(key: key);
}

class _Scheduler extends State<Scheduler> {
  final whattodo = TextEditingController();
  final duration = TextEditingController();

  // var TaskToday = new List<ToDoItem>.from(ItemObject);
  List<ToDoItem> TaskToday =
      List<ToDoItem>.generate(24, (index) => ToDoItem(title: ''));
  List<ToDoItem> Task_Completed_Schduler = List<ToDoItem>();
  String hour = DateTime.now().toString()[11] + DateTime.now().toString()[12];

  _showDialog(int index) {
    int duration_selected = 0;

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
                      // RawMaterialButton(
                      //     child: Text(
                      //       'up',
                      //       style: TextStyle(color: Colors.white, fontSize: 14),
                      //     ),
                      //     constraints: BoxConstraints.tight(Size(40, 40)),
                      //     fillColor: Colors.orange,
                      //     splashColor: Colors.deepOrange,
                      //     shape: StadiumBorder(),
                      //     onPressed: () {
                      //       setState(() {
                      //         // timeslotcontrol.animateTo(
                      //         //     timeslotcontrol.offset - 40,
                      //         //     curve: Curves.linear,
                      //         //     duration: Duration(milliseconds: 500));
                      //       });
                      //     }),
                      SizedBox(height: 20),
                      Container(
                        width: 250,
                        height: 180,
                        // child: Row(
                        //   children: <Widget>[
                        //     Container(
                        //       width: 150.0,
                        //       child: RaisedButton(
                        //         child: Text("Duration"),
                        //         onPressed: () =>
                        //       ),
                        //     ),
                        //     // Expanded(
                        //     //   child: Text(
                        //     //     duration_selected.toString(),
                        //     //     textAlign: TextAlign.right,
                        //     //   ),
                        //     // ),
                        //   ],
                        // ),
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
                        // itemToPass.removeRange(0, itemToPass.length());

                        var tmp = int.parse(duration.text);
//                        print(tmp);
                        //  print('input text for index$index: ${whattodo.text}');

                        for (int i = index; i <= index + tmp; i++) {
                          TaskToday[i].title = whattodo.text;
                        }

                        for (int i = 0; i <= 23; i++) {
                          print(i.toString() + ':  ' + TaskToday[i].title);
                        }
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

  _ScheduleCompleted(int index) {
    Task_Completed_Schduler.add(
        ToDoItem(title: TaskToday[index].title, content: ''));
    String tmp = TaskToday[index].title;
    if (index != 23)
      for (int i = index; TaskToday[i].title == tmp; i++)
        TaskToday[i].title = '';

    if (index != 0) {
      for (int i = index - 1; TaskToday[i].title == tmp; i--) {
        TaskToday[i].title = '';
      }
      TaskToday[index].title = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    var itemToPass = widget.itemToPass;

    for (int i = 0; i < itemToPass.length; i++) {
      ToDoItem itemObject = ToDoItem(title: itemToPass[i].title, content: '');

      for (int j = itemToPass[i].start_time;
          j < itemToPass[i].duration + itemToPass[i].start_time;
          j++) TaskToday[j] = itemObject;
    }

    // for (var j = 0; j < TaskToday.length; j++)
    //   print('$j : ' + TaskToday[j].title ?? "N/A");
    // TaskToday.add (ItemObject,24);
    return Scaffold(
      appBar: AppBar(
          // leading: Icon(Icons.import_contacts),
          title: Text("Scheduler"),
          // backgroundColor: Colors.deepPurpleAccent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(
                context, MaterialPageRoute(builder: (context) => MyHomePage())),
          )),
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
              SizedBox(height: 10),
              Container(
                  width: 500,
                  height: 550,
                  child: ListView.builder(
                      itemCount: listview_end - listview_start,
                      itemBuilder: (BuildContext context, int index) {
//                        print('building $index');
                        return Column(
                          children: <Widget>[
                            Container(
                              color: (hour == index.toString())
                                  ? listtile_highlighted
                                  : listtile_background,
                              child: Card(
                                color: Colors.transparent,
                                child: ListTile(
                                  trailing: IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        setState(() {
                                          _ScheduleCompleted(index);
                                        });
                                      }),
                                  leading:
                                      Text(timeslot[index + listview_start]),
                                  title:
                                      Text('Title: ' + TaskToday[index].title),
                                  //trailing: Icon(Icons.call_missed_outgoing),
                                  subtitle: Text(
                                      'Content: ' + TaskToday[index].content),
                                  onTap: () {
                                    _showDialog(index);
                                    itemToPass.removeRange(
                                        0, itemToPass.length);
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      })),
            ]),
      ),
    );
  }
}
