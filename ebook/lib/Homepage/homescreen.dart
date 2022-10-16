import 'package:ebook/Homepage/Action.dart';
import 'package:ebook/Homepage/Fiction.dart';
import 'package:ebook/Homepage/Quotes.dart';
import 'package:ebook/Homepage/Suspence.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  // const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            // TopbarHome(),
            Quotes(),
            SizedBox(height: size.height * 0.008,),
            // SearchBar(),
            SuspenceBooks(),
            // ContinueReading(),
            SizedBox(height: size.height * 0.006,),
            FictionBooks(),
            SizedBox(height: size.height * 0.006,),
            ActionBooks(),
            // BottomBar()
          ],
        ),
      ),
    );
  }
}
