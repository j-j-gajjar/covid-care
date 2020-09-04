import 'dart:convert';
import 'package:covidtracker/config.dart';
import 'package:covidtracker/widgets/prevention_card.dart';
import 'package:covidtracker/widgets/service_card.dart';
import 'package:covidtracker/widgets/starts_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid-care',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedState = 'All State';
  int infectedCount = 0;
  int deadCount = 0;
  int curedCount = 0;
  int activeCount = 0;
  bool loader = false;
  @override
  void initState() {
    super.initState();
    _getApiData();
  }

  _getApiData() async {
    setState(() {
      loader = !loader;
    });
    if (selectedState == 'All State') {
      http.Response response =
          await http.get('https://api.covidindiatracker.com/total.json');
      var data = jsonDecode(response.body);
      setState(() {
        infectedCount = data['confirmed'];
        deadCount = data['deaths'];
        curedCount = data['recovered'];
        activeCount = data['active'];
        loader = !loader;
      });
    } else {
      http.Response response =
          await http.get('https://api.covidindiatracker.com/state_data.json');
      var data = jsonDecode(response.body);
      for (int i = 0; i < data.length; i++) {
        if (data[i]['state'] == selectedState) {
          setState(() {
            infectedCount = data[i]['confirmed'];
            deadCount = data[i]['deaths'];
            curedCount = data[i]['recovered'];
            activeCount = data[i]['active'];
            loader = !loader;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildMainTitle(),
                _buildMyLocation(),
              ],
            ),
            SizedBox(height: 36),
            _buildAppTitle('What are you looking for ?'),
            SizedBox(height: 36),

            // Make a horizontal Listview

            Container(
              height: 190,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  ServiceCard(
                      name: 'General\nCheck Up',
                      icon: FontAwesomeIcons.heartbeat,
                      color: Config.blueColor),
                  ServiceCard(
                      name: 'Chat\nWith Doctor',
                      icon: FontAwesomeIcons.commentMedical,
                      color: Config.redColor),
                  ServiceCard(
                      name: 'Health\nNews',
                      icon: FontAwesomeIcons.rss,
                      color: Config.orangeColor),
                  ServiceCard(
                      name: 'Get Doctor\nAdvice',
                      icon: FontAwesomeIcons.userMd,
                      color: Config.greenColor),
                ],
              ),
            ),

            SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildAppTitle('Disease: Covid-19'),
                loader ? CircularProgressIndicator() : Container(),
              ],
            ),

            SizedBox(height: 24),

            // How Stats card looks like
            //Enclose stats in horizontal list view

            LimitedBox(
              maxHeight: 218,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  StatsCard(
                      country: selectedState.toLowerCase(),
                      infected: infectedCount,
                      dead: deadCount,
                      cured: curedCount),
                ],
              ),
            ),

            SizedBox(height: 24),

            _buildAppTitle('Preventive Measures'),
            SizedBox(height: 16),

            // Preventive measures widgets

            LimitedBox(
              maxHeight: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  PreventionCard(
                    imageUrl: 'assets/hands.jpg',
                    title: 'Wash Hands Often',
                  ),
                  PreventionCard(
                    imageUrl: 'assets/distance.jpg',
                    title: 'Keep Social Distance',
                  ),
                  PreventionCard(
                    imageUrl: 'assets/home.jpg',
                    title: 'Stay at home',
                  ),
                  PreventionCard(
                    imageUrl: 'assets/mask.jpg',
                    title: 'Put on Face Masks',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildAppTitle(String title) {
    return Text(
      title,
      style: Config.titleStyle,
    );
  }

  _buildMyLocation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(FontAwesomeIcons.mapMarkerAlt,
            color: Colors.deepPurpleAccent, size: 14),
        SizedBox(width: 4),
        DropdownButton<String>(
          value: selectedState.toString(),
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String newValue) {
            setState(() {
              selectedState = newValue;
              _getApiData();
            });
          },
          items: <String>[
            'All State',
            'Andaman and Nicobar Islands',
            'Andhra Pradesh',
            'Arunachal Pradesh',
            'Assam',
            'Bihar',
            'Chandigarh',
            'Chhattisgarh',
            'Dadra and Nagar Haveli',
            'Daman and Diu',
            'Delhi',
            'Goa',
            'Gujarat',
            'Haryana',
            'Himachal Pradesh',
            'Jammu',
            'Jharkhand',
            'Karnataka',
            'Kashmir',
            'Kerala',
            'Ladakh',
            'Lakshadweep',
            'Madhya Pradesh',
            'Maharashtra',
            'Manipur',
            'Meghalaya',
            'Mizoram',
            'Nagaland',
            'Odisha',
            'Puducherry',
            'Punjab',
            'Rajasthan',
            'Sikkim',
            'Tamil Nadu',
            'Telangana',
            'Tripura',
            'Uttarakhand',
            'Uttar Pradesh',
            'West Bengal'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        SizedBox(width: 4),
      ],
    );
  }

  _buildMainTitle() {
    return RichText(
        text: TextSpan(
            text: 'Covid',
            style: GoogleFonts.poppins(
              color: Config.primaryColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            children: <TextSpan>[
          TextSpan(
            text: '-care',
            style: GoogleFonts.poppins(
              color: Config.redColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          )
        ]));
  }
}
