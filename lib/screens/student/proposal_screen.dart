import 'package:ams/components/components.dart';
import 'package:flutter/material.dart';

class ProposalScreen extends StatelessWidget {
  const ProposalScreen({super.key});

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
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'NEW PROPOSAL',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: const Color.fromARGB(255, 183, 214, 240),
          shadowColor: Colors.blue,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150,
              ),
              button1(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/digital');
                  },
                  text: 'Digital Letter',
                  icon: Icons.edit),
              const SizedBox(
                height: 20,
              ),
              button1(
                  onPressed: () {}, text: 'Attach Letter', icon: Icons.mail),
              const SizedBox(
                height: 260,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
