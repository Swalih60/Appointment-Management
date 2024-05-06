import 'package:ams/components/components.dart';
import 'package:ams/models/model.dart';
import 'package:ams/screens/student/digital_screen.dart';
import 'package:ams/screens/student/schedule_screen.dart';
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
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xfff6f6f6), Color(0xff6b64e8)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: const Color.fromARGB(255, 183, 214, 240),
          shadowColor: Colors.blue,
          title: Text(
            displayName!,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, date, _) {
                    // Customize the appearance of the day cell
                    // Here, you can change the cell color based on the events (princ, vice, asst)
                    Color cellColor = Colors.transparent;

                    if (date.year == today.year &&
                        date.month == today.month &&
                        date.day == today.day) {
                      cellColor =
                          Colors.grey; // Highlight today's date with grey color
                    }

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
                height: 80,
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
                        builder: (context) => ScheduleAppointment(),
                      ));
                    },
                    child: 'SCHEDULE',
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              button(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const StatusScreen(),
                  ));
                },
                child: 'Status',
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
