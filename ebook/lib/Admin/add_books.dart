import 'package:ebook/Homepage/Homepage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ebook/Admin/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddBookForm extends StatefulWidget {
  const AddBookForm({Key? key}) : super(key: key);

  @override
  State<AddBookForm> createState() => _AddBookFormState();
}

class _AddBookFormState extends State<AddBookForm> {
  final _formKey = GlobalKey<FormState>();
  CollectionReference _reference = FirebaseFirestore.instance.collection('Books');
  String imageUrl="";
  BookModel book = BookModel();
  final TextEditingController Title = new TextEditingController();
  final TextEditingController Author = new TextEditingController();
  final TextEditingController Description = new TextEditingController();
  final TextEditingController Category = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final titleField = TextFormField(
        autofocus: false,
        controller: Title,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Book title cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          Title.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.book_rounded),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Title of the Book",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));


    final authorField = TextFormField(
        autofocus: false,
        controller: Author,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Author name cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          Author.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Name of the Author",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));


    final descriptionField = TextFormField(
        autofocus: false,
        controller: Description,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please enter Description");
          }
          return null;
        },
        onSaved: (value) {
          Description.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.description),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Book Description",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final categoryField = TextFormField(
        autofocus: false,
        controller: Category,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please enter the category");
          }
        },
        onSaved: (value) {
          Category.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.category),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Book Category",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));


    final ImgButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child:IconButton(onPressed: ()async{
      ImagePicker imagePicker = ImagePicker();
      XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
      print('${file?.path}');

      if(file==null) return;
      String uniqueFileName =  DateTime.now().millisecondsSinceEpoch.toString();
      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child('images');
      Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);
      try {
        await referenceImageToUpload.putFile(File(file!.path));
        imageUrl = await referenceImageToUpload.getDownloadURL();
      }catch(error){

      }





      },icon: Icon(Icons.camera_alt),)
    );



    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () async{
            if(imageUrl!.isEmpty){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please Upload an image')));
              return;
            }
            if(_formKey.currentState!.validate()){
              book.title = Title.text;
              book.author = Author.text;
              book.description = Description.text;
              book.category = Category.text;
              book.imageUrl = imageUrl;
            }
            Map<String, dynamic> BookData = book.toMap();
            _reference.add(BookData);

            Navigator.push(context, MaterialPageRoute(builder: (context)=> Homepage()));

          },
          child: Text(
            "Add Book",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    titleField,
                    SizedBox(height: 30),
                    authorField,
                    SizedBox(height: 30),
                    descriptionField,
                    SizedBox(height: 30),
                    categoryField,
                    SizedBox(height: 30),
                    ImgButton,
                    SizedBox(height: 30),
                    signUpButton,
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}