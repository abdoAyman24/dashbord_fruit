import 'package:dartz/dartz.dart';
import 'package:dashbord_fruit/Core/Repo/add_product_repo/add_product_repo.dart';
import 'package:dashbord_fruit/Core/error/failure.dart';
import 'package:dashbord_fruit/Core/utils/back_end_point.dart';
import 'package:dashbord_fruit/Feature/ad_product/data/Model/product_model.dart';
import 'package:dashbord_fruit/Feature/ad_product/domain/Entity/product_entity.dart';
import 'package:dashbord_fruit/Core/service/data_base_service.dart';

class AddProductRepoImpl implements AddProductRepo {
  final DataBaseService dataBaseService;

  AddProductRepoImpl({required this.dataBaseService});
  @override
  Future<Either<Failure, void>> addProduct(
    ProductEntity addProductEntity,
  ) async {
    try {
      await dataBaseService.addFileData(
        path: BackEndPoint.addProduct,
        data: AddProductModel.fromAddProductEntity(addProductEntity).toMap(),
        documntId: addProductEntity.productId,
      );
      return right(null);
    } catch (e) {
      return left(serverFailure(errorMessage: 'error when add product'));
    }
  }
}
