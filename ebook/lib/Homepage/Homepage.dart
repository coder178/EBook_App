import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Homepage/Bottom.dart';
import 'package:ebook/Homepage/ContinueReading.dart';
import 'package:ebook/Homepage/PopularBooks.dart';
import 'package:ebook/Homepage/Quotes.dart';
import 'package:ebook/Homepage/Searchbar.dart';
import 'package:ebook/Homepage/Topbar.dart';
import 'package:ebook/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  List pages = [
    Homepage(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
          Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          // color: Colors.red,
          height: size.height * 0.08,
          child: LayoutBuilder(builder: (context,constraints){
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: constraints.maxHeight*0.55,
                  width: constraints.maxHeight* 0.50,
                  color: Colors.white,
                  child: FittedBox(child : Icon(Icons.menu)),
                ),
                SizedBox(width: constraints.maxWidth * 0.38,),
                Container(
                  height: constraints.maxHeight*0.5,
                  width: constraints.maxWidth * 0.35,
                  color: Colors.white,
                  child: FittedBox(
                      child : Text(
                        "Hello ${loggedInUser.firstName} ",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      )
                  ),
                ),

                Container(
                  height: constraints.maxHeight*0.55,
                  width: constraints.maxHeight* 0.55,

                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          constraints.maxHeight * 0.30
                      ),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:AssetImage('assets/images/nature.jpg'))
                  ),
                ),
              ],
            );
          },),
        ),
             // TopbarHome(),
              Quotes(),
              SizedBox(height: size.height * 0.006,),
              // SearchBar(),
              SizedBox(height: size.height * 0.006,),
              ContinueReading(),
              PopularBooks(),
              // BottomBar()
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
                label: "Home", icon: Icon(Icons.home_outlined)),
            BottomNavigationBarItem(
                label: "Explore", icon: Icon(Icons.explore_outlined)),
            BottomNavigationBarItem(
                label: "Settings", icon: Icon(Icons.settings_outlined))
          ]),
    );
  }
  //
  // Future<void> logout(BuildContext context) async {
  //   await FirebaseAuth.instance.signOut();
  //   Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (context) => LoginScreen()));
  // }
}
