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
    });
  }

  Stream<QuerySnapshot> getrequests() {
    final requestStream =
        requests.orderBy('TimeStamp', descending: true).snapshots();
    return requestStream;
  }
}
