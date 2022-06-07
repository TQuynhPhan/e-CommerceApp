import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //final FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _confirmPasswordTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 150.0,
          ),
          Text(
            "Register",
            style: TextStyle(
                fontSize: 40.0, fontWeight: FontWeight.bold, letterSpacing: 2),
          ),
          SizedBox(
            height: 80.0,
          ),
          Container(
            key: _formKey,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // TextFormField(
                //   decoration: InputDecoration(
                //     hintText: "Input username:",
                //     hintStyle: TextStyle(color: Colors.grey[500]),
                //     contentPadding: EdgeInsets.all(20.0),
                //     border: OutlineInputBorder(),
                //   ),
                // ),
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
                SizedBox(
                  height: 20.0,
                ),
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
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Input confirm password:",
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
                  controller: _confirmPasswordTextController,
                  validator: (value) {
                    if (value != null) {
                      if (value.isEmpty)
                        return "Password cannot be empty";
                      else if (value.length < 6)
                        return "Password has to be at least 6 characters long";
                    }
                  },
                ),
                SizedBox(
                  height: 50.0,
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 70.0),
                  child: Row(
                    children: <Widget>[
                      Text("Already have an account?"),
                      SizedBox(
                        width: 10.0,
                      ),
                      GestureDetector(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  onPressed: () {},
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Register"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
