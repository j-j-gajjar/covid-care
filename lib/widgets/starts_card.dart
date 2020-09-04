import 'package:covidtracker/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StatsCard extends StatelessWidget {
  final String country;
  final int infected, dead, cured, active;

  const StatsCard(
      {Key key,
      @required this.country,
      @required this.infected,
      @required this.dead,
      @required this.cured,
      this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Material(
        elevation: 4,
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        shadowColor: Colors.black45,
        child: Container(
          width: MediaQuery.of(context).size.width * 90 / 100,
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(country, style: Config.statsTitleStyle),
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Config.primaryColor.withOpacity(.2),
                    ),
                    child: Icon(
                      FontAwesomeIcons.chevronDown,
                      color: Config.blueColor,
                      size: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Divider(
                color: Colors.black12,
                thickness: 1,
              ),
              SizedBox(height: 4),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                margin: EdgeInsets.only(bottom: 12),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Config.redColor.withOpacity(.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child:
                    Text('Infected : $infected', style: Config.infectedStyle),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                margin: EdgeInsets.only(bottom: 12),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Config.greenColor.withOpacity(.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text('Cured : $cured', style: Config.curedStyle),
              ),
//              Container(
//                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                margin: EdgeInsets.only(bottom: 12),
//                width: double.infinity,
//                decoration: BoxDecoration(
//                  color: Colors.orangeAccent[400],
//                  borderRadius: BorderRadius.circular(4),
//                ),
//                child: Text('Active : $active', style: Config.activeStyle),
//              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                margin: EdgeInsets.only(bottom: 12),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text('Dead : $dead', style: Config.deadStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
