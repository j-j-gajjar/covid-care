import 'package:covidtracker/config.dart';
import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color color;

  const ServiceCard(
      {Key key, @required this.name, @required this.icon, @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 170,
      width: 150,
      child: Stack(
        alignment: Alignment.bottomLeft,
        fit: StackFit.loose,
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              child: Container(
                height: 156,
                width: 134,
                padding: EdgeInsets.all(16),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(name, style: Config.serviceStyle),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(12),
              color: color,
              child: Container(
                height: 84,
                width: 84,
                child: Center(
                  child: Icon(icon, size: 44, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
