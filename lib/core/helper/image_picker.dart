import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tasky_app/core/services/auth_services.dart';
import 'package:tasky_app/core/services/data_service.dart';
import 'package:tasky_app/core/utils/get_it_setup.dart';
import 'package:tasky_app/feature/create_task/data/repo/create_task_repo_impl.dart';

Future<File?> pickImageFromGallery() async {
  final ImagePicker picker = ImagePicker();
  // Pick an image
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if (image != null) {
    await CreateTaskRepoImpl(dataService: getIt.get<DataService>(), authServices: getIt.get<AuthServices>()).uploadImage(image: File(image.path));
    return File(image.path);
  } else {
    return null;
  }
}

// Future<void> uploadImage(File imageFile) async {
//   try {
//     final Dio dio = Dio();

//     // Prepare the form data
    

//     // Log the response
//     log("Response status: ${response.statusCode}");
//     log("Response data: ${response.data}");
//   } on DioException catch (e) {
//     log(ServerFailure.fromDioException(e).errMessage);
//   } catch (e) {
//     log("Error uploading image: $e");
//   }
// }

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