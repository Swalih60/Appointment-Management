import 'package:ams/components/components.dart';
import 'package:ams/models/model.dart';
import 'package:ams/screens/student/appointment_schedule_screen/student_home.dart';
import 'package:ams/screens/student/digital_screen.dart';
import 'package:ams/screens/student/progress_list_screen.dart';
import 'package:ams/screens/student/status_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class StudenScreen extends StatefulWidget {
  const StudenScreen({Key? key}) : super(key: key);

  @override
  State<StudenScreen> createState() => _StudenScreenState();
}

class _StudenScreenState extends State<StudenScreen> {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final FireStoreServices fs = FireStoreServices();
  final displayName = FirebaseAuth.instance.currentUser!.displayName;
  DateTime today = DateTime.now();
  Map<DateTime, List> events = {};
  List<DateTime> princiDates = [];
  List<DateTime> viceDates = [];
  List<DateTime> asstDates = [];

  @override
  void initState() {
    super.initState();
    fetchDates();
  }

  Future<void> fetchDates() async {
    try {
      // Fetch dates for princ
      DocumentSnapshot princSnapshot = await FirebaseFirestore.instance
          .collection('selected_dates')
          .doc('princi')
          .get();
      if (princSnapshot.exists) {
        List<dynamic> princDatesData = (princSnapshot.data() as Map)['dates'];
        princDatesData.forEach((date) {
          princiDates.add(DateTime.parse(date));
        });
      }

      // Fetch dates for vice
      DocumentSnapshot viceSnapshot = await FirebaseFirestore.instance
          .collection('selected_dates')
          .doc('vice')
          .get();
      if (viceSnapshot.exists) {
        List<dynamic> viceDatesData = (viceSnapshot.data() as Map)['dates'];
        viceDatesData.forEach((date) {
          viceDates.add(DateTime.parse(date));
        });
      }

      // Fetch dates for asst
      DocumentSnapshot asstSnapshot = await FirebaseFirestore.instance
          .collection('selected_dates')
          .doc('asst')
          .get();
      if (asstSnapshot.exists) {
        List<dynamic> asstDatesData = (asstSnapshot.data() as Map)['dates'];
        asstDatesData.forEach((date) {
          asstDates.add(DateTime.parse(date));
        });
      }

      // Update the events map
      events = {
        for (DateTime date in princiDates) ...{
          date: ['princi']
        },
        for (DateTime date in viceDates) ...{
          date: ['vice']
        },
        for (DateTime date in asstDates) ...{
          date: ['asst']
        }
      };

      setState(() {});
    } catch (e) {
      print('Error fetching dates: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueAccent,
        shadowColor: Colors.blue,
        title: Text(
          displayName!,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Asst Manager Leave',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Text(
                  'Principal Leave',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Text(
                  'Vice Principal Leave',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            TableCalendar(
              firstDay: DateTime.utc(2024),
              lastDay: DateTime.utc(2030),
              rowHeight: 60,
              headerStyle: const HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
              ),
              eventLoader: (day) {
                return events[day] ?? [];
              },
              calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    // color:Color(0xFFEE3240),
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  todayTextStyle: TextStyle(
                    color: Colors.amber,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: TextStyle(
                    color: Colors.blue,
                  ),
                  defaultTextStyle: TextStyle(
                    color: Colors.black,
                  ),
                  weekendTextStyle: TextStyle(
                    // color:Color(0xFFEE3240),
                    color: Colors.red,
                  )),
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                  color: Colors.black,
                ),
                weekendStyle: TextStyle(
                  color: Colors.red,
                ),
              ),
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, date, _) {
                  // Customize the appearance of the day cell
                  // Here, you can change the cell color based on the events (princ, vice, asst)
                  Color cellColor = Colors.transparent;

                  bool isToday = date.year == today.year &&
                      date.month == today.month &&
                      date.day == today.day;

                  Color borderColor =
                      isToday ? Colors.grey : Colors.transparent;

                  if (events.containsKey(date)) {
                    final eventTypes = events[date];
                    if (eventTypes!.contains('princi')) {
                      cellColor = Colors.red; // Customize color for princ
                    } else if (eventTypes.contains('vice')) {
                      cellColor = Colors.blue; // Customize color for vice
                    } else if (eventTypes.contains('asst')) {
                      cellColor = Colors.green; // Customize color for asst
                    }
                  }
                  return Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: cellColor,
                      border: Border.all(color: borderColor),
                    ),
                    child: Center(
                      child: Text(
                        '${date.day}',
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  today = selectedDay;
                });
              },
              focusedDay: today,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                button(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DigitalLetterScreen(),
                    ));
                  },
                  child: 'NEW PROPOSAL',
                ),
                const SizedBox(
                  width: 10,
                ),
                button(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => StudentHomePage(
                        uid: uid,
                      ),
                    ));
                  },
                  child: 'SCHEDULE',
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                button(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const StatusScreen(),
                    ));
                  },
                  child: 'Status',
                ),
                const SizedBox(width: 10),
                button(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProgressListScreen(),
                    ));
                  },
                  child: 'Progress',
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
