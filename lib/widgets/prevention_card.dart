import 'package:covidtracker/config.dart';
import 'package:flutter/material.dart';

class PreventionCard extends StatelessWidget {
  final String imageUrl, title;

  const PreventionCard({
    Key key,
    @required this.imageUrl,
    @required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imageUrl,
                  height: 90,
                  width: MediaQuery.of(context).size.width * 0.3,
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(width: 12),
              Flexible(
                child: Text(title, style: Config.titleStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
