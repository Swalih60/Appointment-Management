import 'package:ams/screens/student/appointment_schedule_screen/approve_status.dart';
import 'package:ams/screens/student/appointment_schedule_screen/reject_status.dart';
import 'package:flutter/material.dart';

class ApproveOrRejectScreen extends StatefulWidget {
  const ApproveOrRejectScreen({super.key, required});

  @override
  State<ApproveOrRejectScreen> createState() => _ApproveOrRejectScreenState();
}

class _ApproveOrRejectScreenState extends State<ApproveOrRejectScreen> {
  final List screens = [ApproveStatusPage(), RejectStatusPage()];

  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 183, 214, 240),
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Approved'),
          BottomNavigationBarItem(icon: Icon(Icons.close), label: 'Rejected'),
        ],
        currentIndex: currentindex,
        onTap: (value) {
          setState(() {
            currentindex = value;
          });
        },
      ),
    );
  }
}
