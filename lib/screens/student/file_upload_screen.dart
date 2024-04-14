import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FileUploadScreen extends StatefulWidget {
  const FileUploadScreen({Key? key, required this.requestId}) : super(key: key);

  final String requestId;

  @override
  // ignore: library_private_types_in_public_api
  _FileUploadScreenState createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();
  final List<Map<String, dynamic>> _uploadedFiles = [];

  Future<void> _uploadFile(File file) async {
    final user = _auth.currentUser;
    final userId = user?.uid;
    final filename = file.path.split("/").last;
    if (userId != null) {
      String fileName =
          '$userId/${widget.requestId}/${DateTime.now().millisecondsSinceEpoch}-$filename';
      try {
        final uploadTask = await _storage.ref().child(fileName).putFile(file);
        final downloadUrl = await uploadTask.ref.getDownloadURL();

        setState(() {
          _uploadedFiles.add({'name': fileName, 'url': downloadUrl});
        });
      } catch (e) {
        print('Error uploading file: $e');
      }
    }
  }

  Future<void> _deleteFile(int index) async {
    final fileName = _uploadedFiles[index]['name'];
    try {
      await _storage.ref().child(fileName).delete();
      setState(() {
        _uploadedFiles.removeAt(index);
      });
    } catch (e) {
      print('Error deleting file: $e');
    }
  }

  Future<void> _pickFile() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        _uploadFile(File(pickedFile.path));
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload File'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _uploadedFiles.length,
        itemBuilder: (context, index) {
          final uploadedFile = _uploadedFiles[index];
          return ListTile(
            contentPadding: const EdgeInsets.all(20),
            leading: Image.network(uploadedFile['url']),
            title: Text(uploadedFile['name'].split('-').last),
            trailing: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () => _deleteFile(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickFile,
        tooltip: 'Pick File',
        child: const Icon(Icons.upload),
      ),
    );
  }
}
