import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

class FireStoreServices {
  // final _firebaseMessaging = FirebaseMessaging.instance;

  // void handleMessage(RemoteMessage? message) {
  //   if (message == null) return;
  //   navigatorKey.currentState?.pushNamed('/student', arguments: message);
  // }

  // Future initPushNotifcations() async {
  //   await FirebaseMessaging.instance
  //       .setForegroundNotificationPresentationOptions(
  //     alert: true,
  //     badge: true,
  //     sound: true,
  //   );
  //   FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
  //   FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  //   FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  // }

  // Future<void> handleBackgroundMessage(RemoteMessage message) async {
  //   print("Title: ${message.notification?.title}");
  //   print("Body: ${message.notification?.body}");
  //   print("Payload: ${message.data}");
  // }

  // Future<void> initNotification() async {
  //   await _firebaseMessaging.requestPermission();
  //   final fCMToken = await _firebaseMessaging.getToken();
  //   print('Token: $fCMToken');
  //   FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  //   initPushNotifcations();
  // }

  final CollectionReference requests =
      FirebaseFirestore.instance.collection("requests");

  Future<void> addReq(
      {required String reqId,
      required String uid,
      required String subject,
      required String to,
      required String branch,
      required String sem,
      required String from,
      required String body}) {
    return requests.add({
      'reqId': reqId,
      'uid': uid,
      'Branch': branch,
      'Sem': sem,
      'From': from,
      'To': to,
      'Subject': subject,
      'Body': body,
      'TimeStamp': Timestamp.now(),
      'FacultyApproval': false,
      'Fac': false,
      'FacTime': '',
      'HodApproval': false,
      'Hod': false,
      'HodTime': '',
      'ViceApproval': false,
      'Vice': false,
      'ViceTime': '',
      'PrincipalApproval': false,
      'Princi': false,
      'PrinciTime': '',
      'Asst': false,
      'AsstTime': '',
    });
  }

  Future<void> updateReq(String docID, String name) {
    return requests.doc(docID).update({name: true});
  }

  Future<void> updateTime(String docID, String name) {
    final now = DateTime.now();
    String timeString = DateFormat('h:mm a').format(now);
    String date = '${now.day}/${now.month}/${now.year}    $timeString';
    return requests.doc(docID).update({name: date});
  }

  // Stream<QuerySnapshot> getrequests() {
  //   final requestStream =
  //       requests.orderBy('TimeStamp', descending: true).snapshots();
  //   return requestStream;
  // }

  final CollectionReference users =
      FirebaseFirestore.instance.collection("Users");

  Future<void> addUser(
      {required String uid,
      required String userName,
      // required String role,
      required String branch,
      required String sem}) {
    return users.add({
      'sem': sem,
      'branch': branch,
      // 'role': role,
      'uid': uid,
      'userName': userName,
    });
  }

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
    required String reqId,
    required String uid,
    required String subject,
    required String to,
    required String body,
    required String id,
  }) {
    return approves.add({
      'reqId': reqId,
      'uid': uid,
      'id': id,
      'To': to,
      'Subject': subject,
      'Body': body,
    });
  }

  Stream<QuerySnapshot> getApproves(String uid) {
    final approveStream = approves.where('uid', isEqualTo: uid).snapshots();
    return approveStream;
  }

  final CollectionReference rejects =
      FirebaseFirestore.instance.collection("rejects");

  Future<void> addRejects({
    required String subject,
    required String to,
    required String uid,
    required String body,
    required String id,
    required String reqId,
    required String comment,
    required String by,
  }) {
    return rejects.add({
      'reqId': reqId,
      'id': id,
      'uid': uid,
      'comment': comment,
      'To': to,
      'Subject': subject,
      'Body': body,
      'by': by,
    });
  }

  Stream<QuerySnapshot> getRejects(String uid) {
    final rejectsStream = rejects.where('uid', isEqualTo: uid).snapshots();
    return rejectsStream;
  }
}

Future<bool> uploadFileForUser(File file) async {
  try {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final storageRef = FirebaseStorage.instance.ref();
    final fileName = file.path.split("/").last;
    final timestamp = DateTime.now().microsecondsSinceEpoch;
    final uploadRef = storageRef.child("$uid/uploads/$timestamp-$fileName");
    await uploadRef.putFile(file);
    return true;
  } catch (e) {
    print(e);
  }
  return false;
}

Future<List<Reference>?> getUsersUploadedFiles() async {
  try {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final storageRef = FirebaseStorage.instance.ref();
    final uploadRefs = storageRef.child("$uid/uploads");
    final uploads = await uploadRefs.listAll();
    return uploads.items;
  } catch (e) {
    print(e);
  }
  return null;
}
