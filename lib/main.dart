import 'package:flutter/material.dart';
import 'to_do_item.dart';

void main() {
  runApp(MyApp());
}

List<ToDoItem> todoList_Completed = List<ToDoItem>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'To Do List'),
    );
  }
}

class TasksCompleted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Task Completed"),
        ),
        body: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: ListView.builder(
                itemCount: todoList_Completed.length,
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
                  return ListTile(
                      leading: Icon(Icons.title),
                      title: Text(todoList_Completed[index].title),
                      subtitle: Text(todoList_Completed[index].content),
                      trailing: IconButton(
                          icon: Icon(Icons.check_box),
                          onPressed: () {
                            setState(
                              () {
                                todoList_Completed
                                    .remove(todoList_Completed[index]);
                              },
                            );
                          }));
                })));
  }
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('Tasks Completed'),
//     ),
//     body: Text('Task Completed go on'),
//   );
// }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // var list = new List<String>();

  final myController = TextEditingController();
  final myController2 = TextEditingController();

  List<ToDoItem> todoList = List<ToDoItem>();

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
                    Text('Please Enter Title'),
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

  void _updatetext() {
    //print((myController.text));
    if (myController.text == "") {
      _showDialog();
    } else {
      setState(() {
        var tmp = myController.text;
        var tmp2 = myController2.text;
        ToDoItem itemObject = ToDoItem(title: tmp, content: tmp2);
        todoList.add(itemObject);

        myController.text = ""; //clear input text field
        myController2.text = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    border: OutlineInputBorder(),
                    labelText: 'Title',
                    prefixIcon: Icon(
                      Icons.assignment,
                      color: Color(0xFF6200EE),
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
                      color: Color(0xFF6200EE),
                      size: 30,
                    ),
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                SizedBox(width: 250),
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
                    'Task:',
                  ),
                  Spacer(),
                  Text(
                    'Completed',
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

                        return ListTile(
                            leading: Icon(Icons.title),
                            title: Text(todoList[index].title),
                            subtitle: Text(todoList[index].content),
                            trailing: IconButton(
                                icon: Icon(Icons.check_box),
                                onPressed: () {
                                  setState(
                                    () {
                                      print(todoList[index].title);
                                      todoList_Completed.add(todoList[index]);
                                      todoList.remove(todoList[index]);
                                    },
                                  );
                                }));
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
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
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
                ListTile(
                  title: Text(
                    'View Tasks Completed',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TasksCompleted()));
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
