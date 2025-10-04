import 'dart:io';
import 'package:path/path.dart' as b;
import 'package:dashbord_fruit/Core/service/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorgaeService implements StorageService {
  // static createABucket(String bucket) async {

  // Supabase _supabase =Supabase.instance.client.
  // static initSupbase() async {
  //   supabase = await Supabase.initialize(
  //     url: 'https://cdlkapflfgwkzlewxbgi.supabase.co',
  //     anonKey:
  //         'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNkbGthcGZsZmd3a3psZXd4YmdpIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc1ODgwOTgxMywiZXhwIjoyMDc0Mzg1ODEzfQ.fMBvfkroTtdx4vzglCGl7e-4Oak7BvrJJat21Ljc-v0',
  //   );
  // }

  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = b.basename(file.path);
    String fileExtention = b.extension(file.path);

    await Supabase.instance.client.storage
        .from('fruit_images')
        .upload('$path/$fileName$fileExtention', file);
    final String publicUrl = Supabase.instance.client.storage
        .from('fruit_images')
        .getPublicUrl('$path/$fileName$fileExtention');
    return publicUrl;
  }
}
