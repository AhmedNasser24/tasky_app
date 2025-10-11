import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasky_app/core/utils/app_color.dart';

class ImageServices {
  static Future<File?> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      if (Platform.isAndroid || Platform.isIOS) {
        File? croppedFile = await cropImage(File(image.path));
        return croppedFile ?? File(image.path);
      } else {
        return File(image.path);
      }
    } else {
      return null;
    }
  }

  static Future<File?> pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      return File(image.path);
    } else {
      return null;
    }
  }

  static Future<File?> cropImage(File imageFile) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      uiSettings: [
        AndroidUiSettings(

          toolbarTitle: 'Image Cropper',
          toolbarColor: AppColor.primaryColor,
          toolbarWidgetColor: Colors.white,
          hideBottomControls: true,
          initAspectRatio: CropAspectRatioPreset.square,
          // cropStyle: CropStyle.values[],
          showCropGrid: false,
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPresetCustom(),
          ],
        ),
        IOSUiSettings(
          title: 'Image Cropper',
          minimumAspectRatio: 1,
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPresetCustom(), // IMPORTANT: iOS supports only one custom aspect ratio in preset list
          ],
        ),
        // WebUiSettings(
        //   context: navigatorKey.currentContext!,

        // ),
      ],
    );

    if (croppedFile != null) {
      return File(croppedFile.path);
    } else {
      return null;
    }
  }
}

class CropAspectRatioPresetCustom implements CropAspectRatioPresetData {
  @override
  (int, int)? get data => (2, 3);

  @override
  String get name => '2x3 (customized)';
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