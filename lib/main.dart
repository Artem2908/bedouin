import 'package:bedouin/country/country_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Country Picker Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: SelectCountry(),
    );
  }
}
