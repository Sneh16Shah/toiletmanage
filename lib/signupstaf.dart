import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toiletmanage/Staffmember.dart';
import 'package:toiletmanage/reuse_widget/reuse.dart';
import 'package:toiletmanage/setvalue.dart';
import 'package:toiletmanage/utils/colors_util.dart';

import 'Admin.dart';

class SignUpScreenstaff extends StatefulWidget {
  const SignUpScreenstaff({Key? key}) : super(key: key);

  @override
  State<SignUpScreenstaff> createState() => _SignUpScreenstaffState();
}

class _SignUpScreenstaffState extends State<SignUpScreenstaff> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _idTextController = TextEditingController();
  TextEditingController _contactTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple[900],
        elevation: 0,
        title: const Text(
          "Sign Up",
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
                reusableTextField("Enter Email Id", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outlined, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                    "I'd", Icons.lock_outlined, false, _idTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                    "Contact No.", Icons.phone, false, _contactTextController),
                Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 60)),
                const SizedBox(
                  height: 20,
                ),
                firebasee(context, "Sign Up", () async {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      // await FirebaseFirestore.instance.collection('user_profile').add(
                      //   {
                      //     'name': name,
                      //     'email': email,
                      //     'password': ,
                      //     'phone_number': phone_number,
                      //     'id': id,
                      //   },
                      // )
                      .then((value) {
                    print("Created New Account");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Staffmember()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                })
              ],
            ),
          ))),
    );
  }
}
