import 'package:flutter/material.dart';
import 'package:priority_school_tasker/services/auth_service.dart';
import 'package:auto_size_text/auto_size_text.dart';

final primaryColor = const Color(0xFF782F40);
enum AuthFormType {signIn, signUp}


class SignUpView extends StatefulWidget {
  final AuthFormType authFormType;

  SignUpView({Key key, @required this.authFormType}) : super(key: key);
  @override
  _SignUpViewState createState() =>
      _SignUpViewState(authFormType: this.authFormType);
}


class _SignUpViewState extends State<SignUpView> {

  //used to display different information
  AuthFormType authFormType;
  _SignUpViewState({this.authFormType});

  //Key for this login form
  final formkey = GlobalKey<FormState>();

  // placeholders
  String _email, _password, _name;

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;



    return Scaffold(
      body: Container(
        color: primaryColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(height: _height * 0.10,),
              buildHeaderText(),
              SizedBox(height: _height * 0.05,),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: buildInputs(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AutoSizeText buildHeaderText() {
    String _headerText;
    
    if(authFormType == AuthFormType.signIn) {
      _headerText = "Hey there,welcome back";
      }
    else if(authFormType == AuthFormType.signUp) {
      _headerText = "Come Join Us";
      }

    return AutoSizeText(
      _headerText,
      maxLines: 1,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 35,
        color: Colors.white,
      ),
    );
  }

  List<Widget> buildInputs() {
    List<Widget> textFields= [];

    // add email and password
    textFields.add(
      TextFormField(
        style: TextStyle(fontSize: 22.0),
        decoration: buildSignUpInputDecoration("email"),
        onSaved: (value) => _email = value,
      ),
    );
    textFields.add(SizedBox(height: 20.0,));
    textFields.add(
      TextFormField(
        style: TextStyle(fontSize: 22.0),
        decoration: buildSignUpInputDecoration("password"),
        onSaved: (value) => _password = value,
      ),
    );

    return textFields;
  }

  InputDecoration buildSignUpInputDecoration(String hint) {
    return InputDecoration(
        hintText: hint,
        filled: false,
        fillColor: Colors.white,
        focusColor: Colors.white,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 0.0
            )
        ),
        contentPadding: const EdgeInsets.only(
            left: 14.0,
            bottom: 10.0,
            top: 10.0),
      );
  }
}

