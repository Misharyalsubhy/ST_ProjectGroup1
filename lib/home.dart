import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:st1_project/patientCardView.dart';
import 'package:st1_project/person.dart';

TextEditingController _ageController = TextEditingController();
TextEditingController _nameController = TextEditingController();
TextEditingController _medicalConditionController = TextEditingController();
TextEditingController _dateOfAdmissionController = TextEditingController();
TextEditingController _insuranceProviderController = TextEditingController();
TextEditingController _testResultsController = TextEditingController();
TextEditingController _heartRatePerMinuteController = TextEditingController();
TextEditingController _psychologicalConditionController =
    TextEditingController();

class EmptyPage extends StatefulWidget {
  @override
  _EmptyPageState createState() => _EmptyPageState();
}

class _EmptyPageState extends State {
  String? _selectedBloodType;
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(66, 64, 214, 228),
        title: Center(
          child: Image.asset(
            'assets/app_icon.png',
            height: 90,
            width: 90,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5, right: 5, left: 5),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Patient\'s name',
                    hintText: 'Enter the patient name',
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.delete_outline),
                      onPressed: () {
                        _clearTextField(_nameController);
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, right: 5, left: 5),
                child: Row(children: [
                  Padding(
                    padding: EdgeInsets.only(right: 33),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 220),
                      child: TextField(
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          labelText: 'Patient Age',
                          hintText: 'Enter the patient\'s age',
                          prefixIcon: Icon(Icons.date_range),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.delete_outline),
                            onPressed: () {
                              _clearTextField(_ageController);
                            },
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: SizedBox(
                      height: 60.0,
                      width: 130.0,
                      child: DropdownButtonFormField<String>(
                        value: _selectedGender,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedGender = newValue;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Gender',
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        style: TextStyle(fontSize: 16.0),
                        items: <String>['Male', 'Female'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, right: 5, left: 5),
                child: TextField(
                  controller: _medicalConditionController,
                  decoration: InputDecoration(
                    labelText: 'Medical condition',
                    hintText: 'Enter the patient medical condition',
                    prefixIcon: Icon(Icons.description),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.delete_outline),
                      onPressed: () {
                        _clearTextField(_medicalConditionController);
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, right: 5, left: 5),
                child: TextField(
                  controller: _dateOfAdmissionController,
                  decoration: InputDecoration(
                    labelText: 'Date of admission',
                    prefixIcon: Icon(Icons.calendar_month_outlined),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.delete_outline),
                      onPressed: () {
                        _clearTextField(_dateOfAdmissionController);
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  readOnly: true,
                  onTap: () {
                    _selectDate();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, right: 5, left: 5),
                child: TextField(
                  controller: _insuranceProviderController,
                  decoration: InputDecoration(
                    labelText: 'Insurance provider',
                    hintText: 'Enter the Insurance provider',
                    prefixIcon: Icon(Icons.domain),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.delete_outline),
                      onPressed: () {
                        _clearTextField(_insuranceProviderController);
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, right: 5, left: 5),
                child: TextField(
                  controller: _testResultsController,
                  decoration: InputDecoration(
                    labelText: 'Test results',
                    hintText: 'Enter the test reults',
                    prefixIcon: Icon(Icons.assignment),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.delete_outline),
                      onPressed: () {
                        _clearTextField(_testResultsController);
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 5, right: 5, left: 5),
                  child: TextField(
                    controller: _heartRatePerMinuteController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      labelText: 'Heart rate',
                      hintText: 'Enter the patient\'s Heart rate per minute',
                      prefixIcon: Icon(Icons.favorite),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.delete_outline),
                        onPressed: () {
                          _clearTextField(_heartRatePerMinuteController);
                        },
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 5, right: 5, left: 5),
                child: TextField(
                  controller: _psychologicalConditionController,
                  decoration: InputDecoration(
                    labelText: 'Psychological Condition',
                    hintText: 'Enter the psychological condition',
                    prefixIcon: Icon(Icons.psychology),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.delete_outline),
                      onPressed: () {
                        _clearTextField(_psychologicalConditionController);
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, right: 5, left: 5),
                child: DropdownButtonFormField<String>(
                  value: _selectedBloodType,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedBloodType = newValue;
                    });
                  },
                  decoration: InputDecoration(
                      labelText: 'Blood Type',
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                  items: <String>[
                    'A+',
                    'A-',
                    'B+',
                    'B-',
                    'AB+',
                    'AB-',
                    'O+',
                    'O-'
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Person person1 = Person(
                    name: _nameController.text,
                    age: int.parse(_ageController.text),
                    gender: _selectedGender ?? '',
                    medical_condition: _medicalConditionController.text,
                    dateOfAdmission: _dateOfAdmissionController.text,
                    insuranceProvider: _insuranceProviderController.text,
                    testResults: _testResultsController.text,
                    heartRate: int.parse(_heartRatePerMinuteController.text),
                    psychologicalCondition:
                        _psychologicalConditionController.text,
                    bloodType: _selectedBloodType ?? '',
                    //admissionClass: generatedpersonClass!,
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondPage(
                              person: person1,
                            )),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  backgroundColor: Colors.white,
                  elevation: 8,
                  shadowColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('View Addmission Type '),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // a method to show the datepicker for the admission date text field
  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (_picked != null) {
      setState(() {
        _dateOfAdmissionController.text = _picked.toString().substring(0, 10);
      });
    }
  }

  void _clearTextField(TextEditingController controller) {
    controller.clear();
  }
}
