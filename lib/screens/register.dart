import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

final GlobalKey<FormState>_formKey=GlobalKey<FormState>();
class _RegisterState extends State<Register> {
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
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Input username:",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    contentPadding: EdgeInsets.all(20.0),
                    border: OutlineInputBorder(),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Input email:",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    contentPadding: EdgeInsets.all(20.0),
                    border: OutlineInputBorder(),
                  ),
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
                ),
                RaisedButton(
                  onPressed: () {},
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Register"),
                ),
                Row(
                  children: <Widget>[
                    Text("Already have an account?"),
                    SizedBox(
                      width: 10.0,
                    ),
                    GestureDetector(
                      child: Text("Login", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
