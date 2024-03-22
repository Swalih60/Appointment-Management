import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServices {
  final CollectionReference requests =
      FirebaseFirestore.instance.collection("requests");

  Future<void> addReq(
      {required String subject,
      required String to,
      required String branch,
      required String sem,
      required String from,
      required String body}) {
    return requests.add({
      'Branch': branch,
      'Sem': sem,
      'From': from,
      'To': to,
      'Subject': subject,
      'Body': body,
      'TimeStamp': Timestamp.now(),
      'FacultyApproval': false,
      'HodApproval': false,
      'ViceApproval': false,
      'PrincipalApproval': false,
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

  final CollectionReference removesFac =
      FirebaseFirestore.instance.collection("removesFac");

  Future<void> addRemovesFac(
      {required String subject,
      required String to,
      required String from,
      required String body,
      required String id,
      required String state,
      required String comment}) {
    return removesFac.add({
      'id': id,
      'From': from,
      'To': to,
      'Subject': subject,
      'Body': body,
      'state': state,
      'comment': comment,
      'TimeStamp': Timestamp.now(),
    });
  }

  Stream<List<String>> getRemovesFac() {
    final requestStream = removesFac.snapshots();
    return requestStream.map((snapshot) {
      return snapshot.docs.map((doc) => doc['id'] as String).toList();
    });
  }

  final CollectionReference removesHod =
      FirebaseFirestore.instance.collection("removesHod");

  Future<void> addRemovesHod({
    required String subject,
    required String to,
    required String from,
    required String body,
    required String id,
    required String state,
    required String comment,
  }) {
    return removesHod.add({
      'id': id,
      'From': from,
      'To': to,
      'Subject': subject,
      'Body': body,
      'state': state,
      'comment': comment,
      'TimeStamp': Timestamp.now(),
    });
  }

  Stream<List<String>> getRemovesHod() {
    final requestStream = removesHod.snapshots();
    return requestStream.map((snapshot) {
      return snapshot.docs.map((doc) => doc['id'] as String).toList();
    });
  }

  final CollectionReference removesVice =
      FirebaseFirestore.instance.collection("removesVice");

  Future<void> addRemovesVice({
    required String subject,
    required String to,
    required String from,
    required String body,
    required String id,
    required String state,
    required String comment,
  }) {
    return removesVice.add({
      'id': id,
      'From': from,
      'To': to,
      'Subject': subject,
      'Body': body,
      'state': state,
      'comment': comment,
      'TimeStamp': Timestamp.now(),
    });
  }

  Stream<List<String>> getRemovesVice() {
    final requestStream = removesVice.snapshots();
    return requestStream.map((snapshot) {
      return snapshot.docs.map((doc) => doc['id'] as String).toList();
    });
  }

  final CollectionReference removesPrinc =
      FirebaseFirestore.instance.collection("removesPrinc");

  Future<void> addRemovesPrinc({
    required String subject,
    required String to,
    required String from,
    required String body,
    required String id,
    required String state,
    required String comment,
  }) {
    return removesPrinc.add({
      'id': id,
      'From': from,
      'To': to,
      'Subject': subject,
      'Body': body,
      'state': state,
      'comment': comment,
      'TimeStamp': Timestamp.now(),
    });
  }

  Stream<List<String>> getRemovesPrinc() {
    final requestStream = removesPrinc.snapshots();
    return requestStream.map((snapshot) {
      return snapshot.docs.map((doc) => doc['id'] as String).toList();
    });
  }

  final CollectionReference removesAsst =
      FirebaseFirestore.instance.collection("removesAsst");

  Future<void> addRemovesAsst({
    required String subject,
    required String to,
    required String from,
    required String body,
    required String id,
    required String state,
    required String comment,
  }) {
    return removesAsst.add({
      'id': id,
      'From': from,
      'To': to,
      'Subject': subject,
      'Body': body,
      'state': state,
      'comment': comment,
      'TimeStamp': Timestamp.now(),
    });
  }

  Stream<List<String>> getRemovesAsst() {
    final requestStream = removesAsst.snapshots();
    return requestStream.map((snapshot) {
      return snapshot.docs.map((doc) => doc['id'] as String).toList();
    });
  }
}
