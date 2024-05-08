// student_home.dart

import 'package:ams/screens/student/appointment_schedule_screen/approve_or_reject_screen.dart';
import 'package:ams/screens/student/appointment_schedule_screen/schedule.dart';
import 'package:ams/screens/student/appointment_schedule_screen/scheduled_appointment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StudentHomePage extends StatelessWidget {
  final String uid; // Add this line to declare the uid variable

  // Modify the constructor to accept uid as a parameter
  StudentHomePage({Key? key, required this.uid}) : super(key: key);

  final displayName = FirebaseAuth.instance.currentUser!.displayName;

  @override
  Widget build(BuildContext context) {
    print('User id from student = $uid');
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColorDark,
        centerTitle: true,
        title: Text(
          displayName!,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 200.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 300,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).primaryColorDark),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScheduleAppointment(
                                    uid: uid,
                                  )));
                    },
                    child: const Text(
                      "Schedule Appointment",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).primaryColorDark),
                    ),
                    onPressed: () {
                      print('uid send to scheduled appointment = $uid');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScheduledAppointment(
                                    uid: uid,
                                  )));
                    },
                    child: const Text(
                      "Scheduled Appointment",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).primaryColorDark),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ApproveOrRejectScreen()));
                      // StatusHomePage studentId = StatusHomePage();
                      // studentId.uid = uid;
                    },
                    child: const Text(
                      "Status",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
