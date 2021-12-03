import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:e_commerce/UI/SIGNING/information_design.dart';
import 'package:e_commerce/configs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';


class Information extends StatefulWidget {
  String _email;

  Information(this._email);

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Color(0xFFaf59d1),
          backgroundColor: backColor,
          // appBar: AppBar(
          //   title: Text('Patient Account'),
          //   centerTitle: true,
          // ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  //color: Color(0xFF37f963),
                  color: colors,
                  elevation: 25,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(0)
                      )),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Center(
                      child: WavyAnimatedTextKit(
                        textStyle: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.w400
                        ),
                        text: ["Patient Account"],
                        isRepeatingAnimation: false,
                      ),
                    ),
                  ),
                ),
                InformationScreen(widget._email),
              ],
            ),
          )
      ),
    );
  }
}
