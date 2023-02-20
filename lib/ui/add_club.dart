import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
class AddClub extends StatefulWidget {
  const AddClub({Key? key}) : super(key: key);

  @override
  State<AddClub> createState() => _AddClubState();
}

class _AddClubState extends State<AddClub> {
   final TextEditingController _nameController = TextEditingController();
   final TextEditingController _cityController = TextEditingController();

  // final _posterController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  var _image;
  String imageUrl = "";
  late final pickedFile;

  //var imgValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajout d'un Club"),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      body: Form(
        //padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(
                height: 150,
                width: 150,
                child: _image != null
                    ? Image.file(
                  _image,
                  width: 150.0,
                  height: 150.0,
                  fit: BoxFit.fitHeight,
                )
                    : const Center(
                        child: Text("Aucune image sélectionnée"),
                )
            ),

            TextFormField(

              controller: _nameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal,
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.orange,
                          width: 2
                      )
                  ),
                  labelText: "Nom ",
                  helperText: "Le champs ne doit pas etre vide"
              ),
            ),
            const SizedBox(height: 20),

            TextFormField(
              controller: _cityController,
              maxLines: 4,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.teal
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.orange,
                          width: 2
                      )
                  ),
                  labelText: "Ville du club",
                  helperText: "Ville du club"
              ),
            ),
            const SizedBox(height: 30,),
            ElevatedButton(
              onPressed: uploadImageToFirebase,
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 20.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  primary: Colors.purple),
              child: const Text(
                "Ajouter une image",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            // Spacing
            Container(height: 20.0),
            ElevatedButton(
              onPressed: () {
                print('chemin de image $imageUrl');
                FirebaseFirestore.instance.collection('club').add(
                    {
                      'nom': _nameController.value.text,
                      'ville': _cityController.value.text,
                      'logo': imageUrl
                    }
                );

              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 20.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  primary: Colors.purple),
              child: const Text(
                "Valider",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> chooseImage() async {
    pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }


  Future uploadImageToFirebase() async {
    chooseImage();

    String fileName = (_image!.path);

    FirebaseStorage firebaseStorageRef = FirebaseStorage.instance;

    Reference ref = firebaseStorageRef.ref().child(
        'upload/$fileName ${DateTime.now()}');

    UploadTask uploadTask = ref.putFile(_image!);
    uploadTask.whenComplete(() async {
      try {
        imageUrl = await ref.getDownloadURL();
      } catch (onError) {
        print("Error");
      }
      print(imageUrl);
    });
  }
}
