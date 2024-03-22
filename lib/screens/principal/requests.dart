// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ams/components/components.dart';
import 'package:ams/models/model.dart';
import 'package:ams/screens/student/progress_screen.dart';
import 'package:flutter/material.dart';

class RequestPrincipalScreen extends StatelessWidget {
  final TextEditingController text1 = TextEditingController();
  final FireStoreServices fs = FireStoreServices();
  final String from;
  final String to;
  final String subject;
  final String body;
  final String docId;

  RequestPrincipalScreen(
      {super.key,
      required this.from,
      required this.to,
      required this.subject,
      required this.docId,
      required this.body});

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
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: const Color.fromARGB(255, 183, 214, 240),
          shadowColor: Colors.blue,
          title: Text(
            from,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 20),
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
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Any comments?"),
                                content: textfield(
                                    text: 'Write comment here',
                                    controller: text1),
                                actions: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      icon: const Icon(Icons.close)),
                                  IconButton(
                                      onPressed: () {
                                        int? toValue = int.tryParse(to);
                                        if (toValue != null && toValue > 4) {
                                          fs.updateReq(
                                              docId, 'PrincipalApproval');
                                        }

                                        princColor.value = Colors.green;
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pop();

                                        fs.addRemovesPrinc(
                                          subject: subject,
                                          to: to,
                                          from: from,
                                          body: body,
                                          id: docId,
                                          state: 'A',
                                          comment: text1.text,
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text("Approved"),
                                          backgroundColor: Colors.green,
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.red),
                      ),
                      onPressed: () {
                        fs.addRemovesPrinc(
                          subject: subject,
                          to: to,
                          from: from,
                          body: body,
                          id: docId,
                          state: 'R',
                          comment: text1.text,
                        );
                        princColor.value = Colors.red;
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Rejected"),
                          backgroundColor: Colors.red,
                        ));
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
