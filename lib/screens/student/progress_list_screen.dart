// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ams/components/components.dart';
import 'package:ams/models/model.dart';
import 'package:ams/screens/student/progress_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProgressListScreen extends StatelessWidget {
  ProgressListScreen({Key? key}) : super(key: key);

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
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.black),
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 183, 214, 240),
              shadowColor: Colors.blue,
              title: const Text(
                "Request Letters",
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: StreamBuilder<QuerySnapshot>(
              stream: fs.requests
                  .orderBy('TimeStamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<DocumentSnapshot> requestList = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: requestList.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = requestList[index];

                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;

                      String requestTo = data['To'] ?? 'Unknown';
                      String requestSubject = data['Subject'] ?? 'Unknown';

                      Timestamp requestTime = data['TimeStamp'] ?? 'Unknown';
                      DateTime dateTime = requestTime.toDate();

                      bool facApproval = data['Fac'] ?? false;
                      bool hodApproval = data['Hod'] ?? false;
                      bool princiApproval = data['Princi'] ?? false;
                      bool viceApproval = data['Vice'] ?? false;
                      bool asstApproval = data['Asst'] ?? false;

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
                              builder: (context) => ProgressScreen(
                                to: requestTo,
                                facApproval: facApproval,
                                viceApproval: viceApproval,
                                princiApproval: princiApproval,
                                hodApproval: hodApproval,
                                asstApproval: asstApproval,
                              ),
                            ),
                          );
                        },
                        title: requestTo,
                        trailing: dateTime,
                        subtitle: requestSubject,
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )));
  }
}
