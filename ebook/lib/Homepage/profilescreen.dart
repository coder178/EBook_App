import 'package:ebook/Homepage/Topbar.dart';
import 'package:ebook/Homepage/favourites.dart';
import 'package:flutter/material.dart';
class Profile extends StatefulWidget {

  @override
  // State<Profile> createState() => _ProfileState();
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Column(
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: LayoutBuilder(builder: (context,constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: SizedBox(
                      height: 120,
                      child: Image.asset(
                        "assets/images/logo.jpg",
                        fit: BoxFit.contain,),

                    ),

                  ),
                  
                  const SizedBox(
                    height: 10,

                  ),

                  Favourites(),


                ],

              );
            },),
        ),

      ],
    );
  }
}
