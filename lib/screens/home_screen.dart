import 'package:ams/components/components.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff000000), Color(0xff737373)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/AMS_LOGO1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  const Text(
                    "Choose Your category",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  button(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/vice');
                      },
                      child: 'Vice Principal'),
                  const SizedBox(
                    height: 20,
                  ),
                  button(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/hod');
                      },
                      child: 'HOD'),
                  const SizedBox(
                    height: 20,
                  ),
                  button(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/faculty');
                      },
                      child: 'FACULTY'),
                  const SizedBox(
                    height: 20,
                  ),
                  button(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/student');
                      },
                      child: 'STUDENT')
                ],
              ),
            )),
      ),
    );
  }
}
