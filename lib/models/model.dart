import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServices {
  final CollectionReference requests =
      FirebaseFirestore.instance.collection("requests");

  Future<void> addReq(
      {required String subject,
      required String to,
      required String from,
      required String body}) {
    return requests.add({
      'From': from,
      'To': to,
      'Subject': subject,
      'Body': body,
      'TimeStamp': Timestamp.now(),
      'FacultyApproval': false,
      'HodApproval': false,
      'VicePrincipalApproval': false,
      'PrincipalApproval': false,
      'AsstManagerApproval': false,
      'ManagerApproval': false,
    });
  }

  Future<void> updateReq(String docID, String name) {
    return requests.doc(docID).update({name: true});
  }

  // Stream<QuerySnapshot> getrequests() {
  //   final requestStream =
  //       requests.orderBy('TimeStamp', descending: true).snapshots();
  //   return requestStream;
  // }
}
