// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProgressScreen extends StatelessWidget {
  ProgressScreen({
    Key? key,
    required this.facApproval,
    required this.viceApproval,
    required this.princiApproval,
    required this.hodApproval,
    required this.asstApproval,
    required this.to,
  }) : super(key: key);

  final bool facApproval;
  final bool viceApproval;
  final bool princiApproval;
  final bool hodApproval;
  final bool asstApproval;
  String to;

  @override
  Widget build(BuildContext context) {
    if (to == 'Faculty') {
      to = '1';
    } else if (to == 'Hod') {
      to = '2';
    } else if (to == 'Vice Principal') {
      to = '3';
    } else if (to == 'Principal') {
      to = '4';
    } else if (to == 'Asst Manager') {
      to = '5';
    }

    Color facColor = Colors.red;
    Color hodColor = Colors.red;
    Color viceColor = Colors.red;
    Color princColor = Colors.red;
    Color asstColor = Colors.red;

    if (facApproval) facColor = Colors.green;
    if (hodApproval) hodColor = Colors.green;
    if (viceApproval) viceColor = Colors.green;
    if (princiApproval) princColor = Colors.green;
    if (asstApproval) asstColor = Colors.green;

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
            if (int.parse(to) >= 1)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: facColor),
                  ),
                  Text(
                    "FACULTY",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, color: facColor),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: facColor),
                  )
                ],
              ),
            if (int.parse(to) >= 2)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: hodColor),
                  ),
                  Text(
                    "HOD",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, color: hodColor),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: hodColor),
                  )
                ],
              ),
            if (int.parse(to) >= 3)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: viceColor),
                  ),
                  Text(
                    "VICE PRINCIPAL",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: viceColor),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: viceColor),
                  )
                ],
              ),
            if (int.parse(to) >= 4)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: princColor),
                  ),
                  Text(
                    "PRINCIPAL",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: princColor),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: princColor),
                  )
                ],
              ),
            if (int.parse(to) >= 5)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: asstColor),
                  ),
                  Text(
                    "ASST MANAGER",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: asstColor),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: asstColor),
                  )
                ],
              )
          ],
        )),
      ),
    );
  }
}
