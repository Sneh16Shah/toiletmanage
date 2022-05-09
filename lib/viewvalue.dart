import 'package:flutter/material.dart';

class Viewvalue extends StatefulWidget {
  const Viewvalue({Key? key}) : super(key: key);

  @override
  State<Viewvalue> createState() => _ViewvalueState();
}

class _ViewvalueState extends State<Viewvalue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
