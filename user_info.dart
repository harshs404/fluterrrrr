import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  static const RouteName='/userinfo';
  final TextEditingController _nameCOntroller = TextEditingController();
  final TextEditingController _phoneCOntroller = TextEditingController();
  final TextEditingController _UidCOntroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameCOntroller,
            ),
            TextField(
              controller: _phoneCOntroller,
            ),
            TextField(
              controller: _UidCOntroller,
              onChanged: (cha){

              },
            ),
            RaisedButton(
              child: Text("Submit"),
              onPressed: () {
                var map = {
                  'Name': _nameCOntroller.text,
                  'Phone': _phoneCOntroller.text,
                  'UID': _UidCOntroller.text
                };
                Firestore.instance
                    .collection('users')
                    .add(map).then((value) {
                  print("submitted");
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
