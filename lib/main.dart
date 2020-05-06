import 'package:covid19/components/custom_clipper.dart';
import 'package:covid19/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:covid19/utilities/constants.dart';

void main() {
  runApp(COVID());
}

class COVID extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID-19',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor:kBackgroundColor,
        fontFamily: "Poppins",
        textTheme: kTextTheme
      ),
      home: HomeScreen(),
    );
  }
}

