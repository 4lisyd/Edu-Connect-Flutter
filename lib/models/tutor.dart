import 'package:flutter/material.dart';

class Tutor extends ChangeNotifier {
  String name;
  String email;
  bool gender;
  String bio;
  String area;
  Map<String, bool> daysAvailable = {
    "Monday": false,
    "Tuesday": false,
    "Wednesday": false,
    "Thursday": false,
    "Friday": false,
    "Saturday": false,
    "Sunday": false,
  };

  Map<String, bool> subjectPreferred = {
    "Maths": false,
    "English": false,
    "Science": false,
    "Arabic": false,
    "Islamic Studies": false,
    "Social Studies": false,
  };

  Map<String, bool> testPreferred = {
    "IELTS": false,
    "SATS": false,
    "Cambridge IGCSE": false,
    "GMAT": false,
    "GRE": false,
    "TOEFL": false,
  };

  Map<String, bool> areYou = {"employed": false};

  bool signUp() {}
}
