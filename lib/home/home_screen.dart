import 'package:bedouin/home/widgets/liked_people_iconbutton.dart';
import 'package:bedouin/liked_people/like_screen.dart';
import 'package:bedouin/models/user_choise.dart';
import 'package:bedouin/network/models/result.dart';
import 'package:bedouin/network/provider/people_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PeopleScreen extends StatefulWidget {
  final UserChoose userChoose;

  const PeopleScreen({Key key, this.userChoose}) : super(key: key);

  @override
  _PeopleScreenState createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  PersonProvider personProvider = PersonProvider();
  Firestore firestore = Firestore.instance;
  Future<Results> result;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    result = personProvider.getRandomPerson(widget.userChoose.gender, widget.userChoose.country);
    result.then((_) {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              'Bedouin',
              textAlign: TextAlign.center,
            )),
        actions: <Widget>[
          LikedPeopleIcon(),
        ],
      ),
      body: FutureBuilder(
        future: result,
        builder: (BuildContext context, AsyncSnapshot<Results> snapshot) {
          if (snapshot.data == null || loading) {
            return Center(child: CircularProgressIndicator());
          }
          print(snapshot.data);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300.0,
                height: 300.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(snapshot.data.picture.large ?? ''),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      snapshot.data.name.first ?? '',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Text(
                    snapshot.data.name.last ?? '',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    snapshot.data.dob.age.toString() ?? '',
                    style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic, color: Colors.black38),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      result.then((result) async {
                        await firestore.collection("user").add({
                          'name': result.name.first,
                          'surname': result.name.last,
                          'email': result.email,
                          'largepicture': result.picture.large,
                          'smallpicture': result.picture.thumbnail,
                          'city': result.location.city,
                        });
                      });
                      update();
                    },
                    child: Container(
                      height: 60.0,
                      width: MediaQuery.of(context).size.width / 3,
                      child: Center(
                        child: Text('Like'),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => update(),
                    child: Container(
                      height: 60.0,
                      width: MediaQuery.of(context).size.width / 3,
                      child: Center(
                        child: Text('Dislike'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  void update() {
    setState(() {
      loading = true;
      result = personProvider.getRandomPerson(widget.userChoose.gender, widget.userChoose.country)
        ..then((_) {
          setState(() {
            loading = false;
          });
        });
    });
  }
}
