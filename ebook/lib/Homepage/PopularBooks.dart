import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Homepage/detail_screen.dart';
import 'package:ebook/models/data.dart';
import 'package:flutter/material.dart';

import '../Admin/book_model.dart';


class PopularBooks extends StatefulWidget {
  // PopularBooks({Key? key}) : super(key: key);
  // final Booksdata detail;
  CollectionReference _reference = FirebaseFirestore.instance.collection('Books');
  late Stream<QuerySnapshot> _stream =_reference.snapshots();

  @override
  State<PopularBooks> createState() => _PopularBooksState();
}

class _PopularBooksState extends State<PopularBooks> {
  // _PopularBooksState(Booksdata detail);

 
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.only(left: 15, top: 20),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Popular',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )),
        //load info book
        const SizedBox(
          height: 10,
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
                padding: const EdgeInsets.only(left: 20),
                height: 550,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: items.length,
                  itemBuilder: (context, i) => RecentUpdate(
                    detail: items[i],
                  ),
                ),
              );

            }

            //Show loader
            return Center(child: CircularProgressIndicator());
          },
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );


  }
}
class RecentUpdate extends StatelessWidget {
  const RecentUpdate({Key? key, required this.detail}) : super(key: key);
  final Map detail;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Detailscreen(detail: detail),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag:0,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Container(
                      height: 180,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image:  DecorationImage(image: NetworkImage(detail['imageUrl']),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //text
                      SizedBox(
                        width: 180,
                        child: Text(
                          detail['title'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      //authors
                      SizedBox(
                        width: 150,
                        height: 30,
                        child: Text(
                          detail['author'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.blueAccent),
                        ),
                      ),
                      //decription
                      SizedBox(
                        width: 150,
                        height: 80,
                        child: Text(
                          detail['description'],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


