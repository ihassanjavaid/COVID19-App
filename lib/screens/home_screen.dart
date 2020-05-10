import 'dart:convert';

import 'package:covid19/components/info_card.dart';
import 'package:covid19/components/widget_builders.dart';
import 'package:covid19/models/covid_data.dart';
import 'package:covid19/screens/details_screen.dart';
import 'package:covid19/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  static String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    getData() async {
      final String url = 'https://api.covid19api.com/total/country/pakistan';
      final http.Response rawJson = await http.get(url);
      final parsedJson = jsonDecode(rawJson.body);
      return CovidData.fromJson(parsedJson.last);
    }

    return Scaffold(
      appBar: CustomWidgetBuilders.buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 40),
            width: double.infinity,
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.03),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: FutureBuilder(
                future: getData(),
                builder: (BuildContext context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final covidData = snapshot.data;
                  return Wrap(
                    runSpacing: 20,
                    spacing: 20,
                    children: <Widget>[
                      InfoCard(
                        title: "Confirmed Cases",
                        iconColor: Color(0xFFFF8C00),
                        effectedNum: CustomWidgetBuilders.formatCaseNumber(caseCount: covidData.confirmed),
                        press: () {},
                      ),
                      InfoCard(
                        title: "Total Deaths",
                        iconColor: Color(0xFFFF2D55),
                        effectedNum: CustomWidgetBuilders.formatCaseNumber(caseCount: covidData.deaths),
                        press: () {},
                      ),
                      InfoCard(
                        title: "Total Recovered",
                        iconColor: Color(0xFF50E3C2),
                        effectedNum: CustomWidgetBuilders.formatCaseNumber(caseCount: covidData.recovered),
                        press: () {},
                      ),
                      InfoCard(
                        title: "Active Cases",
                        iconColor: Color(0xFF5856D6),
                        effectedNum: CustomWidgetBuilders.formatCaseNumber(caseCount: covidData.active),
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailsScreen();
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  );
                }),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Preventions",
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  CustomWidgetBuilders.buildPrevention(),
                  SizedBox(height: 40),
                  SizedBox(
                    height: 130,
                    child: ListView(
                      children: <Widget>[
                        CustomWidgetBuilders.buildHelpCard(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
