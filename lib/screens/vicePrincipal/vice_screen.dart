import 'package:flutter/material.dart';

import '../../components/components.dart';

class ViceScreen extends StatelessWidget {
  const ViceScreen({super.key});

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
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              )),
          appBar: AppBar(
            centerTitle: true,
            actions: [
              InkWell(
                splashColor: Colors.black,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      border: Border.all(color: Colors.green, width: 3),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.check,
                        size: 25,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
              ),
            ],
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: const Color.fromARGB(255, 183, 214, 240),
            shadowColor: Colors.blue,
            title: const Text(
              "VICE PRINCIPAL",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 70,
                  width: 350,
                  child: button1(
                      onPressed: () {
                        Navigator.pushNamed(context, '/approval_vice');
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