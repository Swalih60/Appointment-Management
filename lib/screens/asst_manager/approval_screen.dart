// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ams/components/components.dart';
import 'package:ams/models/model.dart';
import 'package:ams/screens/asst_manager/requests.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ApprovalAsstScreen extends StatelessWidget {
  final FireStoreServices fs = FireStoreServices();

  ApprovalAsstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        shadowColor: Colors.blue,
        title: const Text(
          "Requests",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: fs.requests
            .where('PrincipalApproval', isEqualTo: true)
            .orderBy('TimeStamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return StreamBuilder<List<String>>(
              stream: fs.getRemovesAsst(),
              builder: (context, removesSnapshot) {
                if (removesSnapshot.hasData) {
                  List<DocumentSnapshot> requestList = snapshot.data!.docs
                      .where((doc) => !removesSnapshot.data!.contains(doc.id))
                      .toList();
                  return ListView.builder(
                    itemCount: requestList.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = requestList[index];
                      String docID = document.id;
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      String reqId = data['reqId'] ?? 'Unknown';
                      String uid = data['uid'] ?? 'Unknown';
                      String requestFrom = data['From'] ?? 'Unknown';
                      String requestTo = data['To'] ?? 'Unknown';
                      String requestSubject = data['Subject'] ?? 'Unknown';
                      String requestBody = data['Body'] ?? 'Unknown';
                      Timestamp requestTime = data['TimeStamp'] ?? 'Unknown';
                      DateTime dateTime = requestTime.toDate();

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

                      return listile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RequestAsstScreen(
                                uid: uid,
                                docId: docID,
                                from: requestFrom,
                                to: requestTo,
                                subject: requestSubject,
                                body: requestBody,
                                reqId: reqId,
                              ),
                            ),
                          );
                        },
                        title: requestFrom,
                        trailing: dateTime,
                        subtitle: requestSubject,
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            );
          } else {
            return const Center(child: Text("No Requests"));
          }
        },
      ),
    );
  }
}
