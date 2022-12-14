import 'package:flutter/material.dart';

class BookDescriptionDetail extends StatelessWidget {
  final String bookname;
  final String author;
  final String description;
  final String image;
  final String category;

  const BookDescriptionDetail(
      {Key? key,
        required this.bookname,
        required this.author,
        required this.description,
        required this.image,
        required this.category,
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            padding: const EdgeInsets.only(right: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 130,
                      height: 220,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          // color: Colors.blue,
                        image:  DecorationImage(image: NetworkImage(image),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            bookname,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          author,
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            width: 200,
                            child: Row(
                              children: [
                                Container(
                                    width: 90,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.red),
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Text(
                                        category,
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Colors.red),
                                      ),
                                    )),
                                Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    width: 90,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.red),
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Literary',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Colors.red),
                                      ),
                                    ))
                              ],
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 200,
                          height: 37,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.download,
                                color: Colors.white,
                              ),
                              Text(
                                'Download Book',
                                style: TextStyle(
                                    fontFamily: 'Poppins', color: Colors.white),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Book Description',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ),
                const Divider(
                  height: 20,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(description,
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600)),

              ],
            )));
  }
}
