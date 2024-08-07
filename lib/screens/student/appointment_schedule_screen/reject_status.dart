import 'package:ams/models/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RejectStatusPage extends StatelessWidget {
  final String uid = FirebaseAuth
      .instance.currentUser!.uid; // Add this line to declare the uid variable

  // Modify the constructor to accept uid as a parameter
  RejectStatusPage({
    Key? key,
  }) : super(key: key);

  final Stream<QuerySnapshot> collectionReference = FirebaseCrud.readReject();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColorDark,
        title: const Text(
          'Status',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Reject')
            .where('studentId', isEqualTo: uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<DocumentSnapshot> approvedList = snapshot.data!.docs;
          return ListView.builder(
            itemCount: approvedList.length,
            itemBuilder: (context, index) {
              DocumentSnapshot document = approvedList[index];
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              String toName = data['toName'] ?? '';
              String date = data['date'] ?? '';
              String time = data['time'] ?? '';
              bool isApproved = data['isApproved'] ?? false;

              if (toName == "1") {
                toName = "Vice Principal - Academics";
              } else if (toName == "2") {
                toName = "Vice Principal - Administration";
              } else if (toName == "3") {
                toName = "Principal";
              } else if (toName == "4") {
                toName = "Asst. Manager";
              } else if (toName == "5") {
                toName = "Manager";
              }
              if (!isApproved) {
                return ListTile(
                  title: Text(toName),
                  subtitle: Text('$date $time'),
                );
              }
              return Container();
            },
          );
        },
      ),
    );
  }
}
