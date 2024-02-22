import 'package:flutter/material.dart';

class RequestScreen extends StatelessWidget {
  final String from;
  final String to;
  final String subject;
  final String body;

  const RequestScreen(
      {super.key,
      required this.from,
      required this.to,
      required this.subject,
      required this.body});

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
          backgroundColor: const Color.fromARGB(255, 183, 214, 240),
          shadowColor: Colors.blue,
          title: Center(
              child: Text(
            from,
            style: const TextStyle(color: Colors.black),
          )),
        ),
        body: Column(
          children: [
            Text(from),
            Text(to),
            Text(subject),
            Text(body),
          ],
        ),
      ),
    );
  }
}
