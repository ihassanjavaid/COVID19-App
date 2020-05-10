import 'package:covid19/components/weekly_chart.dart';
import 'package:covid19/components/widget_builders.dart';
import 'package:covid19/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class DetailsScreen extends StatelessWidget {
  static String id = 'details_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidgetBuilders.buildDetailsAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 21),
                    blurRadius: 53,
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomWidgetBuilders.buildTitleWithMoreIcon(),
                  SizedBox(height: 15),
                  CustomWidgetBuilders.buildCaseNumber(context),
                  SizedBox(height: 15),
                  Text(
                    "From Health Center",
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      color: kTextMediumColor,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 15),
                  WeeklyChart(),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CustomWidgetBuilders.buildInfoTextWithPercentage(
                        percentage: "6.43",
                        title: "From Last Week",
                      ),
                      CustomWidgetBuilders.buildInfoTextWithPercentage(
                        percentage: "9.43",
                        title: "Recovery Rate",
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 21),
                    blurRadius: 54,
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Global Map",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SvgPicture.asset("assets/icons/more.svg")
                    ],
                  ),
                  SizedBox(height: 10),
                  SvgPicture.asset("assets/icons/map.svg"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
