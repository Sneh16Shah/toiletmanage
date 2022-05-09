import 'package:flutter/material.dart';
import 'package:toiletmanage/reuse_widget/reuse.dart';
import 'package:toiletmanage/utils/colors_util.dart';

import 'Admin.dart';

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController _idTextController = TextEditingController();
  TextEditingController _contactTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple[900],
        elevation: 0,
        title: const Text(
          "Update your Info",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringtocolor("CB2B93"),
            hexStringtocolor("9546C4"),
            hexStringtocolor("5E61F4"),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                    "Enter Id", Icons.contact_page, false, _idTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Contact No.", Icons.phone, true,
                    _contactTextController),
                const SizedBox(
                  height: 20,
                ),
                firebasee(context, "Update", () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Admin()));
                })
              ],
            ),
          ))),
    );
  }
}
