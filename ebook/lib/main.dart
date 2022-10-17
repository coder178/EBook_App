import 'package:ebook/Admin/adminpage.dart';
import 'package:ebook/User/Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Homepage/Homepage.dart';


Future<void> main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "EBook",
      debugShowCheckedModeBanner: false,
      // home: adminpage(),
      home: LoginScreen(),
      // home: Homepage(),
    );
  }
}
