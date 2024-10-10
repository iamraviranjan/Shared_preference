import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginsharedpref/home.dart';
import 'package:loginsharedpref/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var nameControler = TextEditingController();

  var passControler = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),

      body: Container(
        margin: EdgeInsets.only(left: 32, right: 32),
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.account_circle, color: Colors.blue, size: 70,),
              SizedBox(height: 11,),
              TextField(controller: nameControler,
                decoration: InputDecoration(
                    label: Text('name'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21)
                    )
                ),
              ),

              SizedBox(height: 11,),
              TextField(controller: passControler,
                decoration: InputDecoration(
                    label: Text('password'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21)
                    )
                ),
              ),

              SizedBox(height: 11,),
              ElevatedButton(onPressed: ()async{

             var sharedpref = await SharedPreferences.getInstance();
             sharedpref.setBool(MyHomePageState.KEYLOGIN, true);



                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home()));
              },
                  child: Text('login',
                    style: TextStyle(fontSize: 22, color: Colors.blue),)),

            ],
          ),
        ),
      ),
    );
  }

}
