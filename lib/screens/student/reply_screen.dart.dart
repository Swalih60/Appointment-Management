// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ams/components/attached_files.dart';
import 'package:flutter/material.dart';

class ReplyScreen extends StatelessWidget {
    final String uid;
  final String reqId;
  final String to;
  final String subject;
  final String body;
  final String docId;
  final String comment;

  const ReplyScreen({
    super.key,
     required this.uid,
    required this.reqId,
    required this.to,
    required this.subject,
    required this.docId,
    required this.body,
    required this.comment,
  });

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
          title: const Text(
            'Status',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 50),
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
              const SizedBox(height: 60.0),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 10),
                child: Row(
                  children: [
                    const Text(
                      'Comment: ',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      comment,
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    )
                  ],
                ),
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
      ),
    );
  }
}
