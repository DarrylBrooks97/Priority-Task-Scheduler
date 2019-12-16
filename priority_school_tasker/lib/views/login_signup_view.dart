import 'package:flutter/material.dart';
import 'package:priority_school_tasker/services/auth_service.dart';
import 'package:auto_size_text/auto_size_text.dart';

final primaryColor = const Color(0xFF782F40);


class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text("Sign Up")
            ],
          ),
        ),
      ),
    );
  }
}

