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
      'Subjest': subject,
      'Body': body,
      'TimeStamp': Timestamp.now(),
    });
  }
}
