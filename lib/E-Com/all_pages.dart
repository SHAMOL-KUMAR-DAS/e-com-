import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/E-Com/design.dart';
import 'package:e_commerce/UI/PROFILE/profile.dart';
import 'package:flutter/material.dart';
import 'cart.dart';
import 'detail.dart';

class All_Pages extends StatefulWidget {
  String page;
  All_Pages(this.page);
  @override
  _All_PagesState createState() => _All_PagesState(this.page);
}

class _All_PagesState extends State<All_Pages> {

  String page;
  _All_PagesState(this.page);

  var item = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextFormField(
                cursorColor: Colors.black,
                //style: TextStyle(color: Colors.red),
                decoration: InputDecoration(
                  //hoverColor: Colors.black,
                  isDense: true,
                  contentPadding: EdgeInsets.all(15),
                  fillColor: Colors.black,
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                    color: Color(0xFFfca903),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.black26, width: 3.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.black26,
                      width: 3.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFFfca903),
                  border: Border.all(color: Color(0xFFfca903), width: 4),
                  borderRadius: BorderRadius.circular(20)),
              child: Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
                size: 30,
              ),
            )
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFfca903),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 25),
                child: Text(
                  'Categories',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => All_Pages('Women')));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.white, width: 15),
                                  borderRadius: BorderRadius.circular(80)),
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/design/woman.png'),
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'Women',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        FlatButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => All_Pages('Men')));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.white, width: 15),
                                  borderRadius: BorderRadius.circular(80)),
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/design/men.png'),
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'Men',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        FlatButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>All_Pages('Devices')));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.white, width: 15),
                                  borderRadius: BorderRadius.circular(80)),
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/design/devices.png'),
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'Devices',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        FlatButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>All_Pages('Gadgets')));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.white, width: 15),
                                  borderRadius: BorderRadius.circular(80)),
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/design/Gadgets.png'),
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'Gadgets',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        FlatButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>All_Pages('Games')));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.white, width: 15),
                                  borderRadius: BorderRadius.circular(80)),
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/design/games.png'),
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'Games',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      ],
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(10),
                    //   child: Column(
                    //     children: [
                    //       Container(
                    //           decoration: BoxDecoration(
                    //               color: Colors.white,
                    //               border: Border.all(
                    //                   color: Colors.white, width: 15),
                    //               borderRadius: BorderRadius.circular(80)),
                    //           child: Image(
                    //               image: AssetImage(
                    //                   'assets/images/design/baby.png'),
                    //               width: 30,
                    //               height: 30,
                    //               fit: BoxFit.fill)),
                    //       SizedBox(
                    //         height: MediaQuery.of(context).size.height * 0.01,
                    //       ),
                    //       Text(
                    //         'Baby',
                    //         style: TextStyle(color: Colors.white, fontSize: 16),
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 25),
                child: Row(
                  children: [
                    Text(
                      'Product',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.54,
                    ),
                    FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Design()));
                        },
                        child: Text(
                          'Home',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
              if (page == 'Women')...[
                _build_showWomen()
              ]
              else if(page == 'Men')...[
                _build_showMen()
              ]
              else if(page == 'Devices')...[
                _build_showDevice()
                ]
              else if(page == 'Gadgets')...[
                _build_showGadget()
                  ]
              else if(page == 'Games')...[
                _build_showGame()
                    ]
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        color: Colors.white,
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            FlatButton(
                onPressed: () {},
                child: Text(
                  'Explore',
                  style: TextStyle(color: Color(0xFFfca903)),
                )),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
            ),
            FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
                },
                child: Icon(
                  Icons.add_shopping_cart,
                  color: Color(0xFFfca903),
                )),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.12,
            ),
            FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                },
                child: Icon(
                  Icons.perm_identity_outlined,
                  color: Color(0xFFfca903),
                )),
          ],
        ),
      ),
    );
  }
  Widget _build_showWomen(){
    item = 'Women';
    return
    StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('Women').snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Text('Loading...',style: TextStyle(color: Colors.white),));
          } else
            return ListView(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: snapshot.data.documents.map((document) {
                  return FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Details(
                                  item,
                                  document['_Product_Name']??'',
                                  document['_Product_Details']??'',
                                  document['_Product_Price']??'',
                                  document['Image']??''
                              )));
                    },
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //NetworkImage(),
                          Card(
                            elevation: 20,
                            color: Colors.white,
                            //BoxDecoration(color: Colors.black)
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                side:
                                BorderSide(color: Colors.black)),
                            child: Container(
                              height:
                              MediaQuery.of(context).size.height *
                                  0.35,
                              width:
                              MediaQuery.of(context).size.width *
                                  0.45,
                              child: Image(
                                  image: NetworkImage(
                                      document['Image'] ?? '')),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  document['_Product_Name'] ?? '',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  document['_Product_Details'] ?? '',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  document['_Product_Price'] ?? '',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.015,)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList());
        }
        );
  }

  Widget _build_showMen(){
    item = 'Men';
    return
      StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('Men').snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: Text('Loading...',style: TextStyle(color: Colors.white),));
            } else
              return ListView(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: snapshot.data.documents.map((document) {
                    return FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                    item,
                                    document['_Product_Name']??'',
                                    document['_Product_Details']??'',
                                    document['_Product_Price']??'',
                                    document['Image']??''
                                )));
                      },
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //NetworkImage(),
                            Card(
                              elevation: 20,
                              color: Colors.white,
                              //BoxDecoration(color: Colors.black)
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  side:
                                  BorderSide(color: Colors.black)),
                              child: Container(
                                height:
                                MediaQuery.of(context).size.height *
                                    0.35,
                                width:
                                MediaQuery.of(context).size.width *
                                    0.45,
                                child: Image(
                                    image: NetworkImage(
                                        document['Image'] ?? '')),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  document['_Product_Name'] ?? '',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  document['_Product_Details'] ?? '',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  document['_Product_Price'] ?? '',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.015,)
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList());
          }
      );
  }

  Widget _build_showDevice(){
    item = 'Device';
    return
      StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('Devices').snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: Text('Loading...',style: TextStyle(color: Colors.white),));
            } else
              return ListView(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: snapshot.data.documents.map((document) {
                    return FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                    item,
                                    document['_Product_Name']??'',
                                    document['_Product_Details']??'',
                                    document['_Product_Price']??'',
                                    document['Image']??''
                                )));
                      },
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //NetworkImage(),
                            Card(
                              elevation: 20,
                              color: Colors.white,
                              //BoxDecoration(color: Colors.black)
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  side:
                                  BorderSide(color: Colors.black)),
                              child: Container(
                                height:
                                MediaQuery.of(context).size.height *
                                    0.35,
                                width:
                                MediaQuery.of(context).size.width *
                                    0.45,
                                child: Image(
                                    image: NetworkImage(
                                        document['Image'] ?? '')),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  document['_Product_Name'] ?? '',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  document['_Product_Details'] ?? '',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  document['_Product_Price'] ?? '',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.015,)
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList());
          }
      );
  }

  Widget _build_showGadget(){
    item = 'Gadget';
    return
      StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('Gadgets').snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: Text('Loading...',style: TextStyle(color: Colors.white),));
            } else
              return ListView(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: snapshot.data.documents.map((document) {
                    return FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                    item,
                                    document['_Product_Name']??'',
                                    document['_Product_Details']??'',
                                    document['_Product_Price']??'',
                                    document['Image']??''
                                )));
                      },
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //NetworkImage(),
                            Card(
                              elevation: 20,
                              color: Colors.white,
                              //BoxDecoration(color: Colors.black)
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  side:
                                  BorderSide(color: Colors.black)),
                              child: Container(
                                height:
                                MediaQuery.of(context).size.height *
                                    0.35,
                                width:
                                MediaQuery.of(context).size.width *
                                    0.45,
                                child: Image(
                                    image: NetworkImage(
                                        document['Image'] ?? '')),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  document['_Product_Name'] ?? '',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  document['_Product_Details'] ?? '',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  document['_Product_Price'] ?? '',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.015,)
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList());
          }
      );
  }

  Widget _build_showGame(){
    item = 'Game';
    return
      StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('Games').snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: Text('Loading...',style: TextStyle(color: Colors.white),));
            } else
              return ListView(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: snapshot.data.documents.map((document) {
                    return FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                    item,
                                    document['_Product_Name']??'',
                                    document['_Product_Details']??'',
                                    document['_Product_Price']??'',
                                    document['Image']??''
                                )));
                      },
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //NetworkImage(),
                            Card(
                              elevation: 20,
                              color: Colors.white,
                              //BoxDecoration(color: Colors.black)
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  side:
                                  BorderSide(color: Colors.black)),
                              child: Container(
                                height:
                                MediaQuery.of(context).size.height *
                                    0.35,
                                width:
                                MediaQuery.of(context).size.width *
                                    0.45,
                                child: Image(
                                    image: NetworkImage(
                                        document['Image'] ?? '')),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  document['_Product_Name'] ?? '',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  document['_Product_Details'] ?? '',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  document['_Product_Price'] ?? '',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.015,)
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList());
          }
      );
  }
}