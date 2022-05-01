import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:toiletmanage/components/rounded_button.dart';
import 'package:toiletmanage/resetpass.dart';
import 'package:toiletmanage/reuse_widget/reuse.dart';
import 'package:toiletmanage/signup.dart';
import 'package:toiletmanage/utils/colors_util.dart';
import 'package:toiletmanage/viewvalue.dart';

import 'components/rounded_input.dart';
import 'components/rounded_password.dart';

class Staffmember extends StatefulWidget {
  const Staffmember({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Staffmember> {
  @override
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringtocolor("CB2893"),
            hexStringtocolor("9546C4"),
            hexStringtocolor("5E61F4"),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.4, 20, 0),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  reusableTextField("Enter UserName", Icons.person_outline,
                      false, _emailTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Password", Icons.lock_outline, true,
                      _passwordTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  firebasee(context, "LOGIN IN", () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Viewvalue()));
                  }),
                  forgetPassword(context),
                  signUpOption()
                ],
              ),
            ),
          ),
        ));
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }
}
