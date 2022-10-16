import 'package:flutter/material.dart';

class Quotes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return      Container(
      // color: Colors.purple,
      height: size.height * 0.1,
      child: LayoutBuilder(builder: (context,constraints){
        return Column(
          children: [
            Container(
              // color: Colors.pink,
              height: constraints.maxHeight * 0.72,
              width: constraints.maxWidth,
              child: Center(
                child: Text(
                  "asdfhjwertyuzxcg adsfdgfhgjb astdyfgub asdg asdtfh asdbfgasdhf",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color:Colors.brown.withOpacity(0.7)
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: constraints.maxHeight * 0.275,
              width: constraints.maxWidth * 0.8 ,
              child: FittedBox(
                child: Text(
                  "~ author sdfhwer",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w300,
                      fontSize: 10,
                      color: Color.fromRGBO(44, 44 , 44, 1)
                  ),
                ),
              ),
            ),
          ],
        );
      },),
    );
  }
}
