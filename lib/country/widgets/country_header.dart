import 'package:flutter/material.dart';

class CountryHeader extends StatefulWidget {
  @override
  _CountryHeaderState createState() => _CountryHeaderState();
}

class _CountryHeaderState extends State<CountryHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Bedouin',
          style: TextStyle(fontSize: 33.0),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 64.0,
            backgroundImage: NetworkImage("https://cdn.dribbble.com/users/44023/screenshots/3899871/beduin.png"),
          ),
        ),
        Text(
          'find your camel',
          style: TextStyle(fontSize: 20.0, color: Colors.black45),
        ),
      ],
    );
  }
}
