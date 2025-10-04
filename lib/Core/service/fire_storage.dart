import 'dart:io';

import 'package:dashbord_fruit/Core/service/storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as b;

class FireStorage implements StorageService {
  final storageRef = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = b.basename(file.path);
    String fileExtention = b.extension(file.path);
    final imagesRef = storageRef.child("$path$fileName.$fileExtention");
    await imagesRef.putFile(file);
    String url = await imagesRef.getDownloadURL();
    return url;
  }
}
