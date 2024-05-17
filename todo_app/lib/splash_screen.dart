import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/HomeScreen.dart';
import 'package:todo_app/login_page.dart';


class splashScreen extends StatefulWidget {
  const splashScreen ({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen>{

  @override
  void initState(){
    super.initState();
    Future.delayed(
      Duration(seconds: 5),(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>loginPage()));
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child:Lottie.network("https://lottie.host/c498b6ba-7aab-4cd8-b71d-9dea9be27383/21ffgXEu34.json"),
        ),
      ),
    );
    Widget build(BuildContext context) {
      return const Placeholder();
    }
  }
}