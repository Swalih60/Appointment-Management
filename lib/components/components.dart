// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class button extends StatelessWidget {
  final String child;
  final Function()? onPressed;

  const button({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            backgroundColor: MaterialStatePropertyAll(Colors.blue[500]),
          ),
          child: Text(
            child,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 13.2,
            ),
          )),
    );
  }
}

// ignore: camel_case_types
class button1 extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final IconData icon;

  const button1({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          backgroundColor: MaterialStatePropertyAll(Colors.blue[500]),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Icon(
              icon,
              color: Colors.black,
            )
          ],
        ));
  }
}

// ignore: camel_case_types
class textfield extends StatelessWidget {
  final String text;
  final TextEditingController controller;

  const textfield({
    Key? key,
    required this.text,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          labelText: text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.blue, width: 2.0),
          ),
        ));
  }
}

// ignore: camel_case_types
class row extends StatelessWidget {
  final String text;
  final double width;

  row({
    Key? key,
    required this.text,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 40,
        ),
        Container(
          height: 30,
          width: 30,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
        ),
        const SizedBox(
          width: 80,
        ),
        Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red),
        ),
        SizedBox(
          width: width,
        ),
        Container(
          height: 30,
          width: 30,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
          child: const Icon(
            Icons.done,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

// ignore: camel_case_types
class listile extends StatelessWidget {
  final String title;
  final String subtitle;
  final DateTime trailing;
  final Function()? onTap;

  const listile({
    Key? key,
    required this.trailing,
    required this.title,
    required this.subtitle,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String trailingText = DateFormat('dd/MM/yyyy \n HH:mm a').format(trailing);

    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: Container(
        color: const Color.fromARGB(255, 114, 189, 250),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          onTap: onTap,
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey[700],
            ),
          ),
          trailing: Text(trailingText),
        ),
      ),
    );
  }
}
