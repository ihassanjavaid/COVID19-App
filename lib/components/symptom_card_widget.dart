import 'package:covid19/utilities/constants.dart';
import 'package:flutter/material.dart';

class SymptomCard extends StatefulWidget {
  final String image;
  final String title;
  final bool isActive;
  const SymptomCard({Key key, this.image, this.title, this.isActive = false})
      : super(key: key);

  @override
  _SymptomCardState createState() => _SymptomCardState();
}

class _SymptomCardState extends State<SymptomCard> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: ,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            widget.isActive
                ? BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 20,
                    color: kActiveShadowColor,
                  )
                : BoxShadow(
                    offset: Offset(0, 3),
                    blurRadius: 6,
                    color: kShadowColor,
                  ),
          ]),
      child: Column(
        children: <Widget>[
          Image.asset(
            widget.image,
            height: 90,
          ),
          Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
