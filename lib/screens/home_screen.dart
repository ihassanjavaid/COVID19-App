import 'package:covid19/components/case_counter_widget.dart';
import 'package:covid19/components/header_clipper_widget.dart';
import 'package:covid19/models/covid_data.dart';
import 'package:covid19/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String country = 'pakistan';

  getData() async {
    final String url = 'https://api.covid19api.com/total/country/$country';
    final http.Response rawJson = await http.get(url);
    final parsedJson = jsonDecode(rawJson.body);

    return CovidData.fromJson(parsedJson.last);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(
            textTop: "All you need",
            textBottom: "is stay at home.",
            showMenuButton: true,
          ),
          FutureBuilder(
            future: getData(),
            builder: (BuildContext context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final CovidData covidData = snapshot.data;
              return Padding(
                padding: const EdgeInsets.only(right: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 160, top: 10),
                      child: Align(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'Pakistan\n',
                              style: kHeadingTextStyle.copyWith(
                                  fontSize: 50, color: kDullBlueColor),
                            ),
                            TextSpan(
                              text: 'Last updated: ${covidData.date}',
                              style: kSubTextStyle.copyWith(fontSize: 20),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 130,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 30,
                                color: kShadowColor,
                              ),
                            ],
                          ),
                          child: CaseCounterContainer(
                            color: kInfectedColor,
                            number: covidData.confirmed,
                            title: 'Infected',
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                          width: 130,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 30,
                                color: kShadowColor,
                              ),
                            ],
                          ),
                          child: CaseCounterContainer(
                            color: kDeathColor,
                            number: covidData.deaths,
                            title: 'Deaths',
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                          width: 130,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 30,
                                color: kShadowColor,
                              ),
                            ],
                          ),
                          child: CaseCounterContainer(
                            color: kRecoverColor,
                            number: covidData.recovered,
                            title: 'Recovered',
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Icon(
              Icons.keyboard_arrow_down,
              size: 100,
              color: kDullBlueColor,
            ),
          )
        ],
      ),
    );
  }
}
