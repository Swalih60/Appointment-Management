import 'package:ams/components/components.dart';
import 'package:ams/models/model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DigitalLetterScreen extends StatelessWidget {
  DigitalLetterScreen({super.key});

  final FireStoreServices fs = FireStoreServices();
  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController body = TextEditingController();

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
          title: const Center(
            child: Text(
              'Digital Letter',
              style: TextStyle(color: Colors.black),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 183, 214, 240),
          shadowColor: Colors.blue,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                      right: 150,
                      left: 10,
                    ),
                    child: textfield(
                      text: 'From',
                      controller: from,
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(right: 150, left: 10, top: 20),
                    child: textfield(
                      text: 'To',
                      controller: to,
                    )),
                Padding(
                    padding: const EdgeInsets.only(
                        right: 60, left: 10, top: 20, bottom: 10),
                    child: textfield(
                      text: 'Subject',
                      controller: subject,
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: SizedBox(
                    height: 300,
                    child: TextField(
                        expands: true,
                        maxLines: null,
                        controller: body,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          labelText: 'Body',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 2.0),
                          ),
                        )),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Attach file'),
                        Icon(Icons.attach_file),
                      ],
                    )),
                const SizedBox(
                  height: 40,
                ),
                button1(
                    onPressed: () {
                      fs.addReq(
                          from: from.text,
                          to: to.text,
                          subject: subject.text,
                          body: body.text);
                      Navigator.pop(context);
                    },
                    text: 'Send',
                    icon: Icons.send)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
