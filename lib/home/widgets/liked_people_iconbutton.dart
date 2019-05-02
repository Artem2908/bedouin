import 'package:bedouin/liked_people/like_screen.dart';
import 'package:flutter/material.dart';

class LikedPeopleIcon extends StatefulWidget {
  @override
  _LikedPeopleIconState createState() => _LikedPeopleIconState();
}

class _LikedPeopleIconState extends State<LikedPeopleIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: IconButton(
        icon: Icon(Icons.people),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return LikedPeople();
              },
            ),
          );
        },
      ),
    );
  }
}
