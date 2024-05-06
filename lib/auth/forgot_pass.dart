import 'package:ams/components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final text = TextEditingController();

  @override
  void dispose() {
    text.dispose();
    super.dispose();
  }

  Future passworddReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: text.text.trim());
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text(
              "Password reset link sent! Check your email",
              style: TextStyle(color: Colors.green),
            ),
          );
        },
      );
    } on Exception catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        title: const Text("Password Reset"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  "Enter your Email and we will send you a password reset link",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                  ),
                ),
              ),
              LoginTextfield(
                  controller: text, hintText: 'Email', obsecureText: false),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    passworddReset();
                  },
                  child: const Text("Reset Password"))
            ],
          ),
        ),
      ),
    );
  }
}
