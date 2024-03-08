// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ams/components/components.dart';
import 'package:ams/models/model.dart';
import 'package:ams/screens/hod/requests_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ApprovalHodScreen extends StatelessWidget {
  FireStoreServices fs = FireStoreServices();

  ApprovalHodScreen({
    Key? key,
  }) : super(key: key);

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
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 183, 214, 240),
          shadowColor: Colors.blue,
          title: const Text(
            "Requests",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: fs.requests
              .where('FacultyApproval', isEqualTo: true)
              .orderBy('TimeStamp', descending: true)
              .snapshots(),
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
                  String requestFrom = data['From'] ?? 'Unknown';
                  String requestTo = data['To'] ?? 'Unknown';
                  String requestSubject = data['Subject'] ?? 'Unknown';
                  String requestBody = data['Body'] ?? 'Unknown';
                  // String facultyApproval = data['FacultyApproval'] ?? 'Unknown';
                  Timestamp requestTime = data['TimeStamp'] ?? 'Unknown';

                  DateTime dateTime = requestTime.toDate();

                  return listile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RequestScreenHod(
                                    docId: docID,
                                    from: requestFrom,
                                    to: requestTo,
                                    subject: requestSubject,
                                    body: requestBody,
                                  )));
                    },
                    title: requestFrom,
                    trailing: dateTime,
                    subtitle: requestSubject,
                  );
                },
              );
            } else {
              return const Center(child: Text("No Requests"));
            }
          },
        ),
      ),
    );
  }
}
