import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Class/to_do_item.dart';
import 'Scheduler.dart';
import 'Task Completed.dart';
import 'MoodTracker.dart';
import 'CupertinoPicker.dart';
import 'RecordableListView.dart';
import 'SwipeToDel.dart';
import 'Test.dart';
import 'NavigationDrawer.dart';
import 'main.dart';

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
  var task_type = '';
  var todolistlen = 0;

  List<ToDoItem> todoList = List<ToDoItem>();
  List<ToDoItem> todoList_Completed = List<ToDoItem>();
  List<PassToDoItem> itemToPass = List<PassToDoItem>();

  Future<void> _showDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
              title: Center(child: Text('System Message')),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Divider(
                      color: Colors.white,
                    ),
                    SizedBox(height: 30),
                    Container(
                      height: 80,
                      child: Text(
                        'Title cannot be empty. Please Enter Title for new Task.',
                      ),
                    ),
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

  String _getTextFromListtile(int _index) {
    return _index.toString();
  }

  _showDialog2(int _index, int starttime_pos, int duration_pos) {
    showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
              title: Center(child: Text('Assign Task to Schedule')),
              content: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                content:
                return SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Center(
                        child: Container(
                          width: 240,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromRGBO(255, 255, 255, 200)),
                              color: Color.fromRGBO(0, 0, 0, 150),
                              borderRadius: (BorderRadius.all(
                                  Radius.elliptical(20, 20)))),
                          child: Center(
                            child: Text(
                              todoList[_index].title,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                constraints: BoxConstraints.tight(Size(50, 40)),
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                constraints: BoxConstraints.tight(Size(50, 40)),
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                constraints: BoxConstraints.tight(Size(50, 40)),
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                constraints: BoxConstraints.tight(Size(50, 40)),
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
                                              ? listtile_highlighted
                                              : listtile_background,
                                          child: ListTile(
                                              title: Center(
                                                child: Text(timeslot[index]),
                                              ),
                                              //   focusColor: Colors.purpleAccent,
                                              onTap: () {
                                                setState(() {
                                                  // Navigator.of(context).pop();
                                                  //print(index);
                                                  starttime_pos = index;
                                                  // _showDialog2(_index, index,
                                                  //     duration_pos);
                                                });
                                              }));
                                    }),
                              ),
                              Container(
                                  width: 100,
                                  height: 200,
                                  child: ListView.builder(
                                      controller: durationcontrol,
                                      itemCount: listview_end -
                                          listview_start -
                                          _index,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                            height: 40,
                                            color: (index == duration_pos)
                                                ? listtile_highlighted
                                                : listtile_background,
                                            child: ListTile(
                                                title: Center(
                                                    child: Text((index + 1)
                                                        .toString())),
                                                onTap: () {
                                                  setState(() {
                                                    //Navigator.of(context).pop();
                                                    duration_pos = index;
                                                    //print(duration_pos == index);
                                                    // _showDialog2(_index,
                                                    //     starttime_pos, index);
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
                              print(starttime_pos.toString() +
                                  ' ' +
                                  (duration_pos + 1).toString() +
                                  ' ' +
                                  todoList[_index].title);
                              PassToDoItem itemObject = PassToDoItem(
                                  title: todoList[_index].title,
                                  content: '',
                                  start_time: starttime_pos,
                                  duration: duration_pos + 1);
                              itemToPass.add(itemObject);
                            });
                          })
                    ],
                  ),
                );
              }));
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

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    final TaskToday = widget.TaskToday;

    //print('tasktoday' + (TaskToday.length).toString());

    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.menu,
                //size: 18,
              ),
              onPressed: () => _scaffoldKey.currentState.openDrawer()),

          title: Text(
            widget.title,
            style: TextStyle(color: Colors.orange),
          ),
          // leading: Icon(
          //   Icons.dehaze,
          //   color: Colors.orange,
          // ),
          backgroundColor: Colors.black54,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 25),
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
                      Icons.title,
                      color: Colors.orange,
                      size: 25,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
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
                      size: 25,
                    ),
                  ),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width: 35),
                    Text(
                      'Type:    ',
                      style: TextStyle(color: Colors.orange),
                    ),
                    DropdownButton<String>(
                      //isExpanded: true,
                      hint: Text(
                        '$task_type',
                        style: TextStyle(color: Colors.white),
                      ),
                      items: <String>['Sport', 'Work', 'Personal', 'Purchase']
                          .map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (String newValue) {
                        setState(() {
                          task_type = newValue;
                          if (newValue == 'Recent 3 Days') {
                          } else if (newValue == 'Recent Week') {
                          } else if (newValue == 'Recent 2 Weeks') {}
                        });
                      },
                    ),
                    Spacer(),
                    ButtonTheme(
                      minWidth: 40,
                      height: 40,
                      child: FlatButton(
                        onPressed: _updatetext,
                        //tooltip: 'update text',
                        child: Icon(Icons.add),
                      ),
                    ),
                    SizedBox(width: 0),
                  ]),
              Stack(children: <Widget>[
                Container(
                  width: 500,
                  height: 410,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('background_for_listview.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.2), BlendMode.dstATop),
                    ),
                  ),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      // Divider(
                      //   color: Colors.white,
                      //   indent: 0,
                      //   endIndent: 0,
                      // ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(width: 16.0),
                          Text(
                            'Type',
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
                      SizedBox(height: 10),
                      Container(
                          width: 600,
                          height: 365,
                          child: ListView.builder(
                              itemCount: todoList.length,
                              itemBuilder: (BuildContext context, int index) {
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
                                    child: Card(
                                      color: Colors.transparent,
                                      child: ListTile(
                                        leading: Icon(Icons.edit),
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
                                      ),
                                    ));
                              }))
                    ]),
              ]),
            ],
          ),
        ),
        drawer: NavigationDrawer(
            todoList_Completed: todoList_Completed, itemToPass: itemToPass));
  }
}
