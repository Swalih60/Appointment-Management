// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ams/components/attached_files.dart';
import 'package:ams/components/components.dart';
import 'package:ams/models/model.dart';
import 'package:flutter/material.dart';

class RequestFacScreenYear2 extends StatelessWidget {
  final TextEditingController text1 = TextEditingController();
  final FireStoreServices fs = FireStoreServices();
  final String reqId;
  final String uid;
  final String from;
  final String to;
  final String subject;
  final String body;
  final String docId;

  RequestFacScreenYear2(
      {super.key,
      required this.reqId,
      required this.uid,
      required this.from,
      required this.to,
      required this.subject,
      required this.docId,
      required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueAccent,
        shadowColor: Colors.blue,
        title: Text(
          from,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 50),
              child: Text(
                'From: $from',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 10),
              child: Text(
                'To: $to',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 10),
              child: Text(
                'Subject: $subject',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 10),
              child: Text(
                body,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            const SizedBox(height: 50.0),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60.0, right: 10),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.green),
                      ),
                      onPressed: () {
                        fs.updateTime(docId, 'FacTime');
                        fs.updateReq(docId, 'Fac');
                        int? toValue = int.tryParse(to);
                        if (toValue != null && toValue > 1) {
                          fs.updateReq(docId, 'FacultyApproval');
                        } else {
                          fs.addApprove(
                            reqId: reqId,
                            uid: uid,
                            subject: subject,
                            to: to,
                            body: body,
                            id: docId,
                          );

                          Navigator.of(context).pop();

                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Approved"),
                            backgroundColor: Colors.green,
                          ));
                        }

                        fs.addRemovesFac(
                          id: docId,
                        );

                        Navigator.of(context).pop();

                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Approved"),
                          backgroundColor: Colors.green,
                        ));
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Approve',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.done,
                            color: Colors.black,
                          )
                        ],
                      )),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.red),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Any Comments?"),
                            content: textfield(
                                text: 'Write comment here', controller: text1),
                            actions: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: const Icon(Icons.close)),
                              IconButton(
                                  onPressed: () {
                                    fs.addRejects(
                                        subject: subject,
                                        to: to,
                                        body: body,
                                        id: docId,
                                        comment: text1.text,
                                        by: 'Faculty',
                                        reqId: reqId,
                                        uid: uid);
                                    fs.addRemovesFac(
                                      id: docId,
                                    );

                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text("Rejected"),
                                      backgroundColor: Colors.red,
                                    ));
                                  },
                                  icon: const Icon(Icons.done))
                            ],
                          );
                        },
                      );
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Reject',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.close,
                          color: Colors.black,
                        )
                      ],
                    )),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AttachedFilesScreen(
                          userId: uid,
                          reqId: reqId,
                        ),
                      ));
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Attached files'),
                        Icon(Icons.attach_file),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
