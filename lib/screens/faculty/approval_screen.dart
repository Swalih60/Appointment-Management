import 'package:ams/models/model.dart';
import 'package:ams/screens/faculty/requests.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ApprovalScreen extends StatelessWidget {
  FireStoreServices fs = FireStoreServices();

  ApprovalScreen({super.key});

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
          title: const Center(
              child: Text(
            "Requests",
            style: TextStyle(color: Colors.black),
          )),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: fs.getrequests(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List requestList = snapshot.data!.docs;

              return ListView.builder(
                itemCount: requestList.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot document = requestList[index];
                  String docID = document.id;
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  String requestFrom = data['From'];
                  String requestTo = data['To'];
                  String requestSubject = data['Subject'];
                  String requestBody = data['Body'];
                  String requestTime = data['TimeStamp'];

                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RequestScreen(
                                  from: requestFrom,
                                  to: requestTo,
                                  subject: requestSubject,
                                  body: requestBody)));
                    },
                    title: Text((requestFrom)),
                    trailing: Text(requestTime),
                    subtitle: Text(requestSubject),
                  );
                },
              );
            } else {
              return const Text("No Requests");
            }
          },
        ),
      ),
    );
  }
}
