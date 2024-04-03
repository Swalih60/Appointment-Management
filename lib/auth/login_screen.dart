// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ams/components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    super.key,
    required this.onTap,
  });

  final Function()? onTap;
  final auth = FirebaseAuth.instance.currentUser;
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/AMS_LOGO1.png'),
              width: 380,
              height: 150,
            ),
            const SizedBox(
              height: 25,
            ),
            LoginTextfield(
              controller: emailController,
              hintText: 'Email',
              obsecureText: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const SnackBar(
                        content: Text("Field should not be empty"),
                        backgroundColor: Colors.red,
                      );
                    },
                  );
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            LoginTextfield(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const SnackBar(
                        content: Text("Field should not be empty"),
                        backgroundColor: Colors.red,
                      );
                    },
                  );
                }
                return null;
              },
              controller: passwordController,
              hintText: 'Password',
              obsecureText: true,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            button2(
              onTap: () async {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                } on FirebaseAuthException catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(e.code),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              text: 'Sign In',
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member?',
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: onTap,
                  child: const Text(
                    'Register now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
