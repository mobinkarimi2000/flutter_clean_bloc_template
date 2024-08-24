import 'package:dartz/dartz.dart';
import 'package:smbt/core/error_handling/failure.dart';
import 'package:smbt/features/product/domain/models/product_model.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductModel>>> getProductList();
}
