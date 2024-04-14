// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ams/screens/faculty/full_image_screen.dart';
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
    print("uid========${widget.userId}");
    print("reqId========${widget.reqId}");
  }

  Future<void> _fetchFileNames() async {
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
        title: const Text('File List'),
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
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return const Icon(Icons.error);
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
            onTap: () async {
              String imageUrl = await _storage
                  .ref('${widget.userId}/${widget.reqId}/$fileName')
                  .getDownloadURL();
              Navigator.push(
                  // ignore: use_build_context_synchronously
                  context,
                  MaterialPageRoute(
                      builder: (context) => FullImageScreen(
                            imageUrl: imageUrl,
                            fileName: fileName,
                          )));
            },
          );
        },
      ),
    );
  }
}
