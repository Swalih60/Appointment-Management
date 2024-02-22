import 'package:ams/firebase_options.dart';
import 'package:ams/screens/adminofficial_screen.dart';
import 'package:ams/screens/digital_screen.dart';
import 'package:ams/screens/hod_screen.dart';
import 'package:ams/screens/progress_screen.dart';
import 'package:ams/screens/proposal_screen.dart';
import 'package:ams/screens/student_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        '/digital': (context) => DigitalLetterScreen(),
        '/progress': (context) => const ProgressScreen()
      },
    );
  }
}
