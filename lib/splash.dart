import 'package:flutter/material.dart';
import 'package:st1_project/home.dart';
//import 'package:st1_project/main.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 1500));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => EmptyPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        height: 251,
        width: 251,
        decoration: BoxDecoration(
          color:  Color.fromARGB(142, 238, 232, 214),
          borderRadius: BorderRadius.all(Radius.elliptical(30, 15))),
        
        child: Center(
            child: Image.asset(
          'assets/app_icon.png',
          height: 250,
          width: 250,
        )),
      ),
      Container(
        child: Text(
          'Welcome to MediAssist.',
          style: TextStyle(fontSize: 24, color: Color.fromARGB(255, 9, 61, 99)),
        ),
      ),
    ])));
  }
}
