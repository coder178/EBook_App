import 'package:ebook/Homepage/book_detail.dart';
import 'package:ebook/models/data.dart';
import 'package:flutter/material.dart';
class Detailscreen extends StatefulWidget {
  @required
  final Booksdata detail;
  const Detailscreen({Key? key, required this.detail}) : super(key: key);

  @override
  State<Detailscreen> createState() => _Detail_screenState(detail);
}

class _Detail_screenState extends State<Detailscreen> {
  bool _isPressed = true;

  final Booksdata detail;

  _Detail_screenState(this.detail);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _isPressed = !_isPressed;
                });
              },
              icon: (_isPressed == false)
                  ? const Icon(
                Icons.favorite,
                color: Colors.black,
                size: 30,
              )
                  : const Icon(
                Icons.favorite_outline,
                color: Colors.black,
                size: 30,
              ),
            ),
            const SizedBox(width: 10),


          ],
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              BookDescriptionDetail(
                  bookname: detail.bookname,
                  author: detail.authorName,
                  description: detail.description,
                  image: detail.imagePath)
            ],
          ),
        ));
  }
}
