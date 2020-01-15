import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/signin.dart';

class UsersData extends StatefulWidget {
  static const RouteName='/userdata';
  @override
  _UsersDataState createState() => _UsersDataState();
}

class _UsersDataState extends State<UsersData> {
  String text = '';
  List<DocumentSnapshot> _singleSnap;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firestore.instance.collection('users').getDocuments()
      ..then((snap) {
        _singleSnap = snap.documents.toList();
        setState(() {});
      });
    print("s");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _singleSnap == null
            ? Container()
            : Container(
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text('SignInPage'),
                    onPressed: (){
                    Navigator.of(context).pushNamed(SignIn.RouteName,arguments: {
                      'ertyui':'dfyghjk'
                    });
                  }),
                  Container(
                    height: 500,
                    child: ListView.builder(
                        itemCount: _singleSnap.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(_singleSnap[index]['Name']),
                            subtitle: Text(_singleSnap[index]['UID']),
                            trailing: Text(_singleSnap[index]['Phone']),
                          );
                        }),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}