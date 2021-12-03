import 'package:e_commerce/E-Com/admin_page.dart';
import 'package:e_commerce/E-Com/design.dart';
import 'package:e_commerce/UI/SIGNING/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Admin_Sign_In extends StatefulWidget {
  @override
  _Admin_Sign_InState createState() => _Admin_Sign_InState();
}

class _Admin_Sign_InState extends State<Admin_Sign_In> {
  String _email, _password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Future<void> SignIn() async {
    final formstate = _formkey.currentState;
    if (formstate.validate()) {
      formstate.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: "excelit2021@gmail.com", password: _password);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Admin_Page()));
      } catch (e) {
        print(e.message);
      }
    }
  }

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFF70a5ff),
      backgroundColor: Colors.blue.shade100,
      body: Form(
        key: _formkey,
        //scrollDirection: Axis.vertical,
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.9,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("Start with signing in"),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.01,
                  // ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Image(image: AssetImage('assets/images/sign_in_up/admin.png'))),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child:
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "E-Mail",
                      ),
                      onSaved: (input) {
                        setState(() {
                          _email = input;
                        });
                      },
                      validator: (input) {
                        if (input.isEmpty) {
                          return "Please Enter Your Email";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  Column(
                    children: [
                      //SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: TextFormField(
                          onSaved: (input){
                            setState(() {
                              _password=input;
                            });
                          },
                          validator: (input){
                            if(input.length<6){
                              return "Password is too small";
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.black),
                          obscureText: _obscureText,

                          decoration: InputDecoration(
                              labelText: "Password",
                              suffixIcon: InkWell(
                                //onTap: VisiblePassword,
                                onTap: _toggle,
                                child: _obscureText? Icon(Icons.visibility_off):Icon(Icons.visibility),
                              ),
                              labelStyle: TextStyle(color: Colors.black)
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  FlatButton(
                      color: Color(0xFFb7bdb9),
                      minWidth: MediaQuery.of(context).size.width * 0.5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        setState(() {
                          SignIn();
                        });
                      },
                      child: Text("Sign In")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}