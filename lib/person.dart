import 'package:flutter/material.dart';

class Person {
  String name;
  int age;
  String gender;
  String medical_condition;
  String dateOfAdmission;
  String insuranceProvider;
  String testResults;
  int heartRate;
  String psychologicalCondition;
  String bloodType;
  //String admissionClass;


  Person({
    required this.name,
    required this.age,
    required this.gender,
    required this.medical_condition,
    required this.dateOfAdmission,
    required this.insuranceProvider,
    required this.testResults,
    required this.heartRate,
    required this.psychologicalCondition,
    required this.bloodType,
    //required this.admissionClass,
  });
}
