import 'package:smbt/core/error_handling/failure.dart';
import 'package:smbt/features/product/domain/models/product_model.dart';

abstract class ProductListStatus {}

class ProductListInitial extends ProductListStatus {}

class ProductListLoading extends ProductListStatus {}

class ProductListLoadingMore extends ProductListStatus {}

class ProductListEmpty extends ProductListStatus {}

class ProductListCompleted extends ProductListStatus {
  final List<ProductModel> list;

  ProductListCompleted({required this.list});
}

class ProductListError extends ProductListStatus {
  final Failure failure;
  ProductListError({
    required this.failure,
  });
}

class ProductListLoadedMoreError extends ProductListStatus {}
