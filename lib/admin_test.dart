import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  String imgpath = "";
  late File imgFile;
  late String imgFileName;
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final picker = ImagePicker();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController1.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('eScoreZ Admin'),
          centerTitle: true,
        ),
        body: Column(children: [
          Container(),
          Form(
            // key: _formKey,
            child: Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      getImage();
                    },
                    child: imgpath != ""
                        ? Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Image.file(File(imgpath)),
                          )
                        : Container(
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            height: 130,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6)),
                            width: MediaQuery.of(context).size.width,
                            child: Icon(
                              Icons.add_a_photo,
                              color: Colors.black45,
                            ),
                          ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    // color: Colors.grey[850],
                    child: TextFormField(
                      controller: myController1,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 40.0, horizontal: 150.0),
                          filled: true,
                          fillColor: Colors.grey[850],
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide:
                                const BorderSide(color: Colors.purpleAccent),
                          ),
                          labelText: 'Title',
                          labelStyle: TextStyle(
                            fontFamily: 'nunito',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide:
                                  BorderSide(color: Colors.purpleAccent))),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    // color: Colors.grey[850],
                    child: TextFormField(
                      controller: myController2,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 70.0, horizontal: 100.0),
                          filled: true,
                          fillColor: Colors.grey[850],
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide:
                                const BorderSide(color: Colors.purpleAccent),
                          ),
                          labelText: 'Description',
                          labelStyle: TextStyle(
                            fontFamily: 'nunito',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40.0)),
                              borderSide:
                                  BorderSide(color: Colors.purpleAccent))),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.all(5.0),
              child: ElevatedButton(
                child: Text('Add Post'),
                onPressed: () {
                  uploadNews();
                },
                style: ElevatedButton.styleFrom(primary: Color(0xff0ef5e3)),
              )),
        ]));
  }

  getImage() async {
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imgpath = pickedFile.path;
      });
    }
  }

  uploadNews() async {
    if (imgpath != "") {
      File file = File(imgpath);
      imgFileName =
          myController1.text + DateTime.now().millisecondsSinceEpoch.toString();
      Reference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child("newsimages")
          .child(
              imgFileName); //await FirebaseStorage.instance.ref().putFile(file);
      final UploadTask task = firebaseStorageRef.putFile(file);

      var downloadUrl = await (await task).ref.getDownloadURL();

      FirebaseFirestore.instance.collection("newsdetails").add({
        "title": myController1.text,
        "description": myController2.text,
        "imgurl": downloadUrl,
        "date": DateTime.now(),
        //"Source":
        "LikeIDs": [],
        "SavedIDs": [],
      });
    }
  }
}
