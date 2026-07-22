import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class StorageClient {
  Future<String> uploadPhoto(File imageFile, String bucket) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://192.168.1.6:8000/storage/upload'),
    );
    request.fields['bucket'] = bucket;
    request.files.add(
      await http.MultipartFile.fromPath('file', imageFile.path),
    );
    var response = await request.send();
    final responseBody = await response.stream.bytesToString();
    final json = jsonDecode(responseBody);
    return json['url'];
  }
}
