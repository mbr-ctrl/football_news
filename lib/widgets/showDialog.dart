import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:football_news/services/firestore_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

/*
class ClubDialog{
  void showCarDialog(BuildContext context, ImageSource source) async {
    XFile? _pickedFile = await ImagePicker().pickImage(source: source);
    File _file = File(_pickedFile!.path);
    final _keyForm = GlobalKey<FormState>();
    String _clubName = '';
    String _clubCity = '';
    String _formError = 'Veillez fournir le nom de la voiture svp!';
    showDialog(
        context: context,
        builder: (BuildContext context) {
          final mobilHeight = MediaQuery.of(context).size.height * 0.25;
          final webHeight = MediaQuery.of(context).size.height * 0.5;
          return SimpleDialog(
            contentPadding: EdgeInsets.zero,
            children: [
              Container(
                height: mobilHeight,
                margin: EdgeInsets.all(8.0),
                color: Colors.grey,
                child: kIsWeb
                    ? Image(
                  image: NetworkImage(_file.path),
                  fit: BoxFit.cover,
                )
                    : Image(
                  image: FileImage(_file),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Form(
                      key: _keyForm,
                      child: TextFormField(
                        maxLength: 20,
                        onChanged: (value) => kIsWeb = value,
                        validator: (value) =>
                        _clubName == '' ? _formError : null,
                        decoration: const InputDecoration(
                          labelText: 'Nom du club',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Form(
                      key: _keyForm,
                      child: TextFormField(
                        maxLength: 20,
                        onChanged: (value) => kIsWeb = value,
                        validator: (value) =>
                        _clubCity == '' ? _formError : null,
                        decoration: const InputDecoration(
                          labelText: 'Ville du club',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Wrap(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('ANNULER'),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => onSubmit(context, _keyForm, _file,
                                _pickedFile, _clubName, _clubCity),
                            child: Text('PUBLIER'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        });
  }

  void onSubmit(context, keyForm, file, fileWeb, carName, user) async {
    if (keyForm.currentState!.validate()) {
      Navigator.of(context).pop();
      showNotification(context, "Chargement...");
      try {
        DatabaseService db = DatabaseService();
        String _carUrlImg = await db.uploadFile(file, fileWeb);
        db.addCar(
          Car(
              carName: carName,
              carUrlImg: _carUrlImg,
              carUserID: user!.uid,
              carUserName: user!.displayName),
        );
      } catch (error) {
        showNotification(context, "Erreur $error");
      }
    }
  }

} */
