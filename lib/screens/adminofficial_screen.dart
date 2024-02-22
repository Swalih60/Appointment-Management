import 'package:flutter/material.dart';

class AdminOfficial extends StatelessWidget {
  const AdminOfficial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("adminofficial")),
        backgroundColor: Colors.white,
      ),
      body: const Center(child: Text("ADMINSTRATIVE OFFICIAL")),
    );
  }
}
