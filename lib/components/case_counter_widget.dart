import 'dart:async';
import 'package:covid19/utilities/constants.dart';
import 'package:flutter/material.dart';

class CaseCounterContainer extends StatefulWidget {
  final int number;
  final Color color;
  final String title;
  
  const CaseCounterContainer({
    Key key,
    this.number,
    this.color,
    this.title,
  }) : super(key: key);

  @override
  _CaseCounterContainerState createState() => _CaseCounterContainerState();
}


class _CaseCounterContainerState extends State<CaseCounterContainer> {
  Timer timer;
  double _circleWidth = 2;
  double _outerCircle = 25;

  void updateColors(){
    setState(() {
      _circleWidth = _circleWidth == 2 ? 4 : 2;
      _outerCircle = _outerCircle == 25 ? 30 : 25;
    });
  }
  
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 1000), (Timer ticker) {
      updateColors();
    });
  }
  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 32,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            padding: EdgeInsets.all(6),
            height: _outerCircle,
            width: _outerCircle,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.color.withOpacity(.26),
            ),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(
                  color: widget.color,
                  width: _circleWidth,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          formatCaseNumber(caseCount: widget.number),
          style: TextStyle(fontSize: 30, color: widget.color),
        ),
        Text(
          widget.title,
          style: kSubTextStyle,
        ),
      ],
    );
  }

  String formatCaseNumber({@required int caseCount}) {
    if (caseCount.toString().length < 4)
      return caseCount.toString();
    else if (caseCount.toString().length == 4)
      return caseCount.toString().substring(0, 1) + ',' + caseCount.toString().substring(1, 4);
    else if (caseCount.toString().length == 5)
    return caseCount.toString().substring(0, 2) + ',' + caseCount.toString().substring(2,5);
    else if (caseCount.toString().length == 6)
      return caseCount.toString().substring(0, 3) + ',' + caseCount.toString().substring(3,6);
    else if (caseCount.toString().length == 7)
      return caseCount.toString().substring(0, 1) + ',' + caseCount.toString().substring(2,5) + ',' + caseCount.toString().substring(3,6);
    return caseCount.toString();
  }
}
