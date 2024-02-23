import 'package:ams/components/components.dart';
import 'package:ams/models/model.dart';
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

  @override
  Widget build(BuildContext context) {
    String selectedItem = '1';
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
                DropdownButton<String>(
                  icon: const Icon(Icons.arrow_drop_down),
                  value: selectedItem,
                  items: const [
                    DropdownMenuItem(
                      value: '1',
                      child: Text("S1"),
                    ),
                    DropdownMenuItem(
                      value: '2',
                      child: Text("S2"),
                    ),
                    DropdownMenuItem(
                      value: '3',
                      child: Text("S3"),
                    ),
                    DropdownMenuItem(
                      value: '4',
                      child: Text("S4"),
                    ),
                    DropdownMenuItem(
                      value: '5',
                      child: Text("S5"),
                    ),
                    DropdownMenuItem(
                      value: '6',
                      child: Text("S6"),
                    ),
                    DropdownMenuItem(
                      value: '7',
                      child: Text("S7"),
                    ),
                    DropdownMenuItem(
                      value: '8',
                      child: Text("S8"),
                    ),
                  ],
                  onChanged: (newValue) {
                    setState(() {
                      selectedItem = newValue!;
                    });
                  },
                ),
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
