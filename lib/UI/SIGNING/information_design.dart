// import 'package:e_commerce/UI/SIGNING/sign_in.dart';
// import 'package:e_commerce/configs.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:e_commerce/E-Com/database.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';
//
// class UserInformation extends StatefulWidget {
//   String _email;
//   UserInformation(this._email);
//   @override
//   _UserInformationState createState() => _UserInformationState(this._email);
// }
//
// class _UserInformationState extends State<UserInformation> {
//   String _email;
//   _UserInformationState(this._email);
//
//   var _name = TextEditingController();
//   var _address = TextEditingController();
//   var _mobile = TextEditingController();
//
//   final CollectionReference brewcollection = Firestore.instance.collection('E-Commerce');
//   String uid;
//
//
//   Future<void> sendData()async{
//     FirebaseUser user = await FirebaseAuth.instance.currentUser();
//     await DataBaseUserService(uid: user.uid).UpdateUserData(
//         _name.text,_address.text,_mobile.text,this._email,
//     );
//     Navigator.push(context, MaterialPageRoute(builder: (context)=>Sign_in()));
//   }
//
//   sendImage() async {
//     var storageImage = FirebaseStorage.instance.ref().child(_image.path);
//     var task = storageImage.putFile(_image);
//     String imgurl = await (await task.onComplete).ref.getDownloadURL();
//     FirebaseUser user = await FirebaseAuth.instance.currentUser();
//     await DataBaseUserService(uid: user.uid).updateuserimage(imgurl);
//   }
//
//
//   File _image;
//
//   Future cameraImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
//
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//   Future galleryImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Color(0xFFfff5f5),
//         appBar: AppBar(
//           backgroundColor: colors,
//           title: Text('User Information'),
//           centerTitle: true,
//         ),
//         body: Container(
//           padding: EdgeInsets.only(left: 25, right: 25),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     FloatingActionButton(
//                       onPressed: (){
//                        cameraImage();
//                       },
//                       child: Icon(Icons.camera_alt_outlined),
//                     ),
//                     SizedBox(width: MediaQuery.of(context).size.width * 0.05,),
//                     FloatingActionButton(
//                       onPressed: (){
//                         galleryImage();
//                       },
//                       child: Icon(Icons.photo_library_outlined),
//                     )
//                   ],
//                 ),
//
//                 Padding(
//                   padding: const EdgeInsets.only(left: 25, right: 25),
//                   child: TextFormField(
//                     controller: _name,
//                     decoration: InputDecoration(
//                         labelText: "Name",
//                     hintText: "Your Full Name"),
//                   ),
//                 ),
//
//                 Padding(
//                   padding: const EdgeInsets.only(left: 25, right: 25),
//                   child: TextFormField(
//                     controller: _address,
//                     decoration: InputDecoration(
//                         labelText: "Address",
//                     hintText: "Your Current Location"),
//                   ),
//                 ),
//
//                 Padding(
//                   padding: const EdgeInsets.only(left: 25, right: 25),
//                   child: TextFormField(
//                     controller: _mobile,
//                     keyboardType: TextInputType.number,
//                     decoration:
//                     InputDecoration(
//                       labelText: "Mobile No",
//                         hintText: "01x10203040"
//                     ),
//                   ),
//                 ),
//
//                 Container(
//                   height: MediaQuery.of(context).size.height * 0.3,
//                   width: MediaQuery.of(context).size.width * 0.3,
//                   child: _image == null? Text(""):Image.file(_image),
//                 ),
//
//                 FlatButton(
//                     color: Color(0xFFff503d),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(20))
//                     ),
//                     minWidth: MediaQuery.of(context).size.width * 0.8,
//                     onPressed: () {
//                       sendData();
//                       sendImage();
//                     },
//                     child: Text("Save Information",style: (TextStyle(color: Colors.white,fontSize: 18)),))
//               ],
//             ),
//           ),
//         ),
//     );
//   }
// }

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/E-Com/database.dart';
import 'package:e_commerce/MODEL/districts.dart';
import 'package:e_commerce/MODEL/thanas.dart';
import 'package:e_commerce/UI/SIGNING/sign_in.dart';
import 'package:e_commerce/configs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class InformationScreen extends StatefulWidget {


  var email;

  InformationScreen(this.email);

  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {

  var _baseUrl = 'https://doctorbari24.restaurantsoftbd.com';

  var name = TextEditingController();
  var address = TextEditingController();
  var mobile = TextEditingController();

    final CollectionReference brewcollection = Firestore.instance.collection('E-Commerce');
  String uid;


  Future<void> sendData()async{
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    await DataBaseUserService(uid: user.uid).UpdateUserData(
        name.text,address.text,mobile.text,widget.email,
    );
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Sign_in()));
  }

  sendImage() async {
    var storageImage = FirebaseStorage.instance.ref().child(_image.path);
    var task = storageImage.putFile(_image);
    String imgurl = await (await task.onComplete).ref.getDownloadURL();
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    await DataBaseUserService(uid: user.uid).updateuserimage(imgurl);
  }

  //Image Get+Save from Camera
  File _image;
  Future cameraImage() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  //Image Get+Save from Gallery
  Future galleryImage() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  var _hideText = true;

  viewPass(){
    setState(() {
      _hideText = !_hideText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 15),
        child: Column(
          children: [
            //Name
            TextFormField(
              controller: name,
              style: TextStyle(fontSize: 20, color: Color(0xFF777878)),
              autofillHints: [AutofillHints.name],
              autofocus: false,
              decoration: InputDecoration(
                labelText: 'Your Name *',
                hintText: 'Enter Your Name',
                fillColor: Color(0xFFffffff),
                filled: true,
                labelStyle: TextStyle(fontSize: 16),
                hintStyle: TextStyle(fontSize: 16),
                prefixIcon: Icon(Icons.account_circle),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                      color: colors,
                      width: 2
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Color(0xFFfffff),
                    width: 2.0,
                  ),
                ),
                contentPadding: EdgeInsets.only(top: 10, left: 20),
                //suffixIcon: name.text.length > 0 ? Icon(Icons.done) : Icon(Icons.pin)
              ),
            ),

            //Address
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: TextFormField(
                controller: address,
                style: TextStyle(fontSize: 20, color: Color(0xFF777878)),
                autofillHints: [AutofillHints.addressCityAndState],
                decoration: InputDecoration(
                    labelText: 'Your Address *',
                    hintText: 'Enter Your Address *',
                    fillColor: Color(0xFFffffff),
                    filled: true,
                    labelStyle: TextStyle(fontSize: 16),
                    hintStyle: TextStyle(fontSize: 16),
                    prefixIcon: Icon(Icons.home),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          color: Colors.red,
                          width: 2
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color(0xFFfffff),
                        width: 2.0,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(top: 10, left: 20)
                ),
              ),
            ),

            //Mobile
            TextFormField(
              controller: mobile,
              keyboardType: TextInputType.number,
              maxLength: 3,
              style: TextStyle(fontSize: 20, color: Color(0xFF777878)),
              //autofillHints: [AutofillHints.birthday],
              decoration: InputDecoration(
                  counter: Offstage(),
                  labelText: 'Mobile No *',
                  hintText: 'Enter Your Mobile No. *',
                  fillColor: Color(0xFFffffff),
                  filled: true,
                  labelStyle: TextStyle(fontSize: 16),
                  hintStyle: TextStyle(fontSize: 16),
                  //prefixIcon: Image(image: AssetImage('assets/images/thana.png'),height: 3,width: 3,),
                  prefixIcon: Icon(Icons.people_outline_outlined),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: Colors.red,
                        width: 2
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Color(0xFFffffff),
                      width: 2.0,
                    ),
                  ),
                  contentPadding: EdgeInsets.only(top: 10, left: 20)
              ),
            ),



            //Image
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width *0.8,
                decoration: BoxDecoration(
                  color: Color(0xFFffffff),
                  border: Border.all(
                      width: 2,
                      color: Color(0xFFffffff)
                  ),
                  borderRadius: BorderRadius.circular(0),
                ),
                child: _image != null ? Stack(
                    children:[
                      Center(child: Image.file(_image,)),
                      Positioned(
                          right: -2,
                          top: -9,
                          child: IconButton(
                              icon: Icon(
                                Icons.cancel,
                                color: Colors.black.withOpacity(0.5),
                                size: 18,
                              ),
                              onPressed: () => setState(() {
                                _image = null;
                              })))
                    ]) :
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 50),
                  child: Column(
                    children: [
                      Text('Select Your Image'),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            backgroundColor: Colors.white,
                            onPressed: () {
                              cameraImage();
                            },
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: Color(0xFFe37c22),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          FloatingActionButton(
                            backgroundColor: Colors.white,
                            onPressed: () {
                              galleryImage();
                            },
                            child: Icon(Icons.photo_library_outlined,
                                color: Color(0xFFe37c22)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //Save Button
            FlatButton(
              color: colors,
              minWidth: MediaQuery.of(context).size.width,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              onPressed: (){


                if(name.text != '' && mobile.text != '' && address.text != ''){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Sign_in()), (route) => false);
                }
                else if(name.text == ''){
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text('Enter Your Name'),
                        );
                      });
                }
                else if(address.text == ''){
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text('Enter Your Address'),
                        );
                      });
                }
                // else if(_image == null){
                //   showDialog(
                //       context: context,
                //       builder: (BuildContext context){
                //         return AlertDialog(
                //           title: Text('Select Your Blood Group'),
                //         );
                //       });
                // }
                else if(mobile.text == '' || mobile.text.length != 11 || !mobile.text.startsWith('017') || !mobile.text.startsWith('013') ||
                    !mobile.text.startsWith('019') || !mobile.text.startsWith('014') || !mobile.text.startsWith('015') || !mobile.text.startsWith('016') ||
                    !mobile.text.startsWith('018')){
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text('Enter Your Mobile No.'),
                        );
                      });
                }
              },
              child: Text('Save',style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
