import 'package:dartz/dartz.dart';
import 'package:smbt/core/error_handling/custom_exception.dart';
import 'package:smbt/core/error_handling/failure.dart';
import 'package:smbt/core/utils/utils.dart';
import 'package:smbt/features/product/data/datasources/network/abstraction/product_data_source.dart';
import 'package:smbt/features/product/domain/models/product_model.dart';
import 'package:smbt/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductDataSource _productDataSource;

  ProductRepositoryImpl(this._productDataSource);
  @override
  Future<Either<Failure, List<ProductModel>>> getProductList() async {
    try {
      final list = await _productDataSource.getProductList();

      return right(list);
    } on NoInternetConnectionException {
      return left(NoInternetConnectionFailure());
    } on BadRequestException catch (e) {
      return left(
          BadRequestFailure(errorCode: e.errorCode, message: e.errorMessage));
    } on RestApiException catch (e) {
      return left(Utils.handleRestApiException(e));
    } catch (e) {
      return left(Utils.handleUnknownException(e));
    }
  }
}
