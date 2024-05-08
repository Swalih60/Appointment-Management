// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ams/models/model.dart';
import 'package:ams/screens/student/approved.dart';
import 'package:ams/screens/student/rejected.dart';
import 'package:flutter/material.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  final FireStoreServices fs = FireStoreServices();

  final List screens = [ApprovedScreen(), RejectedScreen()];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        shadowColor: Colors.blue,
        title: const Text(
          "Status",
          style: TextStyle(color: Colors.white),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 183, 214, 240),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Approved'),
          BottomNavigationBarItem(icon: Icon(Icons.close), label: 'Rejected'),
        ],
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      body: screens[currentIndex],
    );
  }
}
