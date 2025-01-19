// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File?> pickImageFromGallery() async {
  final ImagePicker picker = ImagePicker();
  // Pick an image
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if (image != null) {
    return File(image.path);
  } else {
    return null;
  }
}

Future<File?> pickImageFromCamera() async {
  final ImagePicker picker = ImagePicker();
  // Pick an image
  final XFile? image = await picker.pickImage(source: ImageSource.camera);
  if (image != null) {
    return File(image.path);
  } else {
    return null;
  }
}
