import 'dart:io';
import 'package:e_commerce/E-Com/user_history.dart';
import 'package:e_commerce/UI/SIGNING/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Admin_Page extends StatefulWidget {
  @override
  _Admin_PageState createState() => _Admin_PageState();
}

class _Admin_PageState extends State<Admin_Page> {
  String category;
  String _product_name, _product_price, _product_details, image;

  Firestore firestore = Firestore.instance;

  String productchose;
  List productitem = [
    "Women",
    "Men",
    "Devices",
    "Gadgets",
    "Games",
  ];

  Future<void> sendData() async {
    var storageImage = FirebaseStorage.instance.ref().child(_image.path);
    var task = storageImage.putFile(_image);
    String imgurl = await (await task.onComplete).ref.getDownloadURL();
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    await (imgurl);
    firestore.collection(category).add({
      '_Product_Name': _product_name,
      '_Product_Price': _product_price,
      '_Product_Details': _product_details,
      'Image': imgurl,
    });
  }
  // Future updateuserimage(String image) async{
  //   firestore.collection(category).add({
  //     'Image': image,
  //   });
  //   print(image);
  // }
  // sendImage() async {
  //   var storageImage = FirebaseStorage.instance.ref().child(_image.path);
  //   var task = storageImage.putFile(_image);
  //   imgurl = await (await task.onComplete).ref.getDownloadURL();
  //   FirebaseUser user = await FirebaseAuth.instance.currentUser();
  //   //await sendData(imgurl);
  // }

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

  // _showAlertDialog(BuildContext context) {
  //   //AlertDialog alert = AlertDialog();
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       if (_product_name.isEmpty && _product_details.isEmpty && _product_price.isEmpty && _image == null){
  //       return AlertDialog(
  //         title: Text('Please Give All Information'),
  //       );}
  //     },
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe37c22),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFe37c22),
        elevation: 0,
        title: Center(child: Text('Admin Panel')),
        actions: [
          FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>User_History()));
                // Navigator.pushAndRemoveUntil(
                //     context,
                //     MaterialPageRoute(builder: (context) => Sign_in()),
                //     (route) => false);
              },
              child: Text('Order History',style: TextStyle(color: Colors.white),)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: DropdownButton(
                iconEnabledColor: Colors.white,
                //style: TextStyle(decorationColor: Colors.white),
                dropdownColor: Color(0xFFe37c22),
                hint: Text(
                  "Select a Category",
                  style: TextStyle(color: Colors.white),
                ),
                value: productchose,
                onChanged: (newValue) {
                  setState(() {
                    productchose = newValue;
                  });
                },
                items: productitem.map((valueitem) {
                  if (productchose == 'Women') {
                    category = 'Women';
                  } else if (productchose == 'Men') {
                    category = 'Men';
                  } else if (productchose == 'Devices') {
                    category = 'Devices';
                  } else if (productchose == 'Gadgets') {
                    category = 'Gadgets';
                  } else if (productchose == 'Games') {
                    category = 'Games';
                  }
                  print(category);
                  return DropdownMenuItem(
                      value: valueitem,
                      child: Text(
                        valueitem,
                        style: TextStyle(color: Colors.white),
                      ));
                }).toList(),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.3,
              child: _image == null ? Text("") : Image.file(_image),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
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
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: "Product Name",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.white, width: 3.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                ),
                onChanged: (input) {
                  setState(() {
                    _product_name = input;
                  });
                },
                // validator: (input){
                //   if(input.isEmpty){
                //     return "Please Enter a Product Name";
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
              child: TextFormField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: "Product Price",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.white, width: 3.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                ),
                onChanged: (input) {
                  setState(() {
                    _product_price = input;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: "Product Details",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.white, width: 3.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                ),
                onChanged: (input) {
                  setState(() {
                    _product_details = input;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: FlatButton(
                  color: Colors.white,
                  minWidth: MediaQuery.of(context).size.width * 0.5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    sendData();
                    //_showAlertDialog(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Admin_Page()));
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(color: Color(0xFFe37c22)),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
