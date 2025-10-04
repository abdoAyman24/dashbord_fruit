import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dashbord_fruit/Core/Repo/image_repo/image_repo.dart';
import 'package:dashbord_fruit/Core/error/failure.dart';
import 'package:dashbord_fruit/Core/utils/back_end_point.dart';
import 'package:dashbord_fruit/Core/service/storage_service.dart';

class ImageRepoImpl implements ImageRepo {
  final StorageService storageService;

  ImageRepoImpl({required this.storageService});
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url = await storageService.uploadFile(image, BackEndPoint.image);
      return right(url);
    } catch (e) {
      return left(serverFailure(errorMessage: 'error When uplod Image'));
    }
  }
}
