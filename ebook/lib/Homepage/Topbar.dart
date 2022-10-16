import 'package:flutter/material.dart';


class TopbarHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Container(
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
                    "Hello Drashti",
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
    );
  }
}
