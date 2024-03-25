// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ams/models/model.dart';
import 'package:ams/screens/student/reply_screen.dart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ApprovedScreen extends StatelessWidget {
  ApprovedScreen({Key? key}) : super(key: key);

  final FireStoreServices fs = FireStoreServices();

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
            body: StreamBuilder<QuerySnapshot>(
                stream: fs.getApproves(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<DocumentSnapshot> requestList = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: requestList.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot document = requestList[index];
                        String docID = document.id;
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;

                        String requestTo = data['To'] ?? 'Unknown';
                        String requestSubject = data['Subject'] ?? 'Unknown';
                        String requestBody = data['Body'] ?? 'Unknown';
                        String comment = data['comment'] ?? 'Unknown';

                        if (requestTo == '1') {
                          requestTo = 'Faculty';
                        } else if (requestTo == '2') {
                          requestTo = 'Hod';
                        } else if (requestTo == '3') {
                          requestTo = 'Vice Principal';
                        } else if (requestTo == '4') {
                          requestTo = 'Principal';
                        } else if (requestTo == '5') {
                          requestTo = 'Asst Manager';
                        }

                        return Card(
                          elevation: 4.0,
                          margin: const EdgeInsets.all(8.0),
                          child: Container(
                            color: const Color.fromARGB(255, 114, 189, 250),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ReplyScreen(
                                      to: requestTo,
                                      subject: requestSubject,
                                      docId: docID,
                                      body: requestBody,
                                      comment: comment),
                                ));
                              },
                              title: Text(
                                requestTo,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: Text(
                                requestSubject,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey[700],
                                ),
                              ),
                              trailing: const Text(
                                'Approved',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })));
  }
}
