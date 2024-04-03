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
      width: 180,
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

class LoginTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obsecureText;
  final String? Function(String?)? validator;

  const LoginTextfield(
      {super.key,
      required this.controller,
      required this.hintText,
      this.validator,
      required this.obsecureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: obsecureText,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey[500],
            )),
      ),
    );
  }
}

// ignore: camel_case_types
class button2 extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const button2({
    Key? key,
    this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 80),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
