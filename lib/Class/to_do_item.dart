class ToDoItem {
  String title;
  String content;

  ToDoItem({this.title = '', this.content = ''});
}

// ToDoItem a = ToDoItem(title: "", content: "");
// List<ToDoItem> TaskToday = List.filled(24, a);
//
// extension ListUpdate<ToDoItem> on List {
//   List update(int pos, ToDoItem t) {
//     List<ToDoItem> list = new List();
//     list.add(t);
//     replaceRange(pos, pos + 1, list);
//     return this;
//   }
// }

final listview_start = 0;
final listview_end = 24;

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
