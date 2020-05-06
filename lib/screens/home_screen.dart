import 'package:covid19/components/custom_clipper.dart';
import 'package:covid19/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: CustomCurveClipper(),
            child: Container(
              padding: EdgeInsets.only(left: 40, top: 50, right: 20),
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color( 0xFF3383CD),
                    Color(0xFF11249f),
                  ],
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/virus.png'),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                      child: SvgPicture.asset('assets/icons/menu.svg')
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        SvgPicture.asset('assets/icons/Drcorona.svg',
                        width: 230,
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                        ),
                        Positioned(
                          top: 20,
                          left: 150,
                          child: Text(
                            'All you need \nis stay at home.',
                            style: kHeadingTextStyle.copyWith(
                              color: Colors.white
                            ),
                          ),
                        ),
                        Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Color(0xFFE5E5E5))
            ),
            child: Row(
              children: <Widget>[
                SvgPicture.asset('assets/icons/maps-and-flags.svg'),
                Expanded(
                  child: DropdownButton(
                    items: ['Pakistan', 'United States', 'China']
                        .map((e) => null)
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}