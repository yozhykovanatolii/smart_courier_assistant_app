import 'dart:io';
import 'package:dio/dio.dart';

class StorageClient {
  final Dio _dio;

  StorageClient(this._dio);

  Future<String> uploadPhoto(File imageFile, String bucket) async {
    final formData = FormData.fromMap({
      'bucket': bucket,
      'file': await MultipartFile.fromFile(
        imageFile.path,
        contentType: DioMediaType('image', 'jpeg'),
      ),
    });
    final response = await _dio.post(
      '/storage/upload',
      data: formData,
    );
    return response.data['url'];
  }
}
