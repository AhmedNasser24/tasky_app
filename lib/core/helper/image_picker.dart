import 'dart:developer';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImageFromGallery() async {
  final ImagePicker picker = ImagePicker();
  // Pick an image
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  log("pick image success");
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



/*
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:points/core/api/dio_consumer.dart';
import 'package:points/core/api/end_points.dart';

class UploadImageRemoteDataSource {
  final DioConsumer dioConsumer;
  UploadImageRemoteDataSource(this.dioConsumer);

  Future<Map<String, dynamic>> uploadImage({required File image}) async {
    final fileName = image.path.split('/').last;

    // Create FormData with the correct field name matching Postman
    FormData fromData = FormData();
    fromData.files.add(
      MapEntry(
        'image',
        await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
          contentType:
              DioMediaType.parse("image/${image.path.split('.').last}"),
        ),
      ),
    );

    if (kDebugMode) {
      print('Uploading image with filename: $fileName');
    } // Debug log

    final response = await dioConsumer.post(
      path: EndPoints.uploadImage,
      body: fromData,
    );
    if (kDebugMode) {
      print('Upload response: $response');
    } // Debug log
    return response;
  }
}

 */