import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Task Completed.dart';
import 'Scheduler.dart';
import 'To Do List.dart';
import 'MoodTracker.dart';
import 'Test.dart';

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({Key key, this.todoList_Completed, this.itemToPass})
      : super(key: key);
  final todoList_Completed;
  final itemToPass;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    style: Theme.of(context).textTheme.headline6,
                    // style: TextStyle(
                    //
                    //   color: Colors.orange,
                    //   fontSize: 18,
                    // ),
                  ),
                  decoration: BoxDecoration(
                      // color: Colors.deepPurpleAccent,
                      ),
                ),
              ),
              ListTile(
                //leading: Icon(Icons.assignment),
                title: Padding(
                  padding: EdgeInsets.all(0),
                  child: Text(
                    'View Tasks Completed',
                    style: TextStyle(
                      //  color: Colors.black54,
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
              Divider(),
              ListTile(
                title: Text(
                  'Scheduler',
                  style: TextStyle(
                    //  color: Colors.black54,
                    fontSize: 18,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Scheduler(itemToPass: itemToPass)));
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Mood Tracker',
                  style: TextStyle(
                    //    color: Colors.black54,
                    fontSize: 18,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MoodTracker()));
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  'ShowImage',
                  style: TextStyle(
                    //    color: Colors.black54,
                    fontSize: 18,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShowImage()));
                },
              ),
              Divider(),
            ],
          ),
        ));
  }
}
