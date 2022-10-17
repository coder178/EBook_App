import 'package:flutter/material.dart';

class BookModel{
  String? bid;
  String? title;
  String? author;
  String? description;
  String? category;
  String? imageUrl;

  BookModel({this.bid,this.title,this.author,this.description,this.category,this.imageUrl});

  factory BookModel.fromMap(map) {
    return BookModel(
      bid: map['bid'],
      title: map['title'],
      author: map['author'],
      description: map['description'],
      category: map['category'],
      imageUrl: map['imageUrl'],

    );
  }
  Map<String, dynamic> toMap() {
    return {
      'bid': bid,
      'title': title,
      'author': author,
      'description': description,
      'category': category,
      'imageUrl': imageUrl,
    };
  }
}