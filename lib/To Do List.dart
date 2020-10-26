import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Class/to_do_item.dart';
import 'Scheduler.dart';
import 'Task Completed.dart';
import 'MoodTracker.dart';
import 'CupertinoPicker.dart';
import 'RecordableListView.dart';
import 'SwipeToDel.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.TaskToday}) : super(key: key);
  final String title;
  final List<ToDoItem> TaskToday;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // var list = new List<String>();

  final myController = TextEditingController();
  final myController2 = TextEditingController();
  final starttime_pos = -1;
  final duration_pos = -1;
  final timeslotcontrol = ScrollController();
  final durationcontrol = ScrollController();

  var todolistlen = 0;

  List<ToDoItem> todoList = List<ToDoItem>();
  List<ToDoItem> todoList_Completed = List<ToDoItem>();

  Future<void> _showDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('System Message'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(
                        'Title cannot be empty. Please Enter Title for new Task.'),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }
  ////

  _showDialog2(int _index, int starttime_pos, int duration_pos) {
    showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Assign Task to the below timeslot:'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('start time'),
                        SizedBox(width: 23),
                        Text('duration')
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RawMaterialButton(
                            child: Text(
                              'up',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            constraints: BoxConstraints.tight(Size(40, 40)),
                            fillColor: Colors.orange,
                            splashColor: Colors.deepOrange,
                            shape: StadiumBorder(),
                            onPressed: () {
                              setState(() {
                                timeslotcontrol.animateTo(
                                    timeslotcontrol.offset - 40,
                                    curve: Curves.linear,
                                    duration: Duration(milliseconds: 500));
                              });
                            }),
                        RawMaterialButton(
                            child: Text(
                              'down',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            constraints: BoxConstraints.tight(Size(40, 40)),
                            fillColor: Colors.orange,
                            splashColor: Colors.deepOrange,
                            shape: StadiumBorder(),
                            onPressed: () {
                              setState(() {
                                timeslotcontrol.animateTo(
                                    timeslotcontrol.offset + 40,
                                    curve: Curves.linear,
                                    duration: Duration(milliseconds: 500));
                              });
                            }),
                        SizedBox(width: 8),
                        RawMaterialButton(
                            child: Text(
                              'up',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            constraints: BoxConstraints.tight(Size(40, 40)),
                            fillColor: Colors.orange,
                            splashColor: Colors.deepOrange,
                            shape: StadiumBorder(),
                            onPressed: () {
                              setState(() {
                                durationcontrol.animateTo(
                                    durationcontrol.offset - 40,
                                    curve: Curves.linear,
                                    duration: Duration(milliseconds: 500));
                              });
                            }),
                        RawMaterialButton(
                            child: Text(
                              'down',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            constraints: BoxConstraints.tight(Size(40, 40)),
                            fillColor: Colors.orange,
                            splashColor: Colors.deepOrange,
                            shape: StadiumBorder(),
                            onPressed: () {
                              setState(() {
                                durationcontrol.animateTo(
                                    durationcontrol.offset + 40,
                                    curve: Curves.linear,
                                    duration: Duration(milliseconds: 500));
                              });
                            })
                      ]),
                  SizedBox(height: 20),
                  Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                              width: 100,
                              height: 200,
                              child: ListView.builder(
                                  controller: timeslotcontrol,
                                  itemCount: listview_end - listview_start,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                        height: 40,
                                        color: (index == starttime_pos)
                                            ? Colors.amberAccent
                                            : Colors.white,
                                        child: ListTile(
                                            title: Center(
                                              child:
                                                  Text((index + 1).toString()),
                                            ),
                                            //   focusColor: Colors.purpleAccent,
                                            onTap: () {
                                              setState(() {
                                                Navigator.of(context).pop();
                                                //print(index);
                                                //starttime_pos = index;
                                                _showDialog2(_index, index,
                                                    duration_pos);
                                              });
                                            }));
                                  })),
                          Container(
                              width: 100,
                              height: 200,
                              child: ListView.builder(
                                  controller: durationcontrol,
                                  itemCount:
                                      listview_end - listview_start - _index,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                        height: 40,
                                        color: (index == duration_pos)
                                            ? Colors.amberAccent
                                            : Colors.white,
                                        child: ListTile(
                                            title: Center(
                                                child: Text(
                                                    (index + 1).toString())),
                                            onTap: () {
                                              setState(() {
                                                Navigator.of(context).pop();
                                                // duration_pos = index;
                                                //print(duration_pos == index);
                                                _showDialog2(_index,
                                                    starttime_pos, index);
                                              });
                                            }));
                                  }))
                        ]),
                  ),
                  SizedBox(height: 20),
                  RawMaterialButton(
                      child: Text(
                        'OK',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      constraints: BoxConstraints.tight(Size(60, 40)),
                      fillColor: Colors.orange,
                      splashColor: Colors.deepOrange,
                      shape: StadiumBorder(),
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).pop();
                        });
                      })
                ],
              ),
            ),
          );
        });
  }
  ////

  void _updatetext() {
    //print((myController.text));
    if (myController.text == "") {
      _showDialog();
    } else {
      setState(() {
        todolistlen++;
        var tmp = myController.text;
        var tmp2 = myController2.text;
        ToDoItem itemObject = ToDoItem(title: tmp, content: tmp2);
        todoList.add(itemObject);

        myController.text = ""; //clear input text field
        myController2.text = "";

        print('todolistlen' + todolistlen.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final TaskToday = widget.TaskToday;
    //print('tasktoday' + (TaskToday.length).toString());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // leading: Icon(Icons.menu),
        title: Text(widget.title),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 0),
            Container(
              width: 350.0,
              height: 50.0,
              child: TextField(
                controller: myController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrangeAccent)),
                  labelText: 'Title',
                  labelStyle: TextStyle(),
                  prefixIcon: Icon(
                    Icons.assignment,
                    color: Colors.orange,
                    size: 30,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: 350.0,
              height: 50.0,
              child: TextField(
                controller: myController2,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Content',
                  prefixIcon: Icon(
                    Icons.assignment,
                    color: Colors.orange,
                    size: 30,
                  ),
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              SizedBox(width: 8),
              SizedBox(width: 185),
              ButtonTheme(
                minWidth: 40,
                height: 60,
                child: FlatButton(
                  onPressed: _updatetext,
                  //tooltip: 'update text',
                  child: Icon(Icons.add),
                ),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(width: 16.0),
                Text(
                  'Index',
                ),
                SizedBox(width: 14.0),
                Text('Task (on-going: ' + '$todolistlen' + ')'),
                Spacer(),
                Text(
                  'Assign to',
                  //style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(width: 8),
              ],
            ),
            Container(
                width: 600,
                height: 350,
                child: ListView.builder(
                    itemCount: todoList.length,
                    itemBuilder: (BuildContext context, int index) {
                      // return Dismissible(
                      //   direction: DismissDirection.endToStart,
                      //   key: Key(todoList[index].title),
                      //   background: Container(
                      //     alignment: AlignmentDirectional.centerEnd,
                      //     color: Colors.red,
                      //     child: Padding(
                      //         padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                      //         child: Icon(
                      //           Icons.delete,
                      //           color: Colors.white,
                      //         )
                      // return Dismissible(
                      //     direction: DismissDirection.endToStart,
                      //     key: Key(items[index]),
                      //     background: Container(
                      //         alignment: AlignmentDirectional.centerEnd,
                      //         color: Colors.red,
                      return Dismissible(
                          direction: DismissDirection.endToStart,
                          key: Key(todoList[index].title),
                          onDismissed: (direction) {
                            setState(() {
                              todoList_Completed.add(todoList[index]);
                              todoList.removeAt(index); // dismiss
                              todolistlen = todoList.length;
                            });
                          },
                          child: ListTile(
                            leading: Text(index.toString()),
                            title: Text(todoList[index].title),
                            subtitle: Text(todoList[index].content),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.call_missed_outgoing,
                                color: Colors.lightGreen,
                              ),
                              onPressed: () {
                                setState(
                                  () {
                                    _showDialog2(index, -1, -1);
                                  },
                                );
                              },
                            ),

                            // leading: Text(index.toString()),
                            // title: Text(todoList[index].title),
                            // subtitle: Text(todoList[index].content),
                            // trailing: IconButton(
                            //     icon: Icon(
                            //       Icons.call_missed_outgoing,
                            //       color: Colors.lightGreen,
                            //     ),
                          ));
                      // onPressed: () {
                      //   setState(
                      //     () {
                      //       _showDialog2(index, -1, -1);
                      //       // todoList_Completed.add(todoList[index]);
                      //       // print(todoList_Completed.length);
                      //       // todoList.remove(todoList[index]);
                      //       // todolistlen = todoList.length;
                      //     },
                      //   );
                      // }));
                    }))
            // ListView(children: list.map((str) ef
            //   return ListTile(title: Text(str));
            // })),
          ],
        ),
      ),
      drawer: Container(
          width: 250,
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  height: 85,
                  child: DrawerHeader(
                    child: Text(
                      'Function',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  child: ListTile(
                    title: Padding(
                      padding: EdgeInsets.all(0),
                      child: Text(
                        'View Tasks Completed',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TasksCompleted(
                                    todoList_Completed: todoList_Completed,
                                  )));
                    },
                  ),
                ),
                ListTile(
                  title: Text(
                    'Scheduler',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Scheduler()));
                  },
                ),
                ListTile(
                  title: Text(
                    'Mood Tracker',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MoodTracker()));
                  },
                ),
                ListTile(
                  title: Text(
                    'RecordableListView',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecordableListView()));
                  },
                ),
                ListTile(
                  title: Text(
                    'Swipe To Del',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SwipeToDel()));
                  },
                ),
              ],
            ),
          )),
    );
  }
}
