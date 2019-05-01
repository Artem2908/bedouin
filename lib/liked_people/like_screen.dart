import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LikedPeople extends StatelessWidget {
  final Firestore firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Likes'),
      ),
      body: StreamBuilder(
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data.documents.map((document) {
              return Dismissible(
                key: Key(document.documentID),
                background: Container(
                  color: Colors.red,
                  child: Text('Delete',textAlign: TextAlign.left,),
                ),
                direction: DismissDirection.startToEnd,
                onDismissed: (_) async {
                  await firestore.collection('user').document(document.documentID).delete();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage("${document.data['smallpicture']}"),
                    ),
                    title: Row(
                      children: <Widget>[
                        Text("${document.data['name']} ${document.data['surname']}"),
                      ],
                    ),
                    subtitle: Text("${document.data['email']}"),
                  ),
                ),
              );
            }).toList(),
          );
        },
        stream: firestore.collection("user").snapshots(),
      ),
    );
  }
}
