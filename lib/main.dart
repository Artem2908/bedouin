import 'package:bedouin/country/country_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Country Picker Demo',
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: new SelectCountry(),
    );
  }
}
