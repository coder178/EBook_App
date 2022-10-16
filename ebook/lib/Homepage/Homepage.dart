import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Homepage/explorescreen.dart';
import 'package:ebook/Homepage/homescreen.dart';
import 'package:ebook/Homepage/profilescreen.dart';
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
  //String? uname = loggedInUser.firstName;
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  List<Widget> pages = [
    HomeScreen(),
    Explore(),
    //Profile(username: loggedInUser.firstName!)
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Center(
          child: Text(
            'Ebook App',
            style:
            TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold,color: Colors.black),
          ),
        ),
      ),
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              pages[currentIndex]

              // BottomBar()
            ],
          ),
        ),
      ),

      bottomNavigationBar : BottomNavigationBar(

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
