import 'package:bloc/bloc.dart';
import 'package:dashbord_fruit/Core/Repo/add_product_repo/add_product_repo.dart';
import 'package:dashbord_fruit/Core/Repo/image_repo/image_repo.dart';
import 'package:dashbord_fruit/Feature/ad_product/domain/Entity/product_entity.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.imageRepo, this.addProductRepo)
    : super(ProductCubitInitial());
  final ImageRepo imageRepo;
  final AddProductRepo addProductRepo;

  Future<void> addProduct(ProductEntity product) async {
    emit(ProductCubitLoad());
    var result = await imageRepo.uploadImage(product.productImage);

    result.fold(
      (f) {
        emit(ProductCubitFailuer(f.errorMessage));
      },
      (url) async {
        product.imageUrl = url;
        var result = await addProductRepo.addProduct(product);
        result.fold(
          (f) {
            emit(ProductCubitFailuer(f.errorMessage));
          },
          (l) {
            emit(ProductCubitSuccess());
          },
        );
      },
    );
  }
}
