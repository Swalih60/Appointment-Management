import 'package:ams/screens/faculty/year3_fac.dart/approval_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../components/components.dart';

class FacultyScreenYear4 extends StatelessWidget {
  const FacultyScreenYear4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xfff6f6f6), Color(0xff6b64e8)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: Drawer(
              backgroundColor: Colors.deepPurple[100],
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ListTile(
                    leading: const Icon(Icons.directions_run),
                    title: const Text("S T A T U S"),
                    onTap: () {
                      Navigator.of(context).pushNamed('/progress');
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("S E T T T I N G S"),
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text("A B O U T  U S"),
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: const Icon(Icons.question_mark),
                    title: const Text("H E L P"),
                    onTap: () {},
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 140),
                    child: ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text("Sign Out"),
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                      },
                    ),
                  )
                ],
              )),
          appBar: AppBar(
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
              ),
            ],
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: const Color.fromARGB(255, 183, 214, 240),
            shadowColor: Colors.blue,
            title: const Text(
              "FACULTY",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 60,
                      child: button1(
                          onPressed: () {},
                          text: 'New Proposal',
                          icon: Icons.insert_drive_file),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      height: 60,
                      child: button1(
                          onPressed: () {},
                          text: 'Progress ',
                          icon: Icons.directions_run),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 70,
                  width: 350,
                  child: button1(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ApprovalFacultyScreenYear3(),
                            ));
                      },
                      text: 'Approval',
                      icon: Icons.handshake),
                ),
                const SizedBox(
                  height: 60,
                )
              ],
            ),
          )),
    );
  }
}
