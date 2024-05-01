import 'package:flutter/material.dart';
//import 'package:st1_project/home.dart';
import 'package:st1_project/person.dart';
import 'package:st1_project/recommendationPage.dart';

class SecondPage extends StatelessWidget {
  final Person person;

  SecondPage({required this.person});

  @override
  Widget build(BuildContext context) {
    //String status = " Error: Status could not be determined";

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Center(
              child: Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 153, 225, 241),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 24, 53, 198).withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10, right: 5, left: 5),
                      child: () {
                        if (person.gender.toLowerCase() == 'male') {
                          return Icon(
                            Icons.boy,
                            size: 50.0,
                            color: Colors.grey,
                          );
                        } else if (person.gender.toLowerCase() == 'female') {
                          return Icon(
                            Icons.girl,
                            size: 50.0,
                            color: Colors.pink,
                          );
                        }
                      }(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 5, right: 5),
                      child: Text(
                        person.name,
                        style: TextStyle(
                          fontSize: 25,
                          shadows: [
                            Shadow(
                              color: Colors.grey,
                              blurRadius: 4.0,
                              offset: Offset(0.5, 5.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, right: 5, left: 80),
                        child: Text(
                          "Age:${person.age.toString()}",
                          style: TextStyle(
                            fontSize: 18,
                            shadows: [
                              Shadow(
                                color: Colors.grey,
                                blurRadius: 4.0,
                                offset: Offset(1.0, 5.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, right: 5, left: 20),
                        child: Text(
                          "Blood Type:${person.bloodType}",
                          style: TextStyle(
                            fontSize: 18,
                            shadows: [
                              Shadow(
                                color: Colors.grey,
                                blurRadius: 4.0,
                                offset: Offset(1.0, 5.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                    Padding(
                      padding: EdgeInsets.only(top: 10, right: 5, left: 5),
                      child: Text(
                        "Admission Date:${person.dateOfAdmission}",
                        style: TextStyle(
                          fontSize: 18,
                          shadows: [
                            Shadow(
                              color: Colors.grey,
                              blurRadius: 4.0,
                              offset: Offset(1.0, 5.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, right: 5, left: 5),
                      child: Text(
                        "Medical Condition:${person.medical_condition}",
                        style: TextStyle(
                          fontSize: 18,
                          shadows: [
                            Shadow(
                              color: Colors.grey,
                              blurRadius: 4.0,
                              offset: Offset(1.0, 5.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, right: 5, left: 5),
                      child: Text(
                        "Heart rate:${person.heartRate.toString()}",
                        style: TextStyle(
                          fontSize: 18,
                          shadows: [
                            Shadow(
                              color: Colors.grey,
                              blurRadius: 4.0,
                              offset: Offset(1.0, 5.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, right: 5, left: 5),
                      child: Text(
                        "Insurance Provider:${person.insuranceProvider}",
                        style: TextStyle(
                          fontSize: 18,
                          shadows: [
                            Shadow(
                              color: Colors.grey,
                              blurRadius: 4.0,
                              offset: Offset(1.0, 5.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 5),
                      child: Container(
                        width: 350,
                        height: 50,
                        decoration: BoxDecoration(
                          color: getColor(person.age),
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(5),
                            right: Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 158, 121, 10)
                                  .withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Center(
                            child: Text(
                          getAdmission(person.age),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 9, 9, 9),
                          ),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecommendationPage(
                              person: person,
                            )),
                  );
                },
                child: Text(
                  "View Recommended Treatment",
                  style: TextStyle(fontSize: 19, color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(350, 50),
                  backgroundColor: Color.fromARGB(255, 144, 197, 226),
                  foregroundColor: Color.fromARGB(255, 14, 24, 160),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 100, left: 30),
            child: Row(children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.1),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                child: BackButton(
                  color: Colors.blue,
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }

  Color getColor(int age) {
    if (age < 18) {
      return Color.fromARGB(255, 225, 38, 20); // Color for children
    } else if (age < 45) {
      return Color.fromARGB(255, 143, 142, 136); // Color for adults
    } else {
      return Color.fromARGB(255, 236, 245, 54); // Color for seniors
    }
  }

  String getAdmission(int age) {
    if (age < 18) {
      return "Emergency"; 
    } else if (age < 45) {
      return "Elective"; 
    } else {
      return "Urgent"; 
    }
  }
}
