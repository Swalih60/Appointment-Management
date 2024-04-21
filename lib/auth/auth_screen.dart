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
            if (uid == '7kkEzh8uX8hCc0k4C9k3xHjhqc42') {
              return const ViceScreen();
            } else if (uid == 'XMb1clFkN3gDmaS6xViHc3LsSWh2') {
              return const AsstScreen();
            } else if (uid == 'CItfuzgrysg3gbk2G5Q8Fgke80n1') {
              return const PrincipalScreen();
            } else if (uid == '2169F4vStnQyYNahJxpEpNoX4rd2') {
              return const FacultyScreenYear1();
            } else if (uid == '4rSESY1K7kcFiYY5ctElTqbWGCI3') {
              return const HodScreen();
            } else if (uid == '9hUseMU9jpOo2NdyGF9PqrIVY652') {
              return const FacultyScreenYear2();
            } else if (uid == 'oOgYlVROVFZtUVEYUrDyRjjT6dz1') {
              return const FacultyScreenYear3();
            } else if (uid == 'gGfB3IjeRCc7qEH5wEmLI4Zeawb2') {
              return const FacultyScreenYear4();
            } else {
              return StudenScreen();
            }
          } else {
            return const LoginOrRegisterScreen();
          }
        },
      ),
    );
  }
}
