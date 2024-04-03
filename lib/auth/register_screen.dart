// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ams/components/components.dart';
import 'package:ams/models/model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  final Function()? onTap;

  const RegisterScreen({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  FireStoreServices fs = FireStoreServices();

  String selectedItem = 'S1';
  String selectedItem1 = 'CSE';

  // String currentRole = 'Student';

  final userNameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: SingleChildScrollView(
        child: SafeArea(
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
              // DropdownButton(
              //   value: currentRole,
              //   items: const [
              //     DropdownMenuItem(value: 'Student', child: Text('Student')),
              //     DropdownMenuItem(value: 'Faculty', child: Text('Faculty')),
              //   ],
              //   onChanged: (value) {
              //     setState(() {
              //       currentRole = value!;
              //     });
              //   },
              // ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    icon: const Icon(Icons.arrow_drop_down),
                    value: selectedItem1,
                    items: const [
                      DropdownMenuItem<String>(
                        value: 'CSE',
                        child: Text("CSE"),
                      ),
                      DropdownMenuItem<String>(
                        value: 'EC',
                        child: Text("EC"),
                      ),
                      DropdownMenuItem<String>(
                        value: 'CIVIL',
                        child: Text("CIVIL"),
                      ),
                      DropdownMenuItem<String>(
                        value: 'MECH',
                        child: Text("MECH"),
                      ),
                      DropdownMenuItem<String>(
                        value: 'EEE',
                        child: Text("EEE"),
                      ),
                    ],
                    onChanged: (newValue) {
                      setState(() {
                        selectedItem1 = newValue!;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  DropdownButton<String>(
                    icon: const Icon(Icons.arrow_drop_down),
                    value: selectedItem,
                    items: const [
                      DropdownMenuItem<String>(
                        value: 'S1',
                        child: Text("S1"),
                      ),
                      DropdownMenuItem<String>(
                        value: 'S2',
                        child: Text("S2"),
                      ),
                      DropdownMenuItem<String>(
                        value: 'S3',
                        child: Text("S3"),
                      ),
                      DropdownMenuItem<String>(
                        value: 'S4',
                        child: Text("S4"),
                      ),
                      DropdownMenuItem<String>(
                        value: 'S5',
                        child: Text("S5"),
                      ),
                      DropdownMenuItem<String>(
                        value: 'S6',
                        child: Text("S6"),
                      ),
                      DropdownMenuItem<String>(
                        value: 'S7',
                        child: Text("S7"),
                      ),
                      DropdownMenuItem<String>(
                        value: 'S8',
                        child: Text("S8"),
                      ),
                    ],
                    onChanged: (newValue) {
                      setState(() {
                        selectedItem = newValue!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              LoginTextfield(
                controller: userNameController,
                hintText: 'Username',
                obsecureText: false,
              ),
              const SizedBox(
                height: 10,
              ),
              LoginTextfield(
                controller: emailController,
                hintText: 'Email',
                obsecureText: false,
              ),
              const SizedBox(
                height: 10,
              ),
              LoginTextfield(
                controller: passwordController,
                hintText: 'Password',
                obsecureText: true,
              ),
              const SizedBox(
                height: 10,
              ),
              LoginTextfield(
                controller: confirmController,
                hintText: 'Confirm Password',
                obsecureText: true,
              ),
              const SizedBox(
                height: 25,
              ),
              button2(
                onTap: () async {
                  try {
                    if (passwordController.text == confirmController.text) {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      final uid = FirebaseAuth.instance.currentUser?.uid;

                      fs.addUser(
                          branch: selectedItem1,
                          sem: selectedItem,
                          uid: uid.toString(),
                          // role: currentRole,
                          userName: userNameController.text);

                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Registered successfully"),
                        backgroundColor: Colors.green,
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Passwords don't match"),
                        backgroundColor: Colors.red,
                      ));
                    }
                  } on FirebaseAuthException catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(e.code),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                text: 'Register',
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already a member?',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Log in',
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
      ),
    );
  }
}
