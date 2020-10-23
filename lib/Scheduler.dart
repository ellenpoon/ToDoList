import 'package:flutter/material.dart';
import 'Class/to_do_item.dart';

class Scheduler extends StatefulWidget {
  @override
  _Scheduler createState() => _Scheduler();

  Scheduler({
    Key key,
  }) : super(key: key);
}

class _Scheduler extends State<Scheduler> {
  final whattodo = TextEditingController();
  final duration = TextEditingController();

  List<String> TaskToday = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    ''
  ];

  final List<String> timeslot = [
    '00-01',
    '01-02',
    '02-03',
    '03-04',
    '04-05',
    '05-06',
    '06-07',
    '07-08',
    '08-09',
    '09-10',
    '10-11',
    '11-12',
    '12-13',
    '13-14',
    '14-15',
    '15-16',
    '16-17',
    '17-18',
    '18-19',
    '19-20',
    '20-21',
    '21-22',
    '22-23',
    '23-24'
  ];

  @override
  Widget build(BuildContext context) {
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
                          title: Text(TaskToday[index]),
                          subtitle: Text('--'),
                          onTap: () {
                            return showDialog<void>(
                                context: context,
                                barrierDismissible:
                                    false, // user must tap button!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      title: Text('Please enter task for' +
                                          timeslot[index]),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: <Widget>[
                                            TextField(
                                              controller: whattodo,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .deepOrangeAccent)),
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
                                            //                   .deepOrangeAccent)),
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
                                                    itemCount: listview_end -
                                                        listview_start -
                                                        index,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return ListTile(
                                                          title: Text(
                                                              (index + 1)
                                                                  .toString()),
                                                          onTap: () {
                                                            setState(() {
                                                              duration.text =
                                                                  index
                                                                      .toString();
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
                                                var tmp =
                                                    int.parse(duration.text);
                                                print(tmp);

                                                for (int i = index;
                                                    i <= index + tmp;
                                                    i++) {
                                                  TaskToday[i] = whattodo.text;
                                                }
                                                Navigator.of(context).pop();
                                                whattodo.text = '';
                                                // duration.text = 1;
                                              });
                                            })
                                      ]);
                                });
                          },
                        );
                      })),
            ]),
      ),
    );
  }
}
