import 'package:dartz/dartz.dart';
import 'package:dashbord_fruit/Core/error/failure.dart';
import 'package:dashbord_fruit/Feature/ad_product/domain/Entity/product_entity.dart';

abstract class AddProductRepo {
  Future<Either<Failure, void>> addProduct(ProductEntity addProductEntity);
}
