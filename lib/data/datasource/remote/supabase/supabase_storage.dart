import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorage {
  final supabaseClient = Supabase.instance.client;

  Future<String> saveImage(File imageFile, String bucket) async {
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    await supabaseClient.storage.from(bucket).upload(fileName, imageFile);
    final imageUrl = supabaseClient.storage.from(bucket).getPublicUrl(fileName);
    return imageUrl;
  }
}
