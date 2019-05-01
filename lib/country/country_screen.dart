import 'package:bedouin/country/widgets/country_header.dart';
import 'package:bedouin/country/widgets/gender_button.dart';
import 'package:bedouin/home/home_screen.dart';
import 'package:bedouin/models/user_choise.dart';
import 'package:bedouin/network/provider/people_provider.dart';
import 'package:flutter/material.dart';

class SelectCountry extends StatefulWidget {
  @override
  _SelectCountryState createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  UserChoose userChoose = UserChoose();
  PersonProvider personProvider = PersonProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CountryHeader(),
            DropdownButton<String>(
              style: TextStyle(color: Colors.orange),
              hint: Text('Select nat'),
              value: userChoose.country,
              items: Countries.values.map((country) {
                return DropdownMenuItem<String>(
                  child: Text(
                    personProvider.getCountry(country),
                  ),
                  value: personProvider.getCountry(country),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  userChoose.country = value;
                });
              },
            ),
            GenderButton(textbutton: 'male',),
            GenderButton(textbutton: 'female',),
          ],
        ),
      ),
    );
  }
}
