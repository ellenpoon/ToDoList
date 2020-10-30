// import 'Scheduler.dart';
// import 'package:flutter/material.dart';
//
// class _SchedulerDialog extends State<Scheduler> {
//   _showDialog(int index) {
//     int duration_selected = 0;
//
//     showDialog(
//         context: context,
//         barrierDismissible: false, // user must tap button!
//         builder: (BuildContext context) {
//           return AlertDialog(
//               title: Text('Please enter task for' + timeslot[index]),
//               content: SingleChildScrollView(
//                 child: Center(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       TextField(
//                         controller: whattodo,
//                         obscureText: false,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: Colors.deepOrangeAccent)),
//                           labelText: 'Title',
//                           labelStyle: TextStyle(),
//                           prefixIcon: Icon(
//                             Icons.assignment,
//                             color: Colors.orange,
//                             size: 30,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       Text('Duration'),
//                       // RawMaterialButton(
//                       //     child: Text(
//                       //       'up',
//                       //       style: TextStyle(color: Colors.white, fontSize: 14),
//                       //     ),
//                       //     constraints: BoxConstraints.tight(Size(40, 40)),
//                       //     fillColor: Colors.orange,
//                       //     splashColor: Colors.deepOrange,
//                       //     shape: StadiumBorder(),
//                       //     onPressed: () {
//                       //       setState(() {
//                       //         // timeslotcontrol.animateTo(
//                       //         //     timeslotcontrol.offset - 40,
//                       //         //     curve: Curves.linear,
//                       //         //     duration: Duration(milliseconds: 500));
//                       //       });
//                       //     }),
//                       SizedBox(height: 20),
//                       Container(
//                         width: 250,
//                         height: 180,
//                         // child: Row(
//                         //   children: <Widget>[
//                         //     Container(
//                         //       width: 150.0,
//                         //       child: RaisedButton(
//                         //         child: Text("Duration"),
//                         //         onPressed: () =>
//                         //       ),
//                         //     ),
//                         //     // Expanded(
//                         //     //   child: Text(
//                         //     //     duration_selected.toString(),
//                         //     //     textAlign: TextAlign.right,
//                         //     //   ),
//                         //     // ),
//                         //   ],
//                         // ),
//                         child: ListView.builder(
//                             itemCount: listview_end - listview_start - index,
//                             itemBuilder: (BuildContext context, int index) {
//                               return ListTile(
//                                   title: Center(
//                                       child: Text((index + 1).toString())),
//                                   onTap: () {
//                                     setState(() {
//                                       duration.text = index.toString();
//                                     });
//                                   });
//                             }),
//                       ),
//                       SizedBox(height: 20),
//                       RawMaterialButton(
//                           child: Text(
//                             'down',
//                             style: TextStyle(color: Colors.white, fontSize: 14),
//                           ),
//                           constraints: BoxConstraints.tight(Size(40, 40)),
//                           fillColor: Colors.orange,
//                           splashColor: Colors.deepOrange,
//                           shape: StadiumBorder(),
//                           onPressed: () {
//                             setState(() {
//                               // timeslotcontrol.animateTo(
//                               //     timeslotcontrol.offset - 40,
//                               //     curve: Curves.linear,
//                               //     duration: Duration(milliseconds: 500));
//                             });
//                           }),
//                     ],
//                   ),
//                 ),
//               ),
//               actions: <Widget>[
//                 FlatButton(
//                     child: Text('OK'),
//                     onPressed: () {
//                       setState(() {
//                         var tmp = int.parse(duration.text);
// //                        print(tmp);
//                         //  print('input text for index$index: ${whattodo.text}');
//
//                         for (int i = index; i <= index + tmp; i++) {
//                           TaskToday[i].title = whattodo.text;
//                         }
//
//                         for (int i = 0; i <= 23; i++) {
//                           print(i.toString() + ':  ' + TaskToday[i].title);
//                         }
//                         Navigator.of(context).pop();
//                         //List<ToDoItem> _TaskToday = List<ToDoItem>();
//                         // _TaskToday = TaskToday;
//                         // Navigator.push(
//                         //     context,
//                         //     MaterialPageRoute(
//                         //         builder: (context) => MyHomePage(
//                         //           TaskToday: TaskToday,
//                         //         )));
//                         whattodo.text = '';
//
//                         // duration.text = 1;
//                       });
//                     })
//               ]);
//         });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
