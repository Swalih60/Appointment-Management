import 'package:ams/auth/auth_screen.dart';
import 'package:ams/firebase_options.dart';
import 'package:ams/screens/asst_manager/approval_screen.dart';
import 'package:ams/screens/asst_manager/asst_screen.dart';
import 'package:ams/screens/faculty/approval_screen.dart';
import 'package:ams/screens/faculty/faculty_screen.dart';
import 'package:ams/screens/hod/approval_screen.dart';
import 'package:ams/screens/hod/hod_screen.dart';
import 'package:ams/screens/principal/approval_screen.dart';
import 'package:ams/screens/principal/principal_screen.dart';
import 'package:ams/screens/student/digital_screen.dart';
import 'package:ams/screens/student/progress_screen.dart';
import 'package:ams/screens/student/student_screen.dart';
import 'package:ams/screens/vicePrincipal/approval_screen.dart';
import 'package:ams/screens/vicePrincipal/vice_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
      home: const AuthScreen(),
      routes: {
        '/asst': (context) => const AsstScreen(),
        '/principal': (context) => const PrincipalScreen(),
        '/vice': (context) => const ViceScreen(),
        '/faculty': (context) => const FacultyScreen(),
        '/student': (context) => StudenScreen(),
        '/digital': (context) => const DigitalLetterScreen(),
        '/progress': (context) => const ProgressScreen(),
        '/hod': (context) => const HodScreen(),
        '/approval_faculty': (context) => ApprovalFacultyScreen(),
        '/approval_hod': (context) => ApprovalHodScreen(),
        '/approval_vice': (context) => ApprovalViceScreen(),
        '/approval_principal': (context) => ApprovalPrincipalScreen(),
        '/approval_asst': (context) => ApprovalAsstScreen(),
      },
    );
  }
}
