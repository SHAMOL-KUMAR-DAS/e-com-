import 'package:e_commerce/UI/SIGNING/information.dart';
import 'package:e_commerce/UI/SIGNING/information_design.dart';
import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';

class OTP_Verification extends StatefulWidget {
  String _email;
  OTP_Verification(this._email);
  @override
  _OTP_VerificationState createState() => _OTP_VerificationState(this._email);
}

class _OTP_VerificationState extends State<OTP_Verification> {
  String _email;
  _OTP_VerificationState(this._email);

  final TextEditingController _otpController = TextEditingController();

  void verifyOTP()async{
    var res = EmailAuth.validate(receiverMail: _email, userOTP: _otpController.text);
    if(res){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Information(_email)));
    }else{
      showDialog(context: context, builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text("Invalid OTP"),
          content: Row(
            children: [
              new Text("Please Type Valid OTP"),
              FlatButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('Ok'))
            ],
          ),
        );
      }
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 80,right: 80),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: _otpController,
              decoration: InputDecoration(
                hintText: "Type Your 6 digit OTP",
                labelText: 'OTP'
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
          FlatButton(onPressed: (){
            verifyOTP();
          },
              child: Text('OTP Verification'))
        ],
      ),

    );
  }
}
