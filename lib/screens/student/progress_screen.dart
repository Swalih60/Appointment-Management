import 'package:ams/components/components.dart';
import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

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
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.directions_run,
              ),
            ),
          ],
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: const Color.fromARGB(255, 183, 214, 240),
          shadowColor: Colors.blue,
          title: const Center(
              child: Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Text(
              "Progress Tracker",
              style: TextStyle(color: Colors.black),
            ),
          )),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              row(
                text: 'Senior Advisor',
                width: 60,
              ),
              const SizedBox(
                height: 30,
              ),
              row(
                text: 'HOD',
                width: 143,
              ),
              const SizedBox(
                height: 30,
              ),
              row(
                text: 'Vice Principal',
                width: 68,
              ),
              const SizedBox(
                height: 30,
              ),
              row(
                text: 'Principal',
                width: 106,
              ),
              const SizedBox(
                height: 30,
              ),
              row(
                text: 'Asst Manager',
                width: 65,
              ),
              const SizedBox(
                height: 30,
              ),
              row(
                text: 'Manager',
                width: 108,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
