import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      // color: Colors.red,
      height: size.height * 0.15,
      child: LayoutBuilder(builder: (context,constraints){
        return Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: constraints.maxHeight*0.55,
              width: constraints.maxHeight* 0.30,
              color: Colors.white,
              child: FittedBox(child : Icon(Icons.home_outlined)),
            ),
            SizedBox(width: constraints.maxWidth * 0.05,),
            Container(
              height: constraints.maxHeight*0.55,
              width: constraints.maxHeight* 0.30,
              color: Colors.white,
              child: FittedBox(child : Icon(Icons.explore_outlined)),
            ),
            SizedBox(width: constraints.maxWidth * 0.05,),
            Container(
              height: constraints.maxHeight*0.55,
              width: constraints.maxHeight* 0.30,
              color: Colors.white,
              child: FittedBox(child : Icon(Icons.person_outline)),
            ),



          ],
        );
      },),
    );
  }
}
