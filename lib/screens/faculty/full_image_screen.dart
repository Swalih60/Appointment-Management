// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FullImageScreen extends StatelessWidget {
  const FullImageScreen({
    Key? key,
    required this.imageUrl,
    required this.fileName,
  }) : super(key: key);

  final String imageUrl;
  final String fileName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(fileName.split('-').last),
      ),
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}
