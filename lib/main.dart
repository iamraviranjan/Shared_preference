import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loginsharedpref/home.dart';
import 'package:loginsharedpref/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Shared login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
var bgclr = Colors.blueGrey;
  static const String KEYLOGIN ="login";

static const String KEYLOGOUT ="logout";

  @override
  void initState() {
    super.initState();

    whereToGo();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,

        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: bgclr,
        child: Icon(Icons.account_circle, size: 100,color: Colors.blue,),
      ),


    );
  }

  void whereToGo() async{
var sharedpref = await SharedPreferences.getInstance();

var isLogedIn = sharedpref.getBool(KEYLOGIN);


    Timer(Duration(seconds: 4), () {

      if(isLogedIn!= null){
      if(isLogedIn){
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => home(),));
      }  else{
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => login(),));
      }
      }else{
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => login(),));
      }

    });

  }


}
