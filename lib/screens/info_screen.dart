import 'package:covid19/components/header_clipper_widget.dart';
import 'package:covid19/components/symptom_card_widget.dart';
import 'package:covid19/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoScreen extends StatelessWidget {
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
                    text:  'Since the start of the Coronavirus outbreak some places have fully embraced washing hands',
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

class PreventionCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;

  const PreventionCard({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 156,
      child: Stack(
        children: <Widget>[
          Container(
            height: 136,
            child: Column(
            ),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kShadowColor,
                  ),
                ]),
          ),
          Image.asset(image),
          Positioned(
            left: 150,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15
              ),
              height: 136,
              width: MediaQuery.of(context).size.width - 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                   title,
                    style: kTitleTextstyle.copyWith(fontSize: 16),
                  ),
                  Text(
                   text,
                style: TextStyle(
                  fontSize: 12,
                ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset(
                        'assets/icons/forward.svg',
                      height: 10,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
