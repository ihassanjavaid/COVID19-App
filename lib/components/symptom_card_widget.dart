import 'package:auto_size_text/auto_size_text.dart';
import 'package:covid19/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SymptomCard extends StatefulWidget {
  final String image;
  final String title;
  final bool isActive;
  String detailsText;
  
  SymptomCard({Key key, this.image, this.title, this.isActive = false, this.detailsText})
      : super(key: key);

  @override
  _SymptomCardState createState() => _SymptomCardState();
}

class _SymptomCardState extends State<SymptomCard> {
  double _width = 140;
  Color _color = Colors.white;
  String _textDetailsString = '';
  double _containerWidth = 0;

  _animateContainer(){
    setState(() {
      _width = _width == 140 ? 320 : 140;
      _color = _color == Colors.white ? kInfectedColor : Colors.white;
      _textDetailsString = _textDetailsString == "" ? widget.detailsText : '';
      _containerWidth = _containerWidth == 0 ? 200 : 0;
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
        height: 100,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
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
            AnimatedContainer(
              duration: Duration(milliseconds: 800),
              height: 100,
              width: _containerWidth,
              child: AutoSizeText(
                _textDetailsString,
                maxLines: 4,
                overflow: TextOverflow.clip,
                minFontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
