import 'package:covid19/components/header_clipper_widget.dart';
import 'package:covid19/components/prevention_card_widget.dart';
import 'package:covid19/components/symptom_card_widget.dart';
import 'package:covid19/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoScreen extends StatelessWidget {
  static String id = 'info_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Header(
              image: 'assets/icons/coronadr.svg',
              textTop: 'Get to know',
              textBottom: 'About Covid-19',
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Text(
                    'Symptoms',
                    style: kTitleTextstyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SymptomCard(
                        image: 'assets/images/headache.png',
                        title: 'Headache',
                        isActive: true,
                      ),
                      SymptomCard(
                        image: 'assets/images/caugh.png',
                        title: 'Cough',
                      ),
                      SymptomCard(
                        image: 'assets/images/fever.png',
                        title: 'Fever',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Prevention',
                    style: kTitleTextstyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PreventionCard(
                    text:  'Since the start of the Coronavirus outbreak some places have fully embraced wearing facemasks',
                    image: 'assets/images/wear_mask.png',
                    title: 'Wear face mask',
                  ),
                  PreventionCard(
                    text:  'Since the start of0 the Coronavirus outbreak some places have fully embraced washing hands',
                    image: 'assets/images/wash_hands.png',
                    title: 'Wash your hands',
                  ),
SizedBox(
  height: 50,
),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}