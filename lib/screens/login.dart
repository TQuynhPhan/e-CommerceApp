import 'package:commercial_app/screens/home.dart';
import 'package:commercial_app/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // final GoogleSignIn googleSignIn = GoogleSignIn();
  // final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  late SharedPreferences sharedPreferences;
  bool loading = false;
  bool isLogedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });

    // sharedPreferences = await SharedPreferences.getInstance();
    // isLogedIn = await googleSignIn.isSignedIn();

    if (isLogedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    }

    setState(() {
      loading = false;
    });
  }

  Future handleSiginIn() async {
    sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });

    // GoogleSignInAccount? account = await googleSignIn.signIn();
    // GoogleSignInAuthentication? auth = await account?.authentication;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 150.0,
          ),
          Text(
            "Login",
            style: TextStyle(
                fontSize: 40.0, fontWeight: FontWeight.bold, letterSpacing: 2),
          ),
          SizedBox(
            height: 80.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Input email:",
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      contentPadding: EdgeInsets.all(20.0),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailTextController,
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        final RegExp regex = RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)| (\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                        if (!regex.hasMatch(value))
                          return 'Please make sure your email is valid';
                        else
                          return null;
                      }
                    },
                  ),
                  // TextFormField(
                  //   decoration: InputDecoration(
                  //     hintText: "Input email:",
                  //     hintStyle: TextStyle(color: Colors.grey[500]),
                  //     contentPadding: EdgeInsets.all(20.0),
                  //     border: OutlineInputBorder(),
                  //   ),
                  // ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Input password:",
                      suffixIcon: GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                        },
                        child: Icon(Icons.visibility),
                      ),
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      contentPadding: EdgeInsets.all(20.0),
                      border: OutlineInputBorder(),
                    ),
                    controller: _passwordTextController,
                    validator: (value) {
                      if (value != null) {
                        if (value.isEmpty)
                          return "Password cannot be empty";
                        else if (value.length < 6)
                          return "Password has to be at least 6 characters long";
                      }
                    },
                  ),
                  SizedBox(height: 50.0,),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 70.0),
                    child: Row(
                      children: <Widget>[
                        Text("Don't have an account?"),
                        SizedBox(
                          width: 10.0,
                        ),
                        GestureDetector(
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Register()));
                            })
                      ],
                    ),
                  ),

                  SizedBox(height: 10.0,),
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text("Login", style: TextStyle(fontSize: 18.0),),
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
