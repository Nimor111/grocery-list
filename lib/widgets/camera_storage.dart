import 'dart:io';
import 'dart:async';

import 'package:uuid/uuid.dart';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:grocery_list/services/product_service.dart';

class CameraStorage extends StatefulWidget {
  CameraStorage({this.documentID, this.imageUrl, this.imageID});

  final String documentID;
  final String imageID;
  final String imageUrl;

  @override
  _CameraStorageState createState() => _CameraStorageState();
}

class _CameraStorageState extends State<CameraStorage> {
  String _imageUrl;

  @override
  void initState() {
    super.initState();
    if (widget.imageUrl == null && widget.imageID != null) {
      StorageReference ref =
          FirebaseStorage.instance.ref().child(widget.imageID);
      ref.getDownloadURL().then((url) {
        this.setState(() {
          _imageUrl = url;
        });
      });
    } else {
      this.setState(() {
        _imageUrl = widget.imageUrl;
      });
    }
  }

  Future<File> _openCamera() async {
    final File image = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );

    if (image != null) {
      final String id = await _uploadFile(image);
      await _saveProductImage(id);
    }

    return image;
  }

  Future<String> _uploadFile(File image) async {
    final Uuid uuid = new Uuid();
    final String id = uuid.v4();

    final StorageReference ref = FirebaseStorage.instance.ref().child(id);
    final StorageUploadTask uploadTask = ref.putFile(image);

    await uploadTask.onComplete;

    final url = await ref.getDownloadURL();
    this.setState(() {
      _imageUrl = url;
    });

    return id;
  }

  _saveProductImage(String imageID) async {
    final ProductService productService = ProductService();
    await productService.setProductImage(
        this.widget.documentID, imageID, _imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    final image = _imageUrl == null
        ? Image.asset('images/default.png')
        : Center(
            child: CachedNetworkImage(
              placeholder: (context, url) => new CircularProgressIndicator(),
              imageUrl: _imageUrl,
              width: 300,
              height: 300,
              fit: BoxFit.contain,
            ),
          );

    return GestureDetector(
      child: Center(
        child: image,
      ),
      onTap: _openCamera,
    );
  }
}
