import 'package:ebook/Homepage/ContinueReading.dart';
import 'package:ebook/Homepage/PopularBooks.dart';
import 'package:ebook/Homepage/Quotes.dart';
import 'package:ebook/Homepage/Searchbar.dart';
import 'package:ebook/Homepage/Topbar.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
             TopbarHome(),
              Quotes(),
              SizedBox(height: size.height * 0.006,),
              SearchBar(),
              SizedBox(height: size.height * 0.006,),
              ContinueReading(),
              PopularBooks()
            ],
          ),
        ),
      ),

    );
  }
}
