import 'package:flutter/material.dart';
import 'Class/to_do_item.dart';

class TasksCompleted extends StatefulWidget {
  @override
  _TaskCompletedState createState() => _TaskCompletedState();
  final List<ToDoItem> todoList_Completed;

  TasksCompleted({Key key, this.todoList_Completed}) : super(key: key);
}

class _TaskCompletedState extends State<TasksCompleted> {
  // var todolistlen = 0;
  // List<ToDoItem> todoList_Completed = List<ToDoItem>();

  @override
  Widget build(BuildContext context) {
    final todoList_Completed2 = widget.todoList_Completed;
    print(todoList_Completed2.length);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Task Completed"),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
              Container(
                height: 500,
                width: 500,
                child: (todoList_Completed2.length != 0)
                    ? ListView.builder(
                        itemCount: todoList_Completed2.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Icon(Icons.title),
                            title: Text(todoList_Completed2[index].title),
                            subtitle: Text(todoList_Completed2[index].content),
                            trailing: IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  setState(() {
                                    todoList_Completed2
                                        .remove(todoList_Completed2[index]);
                                  });
                                }),
                          );
                        })
                    : Center(
                        //padding: EdgeInsets.all(100.0),
                        child: Text(
                        'List is empty',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      )),
              )
            ])),
        floatingActionButton: RawMaterialButton(
            child: Text(
              'Delete All',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            constraints: BoxConstraints.tight(Size(140, 40)),
            fillColor: Colors.orange,
            splashColor: Colors.deepOrange,
            shape: StadiumBorder(),
            onPressed: () {
              setState(() {
                todoList_Completed2.removeRange(0, todoList_Completed2.length);
              });
            }));
  }
}
