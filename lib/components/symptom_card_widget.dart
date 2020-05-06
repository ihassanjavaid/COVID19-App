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
  double _height = 100;
  double _width = 140;
  Color _color = Colors.white;

  _animateContainer(){
    setState(() {
      _height = _height == 100 ? 120 : 100;
      _width = _width == 140 ? 160 : 140;
      _color = _color == Colors.white ? kInfectedColor : Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _animateContainer();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: _height,
        width: _width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: _color,
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
      ),
    );
  }
}
