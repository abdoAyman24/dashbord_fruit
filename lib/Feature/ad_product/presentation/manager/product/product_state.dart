part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductCubitInitial extends ProductState {}

final class ProductCubitLoad extends ProductState {}

final class ProductCubitFailuer extends ProductState {
  final String errorMeassage;

  ProductCubitFailuer(this.errorMeassage);
}

final class ProductCubitSuccess extends ProductState {}
