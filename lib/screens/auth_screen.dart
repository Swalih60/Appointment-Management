import 'package:ams/screens/asst_manager/asst_screen.dart';
import 'package:ams/screens/faculty/faculty_screen.dart';
import 'package:ams/screens/hod/hod_screen.dart';
import 'package:ams/screens/login_or_registerscreen.dart';
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
            } else if (uid == 'GfaTqmy4QSWhSfncR4Bui6JfNZv2') {
              return const FacultyScreen();
            } else if (uid == '4rSESY1K7kcFiYY5ctElTqbWGCI3') {
              return const HodScreen();
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
