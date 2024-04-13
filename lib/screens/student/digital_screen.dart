import 'package:ams/components/components.dart';
import 'package:ams/models/model.dart';
import 'package:ams/screens/student/file_upload_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DigitalLetterScreen extends StatefulWidget {
  const DigitalLetterScreen({super.key});

  @override
  State<DigitalLetterScreen> createState() => _DigitalLetterScreenState();
}

class _DigitalLetterScreenState extends State<DigitalLetterScreen> {
  final FireStoreServices fs = FireStoreServices();

  final TextEditingController from = TextEditingController();

  final TextEditingController to = TextEditingController();

  final TextEditingController subject = TextEditingController();

  final TextEditingController body = TextEditingController();

  String selectedItem = 'S1';
  String selectedItem1 = 'CSE';
  String selectedItem2 = '1';

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;
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
          title: const Text(
            'Digital Letter',
            style: TextStyle(color: Colors.black),
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
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      DropdownButton<String>(
                        icon: const Icon(Icons.arrow_drop_down),
                        value: selectedItem1,
                        items: const [
                          DropdownMenuItem<String>(
                            value: 'CSE',
                            child: Text("CSE"),
                          ),
                          DropdownMenuItem<String>(
                            value: 'EC',
                            child: Text("EC"),
                          ),
                          DropdownMenuItem<String>(
                            value: 'CIVIL',
                            child: Text("CIVIL"),
                          ),
                          DropdownMenuItem<String>(
                            value: 'MECH',
                            child: Text("MECH"),
                          ),
                          DropdownMenuItem<String>(
                            value: 'EEE',
                            child: Text("EEE"),
                          ),
                        ],
                        onChanged: (newValue) {
                          setState(() {
                            selectedItem1 = newValue!;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      DropdownButton<String>(
                        icon: const Icon(Icons.arrow_drop_down),
                        value: selectedItem,
                        items: const [
                          DropdownMenuItem<String>(
                            value: 'S1',
                            child: Text("S1"),
                          ),
                          DropdownMenuItem<String>(
                            value: 'S2',
                            child: Text("S2"),
                          ),
                          DropdownMenuItem<String>(
                            value: 'S3',
                            child: Text("S3"),
                          ),
                          DropdownMenuItem<String>(
                            value: 'S4',
                            child: Text("S4"),
                          ),
                          DropdownMenuItem<String>(
                            value: 'S5',
                            child: Text("S5"),
                          ),
                          DropdownMenuItem<String>(
                            value: 'S6',
                            child: Text("S6"),
                          ),
                          DropdownMenuItem<String>(
                            value: 'S7',
                            child: Text("S7"),
                          ),
                          DropdownMenuItem<String>(
                            value: 'S8',
                            child: Text("S8"),
                          ),
                        ],
                        onChanged: (newValue) {
                          setState(() {
                            selectedItem = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "To:     ",
                      style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                    DropdownButton<String>(
                      icon: const Icon(Icons.arrow_drop_down),
                      value: selectedItem2,
                      items: const [
                        DropdownMenuItem<String>(
                          value: '1',
                          child: Text("FACULTY"),
                        ),
                        DropdownMenuItem<String>(
                          value: '2',
                          child: Text("HOD"),
                        ),
                        DropdownMenuItem<String>(
                          value: '3',
                          child: Text("VICE PRINCIPAL"),
                        ),
                        DropdownMenuItem<String>(
                          value: '4',
                          child: Text("PRINCIPAL"),
                        ),
                        DropdownMenuItem<String>(
                          value: '5',
                          child: Text("ASST MANAGER"),
                        ),
                      ],
                      onChanged: (newValue) {
                        setState(() {
                          selectedItem2 = newValue!;
                        });
                      },
                    ),
                  ],
                ),
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
                        textAlignVertical: TextAlignVertical.top,
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
                    onPressed: () async {
                      // File? selectedImage =
                      //     await fs.getImageFromGallery(context);
                      // if (selectedImage != null) {
                      //   bool success =
                      //       await fs.uploadFileForUser(selectedImage);
                      // }
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FileUploadScreen(),
                      ));
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Attach file'),
                        Icon(Icons.attach_file),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                button1(
                    onPressed: () {
                      if (from.text.isEmpty ||
                          subject.text.isEmpty ||
                          body.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Empty field"),
                          backgroundColor: Colors.red,
                        ));
                      } else {
                        fs.addReq(
                            uid: uid,
                            branch: selectedItem1,
                            sem: selectedItem,
                            from: from.text,
                            to: selectedItem2,
                            subject: subject.text,
                            body: body.text);
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Sent Successfully"),
                          backgroundColor: Colors.green,
                        ));
                      }
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
