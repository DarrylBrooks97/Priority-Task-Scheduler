//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:priority_school_tasker/main.dart';
import 'package:priority_school_tasker/services/auth_service.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:priority_school_tasker/services/provider_service.dart';

final primaryColor = const Color(0xFF782F40);
enum AuthFormType {signIn, signUp, reset}


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

  void switchAuthFormType(String state){
    formkey.currentState.reset();
    if(state == "signUp")
      {
        setState(() {
          authFormType = AuthFormType.signUp;
        });
      }
    else{
      setState(() {
        authFormType = AuthFormType.signIn;
      });
    }
  }
  
  void submit() async {
    final form = formkey.currentState;
    form.save();
    try {
      final auth = Provider.of(context).auth;
      if(authFormType == AuthFormType.signIn){
        String uid = await auth.signInWithEmailAndPassword(
            _email, _password);
        print("Signed in with ID $uid");
        Navigator.of(context).pushReplacementNamed('/home');
      }
      else{
        String uid = await auth.createUserWithEmailAndPassword(
            _email, _password, _name);
        print("Signed in with new ID $uid");
        Navigator.of(context).pushReplacementNamed('/home');
      }
    }catch(e){
      print(e);
    }
  }

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
                    children: buildInputs() + buildButtons(),
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
    if (authFormType == AuthFormType.signIn) {
      _headerText = "Hey there, welcome back";
    }
    else if(authFormType == AuthFormType.reset) {
      _headerText = "I see you forgot your password";
    }
    else {
      _headerText = "Come join us";
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

    // Text field for name
    if(authFormType == AuthFormType.signUp){
      textFields.add(
        TextFormField(
          style: TextStyle(fontSize: 22.0),
          decoration: buildSignUpInputDecoration("name"),
          onSaved: (value) => _name = value,
        ),
      );
    }

    // just a space
    textFields.add(SizedBox(height: 20.0,));

    // Text field for email
    textFields.add(
      TextFormField(
        style: TextStyle(fontSize: 22.0),
        decoration: buildSignUpInputDecoration("email"),
        onSaved: (value) => _email = value,
      ),
    );

    // just a space
    textFields.add(SizedBox(height: 20.0,));

    // Text field for password
    textFields.add(
      TextFormField(
        style: TextStyle(fontSize: 22.0),
        decoration: buildSignUpInputDecoration("password"),
        onSaved: (value) => _password = value,
        obscureText: true,
      ),
    );

    // just a space
    textFields.add(SizedBox(height: 30.0,));
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

  List<Widget> buildButtons(){
    String _switchButtonText, _newformState, _submitButtonText;

    if(authFormType == AuthFormType.signIn){
      _switchButtonText = "Dont have an account? Sign Up";
      _newformState = "signUp";
      _submitButtonText = "Sign In";
    }
    else{
      _switchButtonText = "Have an account? Sign In";
      _newformState = "signIn";
      _submitButtonText = "Sign Up";
    }

    return [
      Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: RaisedButton(
          color: Colors.white,
          textColor: primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(_submitButtonText,
              style:  TextStyle(
                fontSize: 20.0,
                fontWeight : FontWeight.w900,
              ),
            ),
          ),
          onPressed: submit,
        ),
      ),

      FlatButton(
        child: Text(_switchButtonText, style: TextStyle(color: Colors.white),),
        onPressed: (){
          switchAuthFormType(_newformState);
        },
      )
    ];
  }
}

