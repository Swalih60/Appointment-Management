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

  Future<void> addRemovesFac({required String id}) {
    return removesFac.add({
      'id': id,
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
    required String id,
  }) {
    return removesHod.add({
      'id': id,
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
    required String id,
  }) {
    return removesVice.add({
      'id': id,
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
    required String id,
  }) {
    return removesPrinc.add({
      'id': id,
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
    required String id,
  }) {
    return removesAsst.add({
      'id': id,
    });
  }

  Stream<List<String>> getRemovesAsst() {
    final requestStream = removesAsst.snapshots();
    return requestStream.map((snapshot) {
      return snapshot.docs.map((doc) => doc['id'] as String).toList();
    });
  }

  final CollectionReference approves =
      FirebaseFirestore.instance.collection("approves");

  Future<void> addApprove({
    required String subject,
    required String to,
    required String body,
    required String id,
    required String comment,
    required String by,
  }) {
    return approves.add({
      'id': id,
      'comment': comment,
      'To': to,
      'Subject': subject,
      'Body': body,
      'by': by,
    });
  }

  Stream<QuerySnapshot> getApproves() {
    final approveStream = approves.snapshots();
    return approveStream;
  }

  final CollectionReference rejects =
      FirebaseFirestore.instance.collection("rejects");

  Future<void> addRejects({
    required String subject,
    required String to,
    required String body,
    required String id,
    required String comment,
    required String by,
  }) {
    return rejects.add({
      'id': id,
      'comment': comment,
      'To': to,
      'Subject': subject,
      'Body': body,
      'by': by,
    });
  }

  Stream<QuerySnapshot> getRejects() {
    final rejectsStream = rejects.snapshots();
    return rejectsStream;
  }
}
