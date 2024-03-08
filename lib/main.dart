import 'package:ams/firebase_options.dart';
import 'package:ams/screens/faculty/approval_screen.dart';
import 'package:ams/screens/faculty/faculty_screen.dart';
import 'package:ams/screens/hod/approval_screen.dart';
import 'package:ams/screens/hod/hod_screen.dart';
import 'package:ams/screens/student/digital_screen.dart';
import 'package:ams/screens/student/progress_screen.dart';
import 'package:ams/screens/student/proposal_screen.dart';
import 'package:ams/screens/student/student_screen.dart';
import 'package:ams/screens/vicePrincipal/approval_screen.dart';
import 'package:ams/screens/vicePrincipal/principal_screen.dart';
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
        '/vice': (context) => const VicePrincipalScreen(),
        '/faculty': (context) => const FacultyScreen(),
        '/student': (context) => const StudenScreen(),
        '/proposal': (context) => const ProposalScreen(),
        '/digital': (context) => const DigitalLetterScreen(),
        '/progress': (context) => const ProgressScreen(),
        '/hod': (context) => const HodScreen(),
        '/approval_faculty': (context) => ApprovalFacultyScreen(),
        '/approval_hod': (context) => ApprovalHodScreen(),
        '/approval_vice': (context) => ApprovalVicePrincipalScreen(),
      },
    );
  }
}
