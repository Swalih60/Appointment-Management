import 'package:ams/auth/auth_screen.dart';
import 'package:ams/firebase_options.dart';
import 'package:ams/screens/asst_manager/approval_screen.dart';
import 'package:ams/screens/asst_manager/asst_screen.dart';
import 'package:ams/screens/faculty/year1_fac.dart/approval_screen.dart';
import 'package:ams/screens/faculty/year1_fac.dart/faculty_screen.dart';
import 'package:ams/screens/hod/approval_screen.dart';
import 'package:ams/screens/hod/hod_screen.dart';
import 'package:ams/screens/principal/approval_screen.dart';
import 'package:ams/screens/principal/principal_screen.dart';
import 'package:ams/screens/student/digital_screen.dart';
import 'package:ams/screens/student/progress_screen.dart';
import 'package:ams/screens/student/student_screen.dart';
import 'package:ams/screens/vicePrincipal/approval_screen.dart';
import 'package:ams/screens/vicePrincipal/vice_screen.dart';
import 'package:csv/csv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // final data = await readCSV();
  // await createUsers(data);

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
        '/faculty': (context) => const FacultyScreenYear1(),
        '/student': (context) => const StudenScreen(),
        '/digital': (context) => const DigitalLetterScreen(),
        '/progress': (context) => const ProgressScreen(),
        '/hod': (context) => const HodScreen(),
        '/approval_faculty': (context) => ApprovalFacultyScreenYear1(),
        '/approval_hod': (context) => ApprovalHodScreen(),
        '/approval_vice': (context) => ApprovalViceScreen(),
        '/approval_principal': (context) => ApprovalPrincipalScreen(),
        '/approval_asst': (context) => ApprovalAsstScreen(),
      },
    );
  }
}

Future<List<List<dynamic>>> readCSV() async {
  final csvData = await rootBundle.loadString('assets/Batch_10_student.csv');
  List<List<dynamic>> data = const CsvToListConverter().convert(csvData);
  return data;
}

// Future<void> createUsers(List<List<dynamic>> data) async {
//   final auth = FirebaseAuth.instance;

//   for (var row in data) {
//     final email = row[9]; // 9th row
//     final password = row[4]; // 5th row
//     final branch=row[];

//     try {
//       final userCredential = await auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       await userCredential.user!.updateDisplayName(branch);
//       print('User created: ${userCredential.user?.email}');
//     } on FirebaseAuthException catch (e) {
//       print('Failed to create user: $e');
//     }
//   }
// }
