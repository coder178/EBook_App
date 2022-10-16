import 'package:flutter/material.dart';
import '../models/data.dart';
class PopularBooks extends StatefulWidget {

  @override
  State<PopularBooks> createState() => _PopularBooksState();
}

class _PopularBooksState extends State<PopularBooks> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.33,
      // color: Colors.purple,
      child: LayoutBuilder(builder: (context,constraints){
        return Column(
          children: [
            Container(
              // color: Colors.red,
              height: constraints.maxHeight * 0.18,
              padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth *0.03),
              child: LayoutBuilder(builder: (context,constraints){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: constraints.maxHeight * 0.9,
                      width: constraints.maxWidth * 0.25,
                      color: Colors.white,
                      child: FittedBox(child: Text(
                        "Popular",
                        style: TextStyle(fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(66, 66, 66, 1)),
                      )),
                    ),
                    Container(
                      height: constraints.maxHeight * 0.6,
                      width: constraints.maxWidth * 0.19,
                      color: Colors.white,
                      child: FittedBox(child: Text(
                        "View all",
                        style: TextStyle(fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.5)),
                      )),
                    )
                  ],
                );
              }),
            ),
            Container(
              height: constraints.maxHeight * 0.815,
              // color: Colors.pink,
              child: LayoutBuilder(builder: (context,constraints){
                return ListView.builder(
                    itemCount: popular.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(constraints.maxHeight * 0.085),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        popular[index].imagePath
                                    )),
                                boxShadow: [BoxShadow(
                                    offset: Offset(4,2),
                                    blurRadius: 3,
                                    spreadRadius: 2,
                                    color: Colors.black.withOpacity(0.1)
                                )]
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 6),
                            height: constraints.maxHeight * 0.84,
                            width: constraints.maxWidth * 0.34,
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.01,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            height: constraints.maxHeight * 0.07,
                            width: constraints.maxWidth * 0.33,
                            // color: Colors.yellow,
                            child: Text(
                              popular[index].bookname,
                              style: TextStyle(fontWeight: FontWeight.w400),


                            ),
                          )
                        ],
                      );
                    });
              },),
            )
          ],
        );
      },),
    );
  }
}


