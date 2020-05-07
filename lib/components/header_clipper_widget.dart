import 'package:covid19/components/custom_clipper_widget.dart';
import 'package:covid19/screens/home_screen.dart';
import 'package:covid19/screens/info_screen.dart';
import 'package:covid19/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Header extends StatelessWidget {
  final String image;
  final String textTop;
  final String textBottom;
  final bool showMenuButton;

  const Header({
    Key key,
    this.image,
    this.textTop,
    this.textBottom, 
    this.showMenuButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurveClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 40, top: 50, right: 20),
        height: 240,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF3383CD),
              Color(0xFF11249f),
            ],
          ),
          /*image: DecorationImage(
            image: AssetImage('assets/images/virus.png'),
          ),*/
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
                alignment: Alignment.topRight,
                child: showMenuButton ?
                GestureDetector(
                    child: SvgPicture.asset('assets/icons/menu.svg'),
                  onTap: () {
                      Navigator.pushNamed(context, InfoScreen.id);
                  },
                ) :
                GestureDetector(
                    child: Image.asset('assets/icons/back_button.png',
                    height: 22,
                    width: 22,
                    ),
                  onTap: () {
                      Navigator.popAndPushNamed(context, HomeScreen.id);
                  },
                )
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  SvgPicture.asset(
                   image,
                    width: 130,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                  Positioned(
                    top: 20,
                    left: 130,
                    child: Text(
                      '$textTop \n$textBottom',
                      style:
                      kHeadingTextStyle.copyWith(color: Colors.white),
                    ),
                  ),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
