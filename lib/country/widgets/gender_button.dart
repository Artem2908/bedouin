import 'package:bedouin/home/home_screen.dart';
import 'package:bedouin/models/user_choise.dart';
import 'package:bedouin/network/provider/people_provider.dart';
import 'package:flutter/material.dart';

class GenderButton extends StatefulWidget {
  final String textbutton;

  const GenderButton({Key key, this.textbutton}) : super(key: key);

  @override
  _GenderButtonState createState() => _GenderButtonState();
}

class _GenderButtonState extends State<GenderButton> {
  UserChoose userChoose = UserChoose();
  PersonProvider personProvider = PersonProvider();

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: widget.textbutton == 'male' ? Colors.amber : Colors.orange,
      child: Text(widget.textbutton),
      onPressed: () {
        if (widget.textbutton == 'male') {
          userChoose.gender = PersonGenders.male;
        } else {
          userChoose.gender = PersonGenders.female;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return PeopleScreen(userChoose: userChoose);
            },
          ),
        );
      },
    );
  }
}
