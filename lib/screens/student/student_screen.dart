import 'package:ams/components/components.dart';
import 'package:ams/models/model.dart';
import 'package:ams/screens/student/digital_screen.dart';
import 'package:ams/screens/student/schedule_screen.dart';
import 'package:ams/screens/student/status_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StudenScreen extends StatelessWidget {
  final FireStoreServices fs = FireStoreServices();
  StudenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
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
          drawer: Drawer(
              backgroundColor: Colors.deepPurple[100],
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ListTile(
                    leading: const Icon(Icons.directions_run),
                    title: const Text("S T A T U S"),
                    onTap: () {
                      Navigator.of(context).pushNamed('/progress');
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("S E T T T I N G S"),
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text("A B O U T  U S"),
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: const Icon(Icons.question_mark),
                    title: const Text("H E L P"),
                    onTap: () {},
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 140),
                    child: ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text("Sign Out"),
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                      },
                    ),
                  )
                ],
              )),
          appBar: AppBar(
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
              ),
            ],
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: const Color.fromARGB(255, 183, 214, 240),
            shadowColor: Colors.blue,
            title: const Text(
              "Student",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    button(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const DigitalLetterScreen(),
                          ));
                        },
                        child: 'NEW PROPOSAL'),
                    const SizedBox(
                      width: 10,
                    ),
                    button(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ScheduleAppointment(),
                          ));
                        },
                        child: 'SCHEDULE'),
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
                    child: 'Status'),
                const SizedBox(
                  height: 80,
                )
              ],
            ),
          )),
    );
  }
}
