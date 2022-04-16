import 'package:flutter/material.dart';
import 'input_containerstaf.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput({Key? key, required this.icon}) : super(key: key);
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InputContainer(
      child: TextField(
        cursorColor: Colors.blue[900],
        decoration: InputDecoration(
            icon: Icon(icon, color: Colors.blue[500]),
            hintText: 'Username or email',
            border: InputBorder.none),
      ),
    );
  }
}
