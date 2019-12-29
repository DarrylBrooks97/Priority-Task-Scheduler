import 'dart:convert';
import 'package:flutter/services.dart';

class UserClass{
  final String className;
  final int weight;
  final int credit;

  // Default Constructor
  UserClass({this.className = "Data Structures 101",this.weight=0,this.credit=0});

  factory UserClass.fromJson(Map<String, dynamic> json) {
    return new UserClass(
      className: json['Name'],
      weight: json['Weight'],
      credit: json['Credit'],
    );
  }

}