import 'package:ebook/User/Login.dart';
import 'package:flutter/material.dart';

import 'Homepage/Homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "EBook",
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
