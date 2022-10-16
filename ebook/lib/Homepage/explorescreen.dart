import 'package:ebook/Homepage/PopularBooks.dart';
import 'package:ebook/Homepage/Searchbar.dart';
import 'package:flutter/material.dart';
class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.006,),
            SearchBar(),
            SizedBox(height: size.height * 0.006,),
            PopularBooks(),
            SizedBox(height: size.height * 0.008,),



            // BottomBar()
          ],
        ),
      ),
    );;
  }
}
