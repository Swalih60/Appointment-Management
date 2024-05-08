// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ams/components/components.dart';
import 'package:ams/models/model.dart';
import 'package:ams/screens/student/progress_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProgressListScreen extends StatelessWidget {
  ProgressListScreen({Key? key}) : super(key: key);

  final FireStoreServices fs = FireStoreServices();
  final uid = FirebaseAuth.instance.currentUser!.uid;

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
            "Request Letters",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: fs.requests
              .orderBy('TimeStamp', descending: true)
              .where('uid', isEqualTo: uid)
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

                  String facTime = data['FacTime'] ?? 'Unknown';
                  String hodTime = data['HodTime'] ?? 'Unknown';
                  String viceTime = data['ViceTime'] ?? 'Unknown';
                  String princiTime = data['PrinciTime'] ?? 'Unknown';
                  String asstTime = data['AsstTime'] ?? 'Unknown';

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
                            facTime: facTime,
                            viceTime: viceTime,
                            hodTime: hodTime,
                            princiTime: princiTime,
                            asstTime: asstTime,
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
        ));
  }
}
