
import 'dart:io';

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_core/firebase_core.dart";
import 'package:flutter/cupertino.dart';
import 'package:football_news/models/model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

final CollectionReference _club = FirebaseFirestore.instance.collection("club");
class ApiConnect {
  final CollectionReference player = FirebaseFirestore.instance
      .collection("players");

  Stream<QuerySnapshot> getPlayersByclub(String clubID){
    CollectionReference players = _club.doc(clubID).collection("joueurs");
    return players.snapshots();
  }

  Future<Response> addPlayer({
    required String firstName,
    required String lastName,
    required String position,
    required String imgUrl,
    required int age

}) async {
    Response response = Response();
    DocumentReference ref = player.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "firstName": firstName,
      "lastName": lastName,
      "position": position,
      "image": imgUrl,
      "age": age
    };
    var result = await ref.set(data).whenComplete(
            () {
              response.code = 200;
              response.message = "Opération réussie";
            }).catchError((e){
              response.code = 500;
              response.message = "Echec de l'opération";
    });
    return response;
  }

  Stream<QuerySnapshot> listPlayers(){
    CollectionReference players = player;
    return players.snapshots();
  }

  Future<Response> updatePLayer({
    required String docId,
    required String firstName,
    required String lastName,
    required String position,
    required String imgUrl,
    required int age
}) async {
    Response response = Response();
    DocumentReference ref = player.doc(docId);

    Map<String, dynamic> data = <String, dynamic> {
      "firstName": firstName,
      "lastName": lastName,
      "position": position,
      "image": imgUrl,
      "age": age
    };
    await ref.update(data).whenComplete((){
      response.code = 200;
      response.message = "Opération réussie";
    }).catchError((e){
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  Future<Response> deletePlayer({
    required String docId
}) async {
    Response response = Response();
    DocumentReference ref = player.doc(docId);

    await ref.delete().whenComplete((){
      response.code = 200;
      response.message = "Succes de l'opération";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });
    return response;
  }
  static Stream<QuerySnapshot> getData() {
    CollectionReference clubsItem = _club;
    return clubsItem.snapshots();
  }

  Future<String> uploadImage(String imgDir) async{
    String imageUrl = "";
    String uniqueFileName = DateTime.now() as String;
    ImagePicker _picker = ImagePicker();
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      return "";
    }
    Reference refRoot = FirebaseStorage.instance.ref();
    Reference refDir = refRoot.child(imgDir);
    // Create reference for the Image to store
    Reference refImageUpload = refDir.child(uniqueFileName);
    try{
      await refImageUpload.putFile(File(pickedFile!.path));
      imageUrl = refImageUpload.getDownloadURL() as String;
      return imageUrl;
    }catch(e) {
        print("Fail");
    }
    return imageUrl;

  }

}

