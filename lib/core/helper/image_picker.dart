import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasky_app/core/errors/failure.dart';
import 'package:tasky_app/core/helper/api_keys.dart';
import 'package:tasky_app/core/utils/shared_preference_singleton.dart';

Future<File?> pickImageFromGallery() async {
  final ImagePicker picker = ImagePicker();
  // Pick an image
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if (image != null) {
    await uploadImage(File(image.path));
    return File(image.path);
  } else {
    return null;
  }
}

Future<void> uploadImage(File imageFile) async {
  try {
    final Dio dio = Dio();

    // Prepare the form data
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(
        imageFile.path,
        filename: imageFile.path.split('/').last,
      ),
    });

    // Send the POST request
    Response response = await dio.post(
      "https://todo.iraqsapp.com/upload/image",
      data: formData,
      options: Options(
        contentType: "multipart/form-data",
        headers: {
          'Authorization':
              'Bearer ${SharedPreferenceSingleton.getString(ApiKeys.accessToken)}',
        },
      ),
    );

    // Log the response
    log("Response status: ${response.statusCode}");
    log("Response data: ${response.data}");
  } on DioException catch (e) {
    log(ServerFailure.fromDioException(e).errMessage);
  } catch (e) {
    log("Error uploading image: $e");
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
