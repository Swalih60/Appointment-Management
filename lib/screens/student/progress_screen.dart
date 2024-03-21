import 'package:flutter/material.dart';

final ValueNotifier<Color> facColor = ValueNotifier(Colors.red);
final ValueNotifier<Color> hodColor = ValueNotifier(Colors.red);
final ValueNotifier<Color> viceColor = ValueNotifier(Colors.red);
final ValueNotifier<Color> princColor = ValueNotifier(Colors.red);
final ValueNotifier<Color> asstColor = ValueNotifier(Colors.red);

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

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
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.directions_run,
              ),
            ),
          ],
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: const Color.fromARGB(255, 183, 214, 240),
          shadowColor: Colors.blue,
          title: const Text(
            "Progress Tracker",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            ValueListenableBuilder(
              valueListenable: facColor,
              builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, color: value),
                    ),
                    Text(
                      "FACULTY",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, color: value),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, color: value),
                    )
                  ],
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: hodColor.value),
                ),
                Text(
                  "HOD",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: hodColor.value),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: hodColor.value),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: viceColor.value),
                ),
                Text(
                  "VICE PRINCIPAL",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: viceColor.value),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: viceColor.value),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: princColor.value),
                ),
                Text(
                  "PRINCIPAL",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: princColor.value),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: princColor.value),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: asstColor.value),
                ),
                Text(
                  "ASST MANAGER",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: asstColor.value),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: asstColor.value),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
