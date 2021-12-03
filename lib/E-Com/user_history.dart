import 'package:e_commerce/E-Com/order_history.dart';
import 'package:e_commerce/UI/SIGNING/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User_History extends StatefulWidget {
  @override
  _User_HistoryState createState() => _User_HistoryState();
}

class _User_HistoryState extends State<User_History> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe37c22),
      appBar: AppBar(
        backgroundColor: Color(0xFFe37c22),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Center(child: Text('Order Details')),
        actions: [
          FlatButton(
              onPressed: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Sign_in()), (route) => false);
              },
              child: Icon(Icons.logout,color: Colors.white,))],
      ),
      body: StreamBuilder(
                  stream: Firestore.instance.collection('E-Commerce').snapshots(),
                  builder:
                      (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Text(
                        'Loading...',
                        style: TextStyle(color: Colors.white),
                      );
                    } else
                      return
                        ListView(
                          shrinkWrap: true,
                          children: snapshot.data.documents.map((document) {
                            if (Firestore.instance.collection('E-Commerce').document(document.documentID).collection('product').document(document.documentID) == null) {
                              Container(
                                height: 0,
                                width: 0,
                              );
                            }
                            else {
                              return Container(
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.18,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                //color: Colors.red,
                                child: ListTile(
                                    title: Text(
                                      document['First_Name'] ?? '',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text(
                                          document['Address'] ?? '',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          document['E-Mail'] ?? '',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          document['Mobile'] ?? '',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        FlatButton(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius
                                                    .circular(20)
                                            ),
                                            onPressed: () {
                                              String userid = document
                                                  .documentID;
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Order_History(
                                                              userid)));
                                            },
                                            child: Text('Order History'))
                                      ],
                                    )),
                              );
                            }
                          }).toList());
                  }
              ),
    );
  }
}
