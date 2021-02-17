import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore
import 'package:flutter/material.dart';

final _storage = FirebaseStorage.instance;

class FireStorageService extends ChangeNotifier {
  // ignore: unused_element
  FireStorageService._();
  FireStorageService();

  static Future<dynamic> loadFromStorage(BuildContext context, String image) {
    throw ("Platform not found");
  }

  static Future<dynamic> grilo(BuildContext context, String image) async {
    return await _storage.ref().child(image).getDownloadURL();
  }

  static Future<Widget> getImage(BuildContext context, String image) async {
    Image m;
    await FireStorageService.grilo(context, image).then((downloadUrl) {
      m = Image.network(
        downloadUrl.toString(),
        fit: BoxFit.cover,
      );
    });
    return m;
  }
}

// ignore: unused_element
