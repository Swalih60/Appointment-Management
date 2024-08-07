import 'package:ams/screens/student/appointment_schedule_screen/approve_status.dart';
import 'package:ams/screens/student/appointment_schedule_screen/reject_status.dart';
import 'package:flutter/material.dart';

class StatusHomePage extends StatelessWidget {
  final String uid; // Add this line to declare the uid variable

  // Modify the constructor to accept uid as a parameter
  StatusHomePage({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('User id from status = $uid');
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blueAccent)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ApproveStatusPage()));
                },
                child: const Text(
                  'Approved',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blueAccent)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RejectStatusPage()));
                },
                child: const Text(
                  'Rejected',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
