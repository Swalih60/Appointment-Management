import 'package:ams/screens/asst_manager/appointment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../components/components.dart';

class AsstScreen extends StatefulWidget {
  const AsstScreen({Key? key}) : super(key: key);

  @override
  State<AsstScreen> createState() => _AsstScreenState();
}

class _AsstScreenState extends State<AsstScreen> {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  late DateTime today;
  List<DateTime> selectedDates = [];

  @override
  void initState() {
    super.initState();
    today = DateTime.now();
    fetchSelectedDates();
  }

  Future<void> fetchSelectedDates() async {
    try {
      // Fetch selected dates from Firestore
      DocumentSnapshot selectedDatesSnapshot = await FirebaseFirestore.instance
          .collection('selected_dates')
          .doc('asst')
          .get();

      if (selectedDatesSnapshot.exists) {
        List<dynamic> dateStrings =
            (selectedDatesSnapshot.data() as Map)['dates'];
        setState(() {
          selectedDates = dateStrings
              .map((dateString) => DateTime.parse(dateString))
              .toList();
        });
      }
    } catch (e) {
      print('Error fetching selected dates: $e');
    }
  }

  Future<void> updateSelectedDates(List<DateTime> selectedDates) async {
    // Convert the list of DateTime objects to a list of formatted date strings
    List<String> dateStrings =
        selectedDates.map((date) => date.toString()).toList();

    try {
      // Get a reference to the Firestore collection where selected dates are stored
      CollectionReference selectedDatesCollection =
          FirebaseFirestore.instance.collection('selected_dates');

      // Update the selected dates in Firestore
      await selectedDatesCollection.doc('asst').set({'dates': dateStrings});
    } catch (e) {
      // Handle any errors
      print('Error updating selected dates: $e');
    }
  }

  void onSelectedDatesUpdated(List<DateTime> selectedDates) {
    // Update selected dates in Firestore
    updateSelectedDates(selectedDates);
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
        title: const Text(
          "ASST MANAGER",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TableCalendar(
              focusedDay: today,
              firstDay: DateTime.utc(2024),
              lastDay: DateTime.utc(2030),
              rowHeight: 55,
              headerStyle: const HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
              ),
              selectedDayPredicate: (day) => selectedDates.contains(day),
              calendarStyle: const CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
              onDaySelected: (selectedDay, focusedDay) {
                String select =
                    ("${selectedDay.day}/${selectedDay.month}/${selectedDay.year}");
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(
                        "Mark Leave on $select ?",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      actions: [
                        IconButton(
                          color: Colors.red,
                          onPressed: () {
                            setState(() {
                              selectedDates.remove(selectedDay);
                              onSelectedDatesUpdated(selectedDates);
                            });
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.close),
                        ),
                        IconButton(
                          color: Colors.green,
                          onPressed: () {
                            setState(() {
                              selectedDates.add(selectedDay);
                              onSelectedDatesUpdated(selectedDates);
                            });
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.check),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            const SizedBox(
              height: 60,
            ),
            Column(
              children: [
                SizedBox(
                  height: 70,
                  width: 350,
                  child: button1(
                    onPressed: () {
                      Navigator.pushNamed(context, '/approval_asst');
                    },
                    text: 'Approval',
                    icon: Icons.handshake,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 70,
                  width: 350,
                  child: button1(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ApproveOrRejectAsst(uid: uid),
                          ));
                    },
                    text: 'Appointments',
                    icon: Icons.handshake,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
