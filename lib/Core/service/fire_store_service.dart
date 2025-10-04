import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashbord_fruit/Core/service/data_base_service.dart';

class FireStoreService implements DataBaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addFileData({
    required String path,
    required Map<String, dynamic> data,
    required String? documntId,
  }) async {
    if (documntId != null) {
      await firestore.collection(path).doc(documntId).set(data);
    } else {
      firestore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String documntId,
  }) async {
    var data = await firestore.collection(path).doc(documntId).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> checkIfFileExist({
    required String path,
    required String document,
  }) async {
    var user = await firestore.collection(path).doc(document).get();
    return user.exists;
  }
}
