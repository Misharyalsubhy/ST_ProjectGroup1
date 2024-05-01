import 'package:flutter/material.dart';
import 'package:st1_project/person.dart';
import 'package:st1_project/text_generator.dart';
 

class RecommendationPage extends StatefulWidget {
  final Person person;
  RecommendationPage({required this.person});

  @override
  _RecommendationPageState createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  String? generatedText = '';
  final TextGenerator googleGenerator =
      TextGenerator('AIzaSyCritf_ENXJej2zoPIdrhBbSKALZ8p4dkg');

  Future<void> generateText(String prompt) async {
    try {
      final text = await googleGenerator.generateText(prompt);
      setState(() {
        generatedText = text; 
      });
    } catch (e) {
      setState(() {
        generatedText = 'Failed to generate text: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(18),
                child: Container(
                  width: 350,
                  height: 350,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 153, 225, 241),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 24, 53, 198)
                            .withOpacity(0.5), 
                        spreadRadius: 5, 
                        blurRadius: 7, 
                        offset: Offset(0, 3), 
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                      
                      child: Center(
                        child: Container(
                        padding: EdgeInsets.all(16),
                        child:Text(
                          generatedText!,
                          style: TextStyle(
                            color: Colors.brown,
                          ),
                        ),),
                      )),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    String prompt = '''
Generate an example of a patient treatment. They are ${widget.person.age.toString()} years old, their gender is ${widget.person.gender}, and they have been diagnosed with ${widget.person.medical_condition}. They were admitted to the hospital on ${widget.person.dateOfAdmission}. Their blood type is ${widget.person.bloodType} and their current heart rate is ${widget.person.heartRate.toString()}. , considering their age, medical condition, and other health factors, including psychological condition. give one paragraph of one potential treatment option their implications given their age and condition.
''';
                    generateText(prompt);
                  },
                  child: Text(
                    "Get Treatment Recommendation",
                    style: TextStyle(fontSize: 19, color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(350, 50),
                    backgroundColor: Color.fromARGB(255, 144, 197, 226),
                    foregroundColor: Color.fromARGB(255, 14, 24, 160),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15), 
                    ),
                    elevation: 5, 
                    shadowColor: const Color.fromARGB(255, 244, 45, 45),
                  ),
                ),
              ),
            ),

            Expanded(
                child: Container()), 
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      20), 
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
            ),
          ],
        ),
      ),
    );
  }
}
