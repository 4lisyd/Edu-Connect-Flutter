import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart' as Path;
import 'dart:io';

class Storage {
  firebase_storage.FirebaseStorage _storage;
  String imageURLtemp;

  Storage() {
    this._storage = firebase_storage.FirebaseStorage.instance;
    print('storage created');
  }

  // Future<List<String>> getAllPossibleLocations() async {
  //   try {
  //     List<String> location_list = (await _storage
  //         .ref('locations/qatar/location')
  //         .getData()) as List<String>;
  //     return location_list;
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<String> getImage(fileName) async {
    try {
      print(fileName);
      String downloadimageURL;
      downloadimageURL = await _storage
          .ref('images/profileimages/$fileName.png')
          .getDownloadURL();
      // print("downURL");
      // print(downloadimageURL);
      // print("downURL");
      return (downloadimageURL);
    } on firebase_core.FirebaseException catch (e) {
      // e.g, e.code == 'canceled
      print(e);
    }
  }

  String getImageCached(fileName) {
    try {
      print(fileName);

      String downloadimageURL;
      Future<String> getimagesync() async {
        imageURLtemp = await _storage
            .ref('images/profileimages/$fileName.png')
            .getDownloadURL();

        // DataRequiredForimage.imagesPath = downloadimageURL;
      }

      getimagesync();
      return imageURLtemp;
      // return "downloadimageURL";
    } on firebase_core.FirebaseException catch (e) {
      // e.g, e.code == 'canceled
      print(e);
    }
  }

  Future uploadImage(File file, String fileName) async {
    // remember to compress these images when uploading to save storage quota  approx 1.4MB without compression

    try {
      await _storage.ref('images/profileimages/$fileName.png').putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      // e.g, e.code == 'canceled'

      print(e);
    }
  }
}
