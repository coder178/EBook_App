import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;


    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(size.height * 0.05),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),

        height: size.height * 0.07,
        width: size.width * 0.9,
        decoration: BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.circular(size.height * 0.05)
        ),
        child: LayoutBuilder(builder: (context,constraints){
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.white,
                height: constraints.maxHeight * 0.55,
                width: constraints.maxWidth * 0.15,
                child: FittedBox(
                  child: Icon(
                    Icons.search,
                    color: Color.fromRGBO(44, 44, 44, 1).withOpacity(0.7),
                  ),),
              ),
              Container(

                height: constraints.maxHeight ,
                width: constraints.maxWidth * 0.7,
                child: TextField(
                  decoration: InputDecoration(

                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    filled: false,
                    hintText: "Search by title",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 15,
                    color: Colors.black.withOpacity(0.4),
                    )

                  ),
                  cursorColor: Colors.black45,
                ),
              ),
              Container(
                color: Colors.white,
                height: constraints.maxHeight * 0.65,
                width: constraints.maxWidth * 0.15,
                child: FittedBox(
                  child: Icon(
                    Icons.filter_list,
                    color: Color.fromRGBO(44, 44, 44, 1),
                  ),),
              )
            ],
          );
        },),
      ),
    );
  }
}
