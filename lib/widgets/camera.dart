import 'dart:io';
import 'dart:async';

import 'package:uuid/uuid.dart';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

// TODO setup authentication for this
class CameraStorage extends StatelessWidget {
  Future<String> _openCamera() async {
    final File image = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );

    if (image != null) {
      final String path = await _uploadFile(image);
      print("FILEPATH: " + path);
      return path;
    }

    return null;
  }

  Future<String> _uploadFile(File image) async {
    final uuid = new Uuid();
    final String id = uuid.v4();
    StorageReference ref = FirebaseStorage.instance.ref().child(id);
    StorageUploadTask uploadTask = ref.putFile(image);

    return await (await uploadTask.onComplete).ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.asset('images/default.png',
          width: 300, height: 300, fit: BoxFit.contain),
      onTap: _openCamera,
    );
  }
}
