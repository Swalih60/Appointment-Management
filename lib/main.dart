import 'package:ams/adminofficial_screen.dart';
import 'package:ams/digital_screen.dart';
import 'package:ams/hod_screen.dart';
import 'package:ams/proposal_screen.dart';
import 'package:ams/student_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: {
        '/adminofficial': (context) => const AdminOfficial(),
        '/hod': (context) => const HodScreen(),
        '/student': (context) => const StudenScreen(),
        '/proposal': (context) => const ProposalScreen(),
        '/digital': (context) => const DigitalLetterScreen()
      },
    );
  }
}
