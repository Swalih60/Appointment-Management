import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FileUploadScreen extends StatefulWidget {
  @override
  _FileUploadScreenState createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();
  List<String> _uploadedFiles = [];

  Future<void> _uploadFile(File file) async {
    final user = _auth.currentUser;
    final userId = user?.uid;
    final filename = file.path.split("/").last;
    if (userId != null) {
      String fileName =
          '$userId/${DateTime.now().millisecondsSinceEpoch}-$filename';
      try {
        await _storage.ref().child(fileName).putFile(file);

        setState(() {
          _uploadedFiles.add(fileName);
        });
      } catch (e) {
        print('Error uploading file: $e');
      }
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
        title: Text('File Upload'),
      ),
      body: ListView.builder(
        itemCount: _uploadedFiles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_uploadedFiles[index].split('-').last),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickFile,
        tooltip: 'Pick File',
        child: Icon(Icons.add),
      ),
    );
  }
}
