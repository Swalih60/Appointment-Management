// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FilesScreen extends StatefulWidget {
  final String userId;
  final String reqId;

  const FilesScreen({
    Key? key,
    required this.userId,
    required this.reqId,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FilesScreenState createState() => _FilesScreenState();
}

class _FilesScreenState extends State<FilesScreen> {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  List<String> _fileNames = [];

  @override
  void initState() {
    super.initState();
    _fetchFileNames();
  }

  Future<void> _fetchFileNames() async {
    // Assuming you have a Firebase Database reference called 'files'
    // Replace 'files' with your actual database reference
    // Assume that 'files' has a structure where each child represents a file name
    // under the user's ID
    // Example: /files/userId/randomNumber
    // This assumes that you've stored the file names in the database
    // Adjust this according to your actual database structure
    // Here, we're assuming you have a 'files' node where each child is a file name
    final databaseFiles =
        await _storage.ref("${widget.userId}/${widget.reqId}").listAll();

    setState(() {
      _fileNames = databaseFiles.items.map((item) => item.name).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File List'),
      ),
      body: ListView.builder(
        itemCount: _fileNames.length,
        itemBuilder: (context, index) {
          final fileName = _fileNames[index];
          return ListTile(
            title: Text(fileName),
            leading: FutureBuilder(
              future: _storage
                  .ref('${widget.userId}/${widget.reqId}/$fileName')
                  .getDownloadURL(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Icon(Icons.error);
                } else {
                  return Image.network(
                    snapshot.data as String, // URL of the image
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  );
                }
              },
            ),
            onTap: () {
              // Navigate to a new screen to show the full image
              // You can implement this according to your navigation setup
              // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => FullImageScreen(imageUrl: snapshot.data as String)));
            },
          );
        },
      ),
    );
  }
}
