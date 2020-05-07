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
        children: <Widget>[
          Header(
            image: 'assets/icons/Drcorona.svg',
            textTop: "All you need",
            textBottom: "is stay at home.",
            showMenuButton: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: FutureBuilder(
                  future: getData(),
                  builder: (BuildContext context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final CovidData covidData = snapshot.data;
                    return Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: Color(0xFFE5E5E5))),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                  'assets/icons/maps-and-flags.svg'),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: DropdownButton(
                                  isExpanded: true,
                                  underline: SizedBox(),
                                  icon: SvgPicture.asset(
                                      'assets/icons/dropdown.svg'),
                                  value: this.country,
                                  items: ['Pakistan', 'United States', 'China']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value.toLowerCase(),
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      this.country = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: 'Case Update\n',
                                        style: kTitleTextstyle,
                                      ),
                                      TextSpan(
                                          text: 'Last Updated: ${covidData.date}',
                                          style: TextStyle(
                                            color: kTextLightColor,
                                          ))
                                    ]),
                                  ),
                                  Spacer(),
                                  Text(
                                    'See details',
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
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
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    CaseCounterContainer(
                                      color: kInfectedColor,
                                      number: covidData.confirmed,
                                      title: 'Infected',
                                    ),
                                    CaseCounterContainer(
                                      color: kDeathColor,
                                      number: covidData.deaths,
                                      title: 'Deaths',
                                    ),
                                    CaseCounterContainer(
                                      color: kRecoverColor,
                                      number: covidData.recovered,
                                      title: 'Recovered',
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Spread of Virus',
                                    style: kTitleTextstyle,
                                  ),
                                  Text(
                                    'See Details',
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                padding: EdgeInsets.all(2),
                                height: 195,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 30,
                                        color: kShadowColor,
                                      ),
                                    ]),
                                child: Image.asset(
                                  'assets/images/map.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
