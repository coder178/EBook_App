import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Homepage/detail_screen.dart';
import 'package:flutter/material.dart';

import '../Admin/book_model.dart';
import '../models/data.dart';
class SuspenceBooks extends StatefulWidget {
  // const SuspenceBooks({Key? key}) : super(key: key);
  var _reference = FirebaseFirestore.instance.collection('Books').where('category',isEqualTo: 'Fiction');
  late Stream<QuerySnapshot> _stream =_reference.snapshots();

  @override
  State<SuspenceBooks> createState() => _SuspenceBooksState();
}

class _SuspenceBooksState extends State<SuspenceBooks> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(

      height: size.height * 0.28,
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
                      width: constraints.maxWidth * 0.4,
                      color: Colors.white,
                      child: FittedBox(child: Text(
                        "Suspence Books",
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
            StreamBuilder<QuerySnapshot>(
              stream: widget._stream,
              builder: (BuildContext context,AsyncSnapshot snapshot){
                if (snapshot.hasError) {
                  return Center(child: Text('Some error occurred ${snapshot.error}'));
                }
                if (snapshot.hasData) {
                  //get the data
                  QuerySnapshot querySnapshot = snapshot.data;
                  List<QueryDocumentSnapshot> documents = querySnapshot.docs;

                  //Convert the documents to Maps
                  List<Map> items = documents.map((e) => e.data() as Map).toList();
                  // Map thisItem = items[0];
                  return Container(
                    height: constraints.maxHeight * 0.815,
                    // color: Colors.pink,
                    child: LayoutBuilder(builder: (context,constraints){
                      return ListView.builder(
                        itemCount: items.length,
                        scrollDirection: Axis.horizontal,

                        itemBuilder: (context, i)=> RecentUpdate(
                          detail: items[i],
                        ),
                      );
                    },),
                  );

                }

                //Show loader
                return Center(child: CircularProgressIndicator());
              },
            ),

            // SizedBox(height: size.height * 0.0006,),

          ],
        );
      },),
    );
  }
}
class RecentUpdate extends StatelessWidget {
  const RecentUpdate({Key? key, required this.detail}) : super(key: key);

  final Map detail;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context,
        MaterialPageRoute(
          builder:(context)=> Detailscreen(detail: detail),
        ),
      ),
      child: Column(
        children: [
          Container(
            // child: Image.network(detail['imageUrl']),

            decoration: BoxDecoration(
                image:  DecorationImage(image: NetworkImage(detail['imageUrl']),
                fit: BoxFit.cover),
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),

                boxShadow: [BoxShadow(
                    offset: Offset(4,2),
                    blurRadius: 3,
                    spreadRadius: 2,
                    color: Colors.black.withOpacity(0.1)
                )]
            ),
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 150,
            width: 110,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0.8),
            height: 20,
            width: 100,
            // color: Colors.yellow,
            child: Text(
              detail['title'],
              style: TextStyle(fontWeight: FontWeight.w400),


            ),
          )
        ],
      ),
    );
  }
}
