abstract class DataBaseService {
  Future<void> addFileData({
    required String path,
    required Map<String, dynamic> data,
    required String? documntId,
  });
  Future<Map<String, dynamic>> getData({
    required String path,
    required String documntId,
  });
  Future<bool> checkIfFileExist({
    required String path,
    required String document,
  });
}
