import 'package:flutter/material.dart';

import 'input_container.dart';

class RoundedPasswordInput extends StatelessWidget {
  const RoundedPasswordInput({Key? key, required this.hint}) : super(key: key);
  final String hint;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InputContainer(
      child: TextField(
        cursorColor: Colors.blue[900],
        obscureText: true,
        decoration: InputDecoration(
            icon: Icon(Icons.lock, color: Colors.blue[500]),
            hintText: hint,
            border: InputBorder.none),
      ),
    );
  }
}
