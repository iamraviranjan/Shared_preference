import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginsharedpref/login.dart';

class home extends StatefulWidget {  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Home"),
    ),

    body:Container(
      color: Colors.blueGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Icon(Icons.home, size: 100, color: Colors.blue,)),
          SizedBox(height: 11,),

          ElevatedButton(onPressed: (){


            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>login()));

          }, child: Text('Logout',style: TextStyle(fontSize: 22, color: Colors.blue),)),
        ],
      ),


    ),

  );
}}


//sharedpref.setBool(MyHomePageState.KEYLOGIN, false);  // logout