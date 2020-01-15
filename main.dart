import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/read_user_data.dart';
import 'package:flutter_firebase/signin.dart';
import 'package:flutter_firebase/user_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        UsersData.RouteName:(context)=>UsersData(),
        UserInfo.RouteName:(context)=>UserInfo(),
        SignIn.RouteName:(context)=>SignIn(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
      Scaffold(body:SafeArea(
              child: MainSection(),
      ))
  
    );
  }
}

class MainSection extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(child: Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.laptop_mac,size: 120,),
                  SizedBox(height: 30,),
          RaisedButton(child: Text('Go To User List')
          ,onPressed: (){Navigator.of(context).pushNamed(UsersData.RouteName);
          },), RaisedButton(child: Text('Go To User List')
          ,onPressed: (){Navigator.of(context).pushNamed(SignIn.RouteName);
          },)
        ],),),);
  }
}