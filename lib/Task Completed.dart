import 'package:flutter/material.dart';
import 'package:flutter_app3/MoodTracker.dart';
import 'package:flutter_app3/Scheduler.dart';
import 'Class/to_do_item.dart';
import 'Test.dart';
import 'TaskCompletedByMonth.dart';

class TasksCompleted extends StatefulWidget {
  @override
  _TaskCompletedState createState() => _TaskCompletedState();
  final List<ToDoItem> todoList_Completed;

  TasksCompleted({Key key, this.todoList_Completed}) : super(key: key);
}

class _TaskCompletedState extends State<TasksCompleted> {
  // var todolistlen = 0;
  // List<ToDoItem> todoList_Completed = List<ToDoItem>();
  var year = '2020';
  var recent = 'Recent 3 Days';
  @override
  Widget build(BuildContext context) {
    final todoList_Completed2 = widget.todoList_Completed;
    print(todoList_Completed2.length);
    var newValue;
    var value;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Task Completed"),
        //  backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('background_for_listview.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.dstATop),
              ),
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 20),
                Text(
                  'Completed Task by Month:',
                  textAlign: TextAlign.left,
                ),
                Spacer(),
                DropdownButton<String>(
                  //isExpanded: true,
                  hint: Text('$year'),
                  items: <String>['2020', '2019', '2018'].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      // print(newValue);
                      year = newValue;
                      if (newValue == '2020') {
                      } else if (newValue == '2019') {
                      } else if (newValue == '2018') {}
                      if (newValue == '2020') {
                      } else if (newValue == '2019') {
                      } else if (newValue == '2018') {}
                    });
                  },
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 500,
              height: 75,
              child: ListView.builder(
                  // controller: timeslotcontrol,
                  scrollDirection: Axis.horizontal,
                  itemCount: (year == '2020') ? 10 : 12,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        width: 100.0,
                        height: 75,
                        child: Card(
                          color: Color.fromRGBO(55, 55, 55, 10),
                          child: ListTile(
                              title: Center(
                                child: Text((year != '2020')
                                    ? month_inverted[index] + '\n$year'
                                    : month_inverted[index + 2] + '\n$year'),
                              ),
                              //   focusColor: Colors.purpleAccent,
                              onTap: () {
                                setState(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TaskCompletedByMonth()));
                                });
                              }),
                        ));
                  }),
            ),
            // Container(

            //   child: Card(
            //       child: RawMaterialButton(
            //           child: Text(
            //             'Oct' + '\n2020',
            //           ),
            //           onPressed: () {
            //             setState(() {
            //               Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                       builder: (context) =>
            //                           TaskCompletedByMonth()));
            //             });
            //           })),
            // ),
            // Container(
            //   width: 100.0,
            //   height: 75,
            //   child: Card(
            //     child: Center(child: Text('Sep' + '\n2020')),
            //   ),
            // ),
            // Container(
            //   width: 100.0,
            //   height: 75,
            //   child: Card(
            //     child: Center(child: Text('Aug' + '\n2020')),
            //   ),
            // ),
            // Container(
            //   width: 100.0,
            //   height: 75,
            //   child: Card(
            //     child: Center(child: Text('Jul' + '\n2020')),
            //   ),
            // ),
            // Container(
            //   width: 100.0,
            //   height: 75,
            //   child: Card(
            //     child: Center(child: Text('Jun' + '\n2020')),
            //   ),
            // ),

            SizedBox(height: 10),
            Row(
              children: <Widget>[
                SizedBox(width: 20),
                Text(
                  'Recent Completed Task:',
                ),
                Spacer(),
                // Text(
                //   'Recent week',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 17,
                //     fontWeight: FontWeight.w300,
                //   ),
                // ),
                // IconButton(
                //     icon: Icon(Icons.edit),
                //     color: Colors.orange,
                //     splashColor: Colors.deepOrange,
                //     onPressed: () {
                //       setState(() {});
                //     }),
                SizedBox(width: 5),
                DropdownButton<String>(
                  //isExpanded: true,
                  hint: Text('$recent'),
                  items: <String>[
                    'Recent 3 Days',
                    'Recent Week',
                    'Recent 2 Weeks'
                  ].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      recent = newValue;
                      if (newValue == 'Recent 3 Days') {
                      } else if (newValue == 'Recent Week') {
                      } else if (newValue == 'Recent 2 Weeks') {}
                    });
                  },
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: 380,
              width: 500,
              child: (todoList_Completed2.length != 0)
                  ? ListView.builder(
                      itemCount: todoList_Completed2.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: Colors.transparent,
                          child: ListTile(
                            leading: Text('29/10'),
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
                          ),
                        );
                      })
                  : Card(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          //padding: EdgeInsets.all(100.0),
                          child: Text(
                        'List is empty',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      )),
                    ),
            )
          ])
        ],
      ),
      // floatingActionButton: RawMaterialButton(
      //     child: Text(
      //       'Delete All',
      //       style: TextStyle(color: Colors.white, fontSize: 18),
      //     ),
      //     constraints: BoxConstraints.tight(Size(140, 40)),
      //     fillColor: Colors.orange,
      //     splashColor: Colors.deepOrange,
      //     shape: StadiumBorder(),
      //     onPressed: () {
      //       setState(() {
      //         todoList_Completed2.removeRange(0, todoList_Completed2.length);
      //       });
      //     })
    );
  }
}
