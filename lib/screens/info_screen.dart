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
      body: Column(
        children: <Widget>[
          Header(
            image: 'assets/icons/coronadr.svg',
            textTop: 'Get to know',
            textBottom: 'About Covid-19',
            showMenuButton: false,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
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
                    SizedBox(
                      height: 135,
                      width: double.infinity,
                      child: ListView(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        scrollDirection: Axis.horizontal,
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
                          SymptomCard(
                            image: 'assets/images/headache.png',
                            title: 'Lethargy',
                          ),
                        ],
                      ),
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
                      text:
                          'Since the start of the Coronavirus outbreak some places have fully embraced wearing facemasks',
                      image: 'assets/images/wear_mask.png',
                      title: 'Wear face mask',
                    ),
                    PreventionCard(
                      text:
                          'People have developed this habit of washing their hands every now and then for their protection',
                      image: 'assets/images/wash_hands.png',
                      title: 'Wash your hands',
                    ),
                    PreventionCard(
                      text:
                      'Social distancing and isolation are the only known preventive measures in this pandemic',
                      image: 'assets/images/wash_hands.png',
                      title: 'Stay Distant',
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
