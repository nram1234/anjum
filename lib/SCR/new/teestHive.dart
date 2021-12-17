import 'package:anjum/DB/hivee/not_complete_order.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TtryHive extends StatefulWidget {
  const TtryHive({Key  key}) : super(key: key);

  @override
  _TtryHiveState createState() => _TtryHiveState();
}

class _TtryHiveState extends State<TtryHive> {
  // final contactsBox = Hive.openBox('NotCompleteorder');

//   final contact  = Hive.box<NotComplete_order>('NotCompleteorder');
  @override
  void initState() {

   // opeen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),body: Column(children: [
    //
    //   Expanded(
    //   child: ValueListenableBuilder(
    //     valueListenable: Hive.box<NotComplete_order>('NotCompleteorder').listenable(),
    //     builder: (context, Box<NotComplete_order> box, _) {
    //       if (box.values.isEmpty) {
    //         return Text('data is empty');
    //       } else {
    //         return ListView.builder(
    //           itemCount: box.values.length,
    //           itemBuilder: (context, index) {
    //             var contact = box.getAt(index);
    //             return ListTile(
    //               title: Text(contact.customerId),
    //               subtitle: Text(contact.id.toString()),
    //             );
    //           },
    //         );
    //       }
    //     },
    //   )
    //
    //
    // ),

      TextButton(onPressed: ()async {
        mytryget(); //maint();
    }, child: Text('555'))
      ],),);
    }
  @override
  void dispose() {

   // Hive.close();
    super.dispose();
  }

  void opeen() async{

  }
  maint () {

    // get today's date
    var now = new DateTime.now();

    // set it to feb 10th for testing
    //now = now.add(new Duration(days:7));

    int today = now.weekday;

    // ISO week date weeks start on monday
    // so correct the day number
    var dayNr = (today + 6) % 7;

    // ISO 8601 states that week 1 is the week
    // with the first thursday of that year.
    // Set the target date to the thursday in the target week
    var thisMonday = now.subtract(new Duration(days:(dayNr)));
    var thisThursday = thisMonday.add(new Duration(days:3));

    // Set the target to the first thursday of the year
    // First set the target to january first
    var firstThursday = new DateTime(now.year, DateTime.january, 1);

    if(firstThursday.weekday != (DateTime.tuesday))
    {
      firstThursday = new DateTime(now.year, DateTime.january, 1 + ((4 - firstThursday.weekday) + 7) % 7);
    }

    // The weeknumber is the number of weeks between the
    // first thursday of the year and the thursday in the target week
    var x = thisThursday.millisecondsSinceEpoch - firstThursday.millisecondsSinceEpoch;
    var weekNumber = x.ceil() / 604800000; // 604800000 = 7 * 24 * 3600 * 1000

    print("Todays date: ${now}");
    print("Monday of this week: ${thisMonday}");
    print("Thursday of this week: ${thisThursday}");
    print("First Thursday of this year: ${firstThursday}");
    print("This week is week #${weekNumber.ceil()}");

  }
  mytryget(){
    // Current date and time of system
    String date = DateTime.now().toString();

// This will generate the time and date for first day of month
    String firstDay = date.substring(0, 8) + '01' + date.substring(10);

// week day for the first day of the month
    int weekDay = DateTime.parse(firstDay).weekday;

    DateTime testDate = DateTime.now();

    int weekOfMonth;

//  If your calender starts from Monday
    weekDay--;
    weekOfMonth = ((testDate.day + weekDay) / 7).ceil();
    print('Week of the month: $weekOfMonth');
    weekDay++;

// If your calender starts from sunday
    if (weekDay == 7) {
      weekDay = 0;
    }
    weekOfMonth = ((testDate.day + weekDay) / 7).ceil();
    print('Week of the month: $weekOfMonth');
  }

}
extension DateTimeExtension on DateTime {
  int get weekOfMonth {
    var wom = 0;
    var date = this;

    while (date.month == month) {
      wom++;
      date = date.subtract(const Duration(days: 7));
    }

    return wom;
  }
}