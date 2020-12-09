import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart' as Path;
import 'dart:io';

class Storage {
  firebase_storage.FirebaseStorage _storage =
      firebase_storage.FirebaseStorage.instance;

  Future<String> getImage(fileName) async {
    try {
      String downloadimageURL;

      downloadimageURL =
          await _storage.ref('images/$fileName.png').getDownloadURL();
      print('ddd');
      print(downloadimageURL);
      print('ddd');

      return (downloadimageURL);
    } on firebase_core.FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
      print('ddfdq');
      print(e);
      print('ddfdq');
    }
  }

  Future uploadImage(File file, String fileName) async {
    // remember to compress these images when uploading to save storage quota  approx 1.4MB without compression

    try {
      await _storage.ref('images/$fileName.png').putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
      print(e);
      print("exceptionx");
    }
  }
}
