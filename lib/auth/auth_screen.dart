import 'package:ams/auth/login_or_registerscreen.dart';
import 'package:ams/screens/asst_manager/asst_screen.dart';
import 'package:ams/screens/faculty/year1_fac.dart/faculty_screen.dart';
import 'package:ams/screens/faculty/year2_fac.dart/faculty_screen.dart';
import 'package:ams/screens/faculty/year3_fac.dart/faculty_screen.dart';
import 'package:ams/screens/faculty/year4_fac.dart/faculty_screen.dart';
import 'package:ams/screens/hod/hod_screen.dart';
import 'package:ams/screens/principal/principal_screen.dart';
import 'package:ams/screens/student/student_screen.dart';
import 'package:ams/screens/vicePrincipal/vice_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final uid = FirebaseAuth.instance.currentUser?.uid;
            if (uid == '5PeekWMyJOfapxh2duMq4yDxjN22') {
              return const ViceScreen();
            } else if (uid == 'jHu8AksxVFVwhp4syrRhg9pjBqj1') {
              return const AsstScreen();
            } else if (uid == 'zofcA4Ov87Y4sJsOQ4Co6PmdLVN2') {
              return const PrincipalScreen();
            } else if (uid == 'HuY0JwDKqmZsstiYLLvDiZUwoMF3') {
              return const FacultyScreenYear1();
            } else if (uid == 'G6n2Q4AZoYVNkRmXHfk8MFhNSAB3') {
              return const HodScreen();
            } else if (uid == 'p6TdZpfXbodMSKKRvUYsGiqZFNh1') {
              return const FacultyScreenYear2();
            } else if (uid == 'OOyHRughnFVFxsg3io13WXsfCz63') {
              return const FacultyScreenYear3();
            } else if (uid == '1xaWC585gjTAyfnfL47zjnEZWos2') {
              return const FacultyScreenYear4();
            } else {
              return const StudenScreen();
            }
          } else {
            return const LoginOrRegisterScreen();
          }
        },
      ),
    );
  }
}
