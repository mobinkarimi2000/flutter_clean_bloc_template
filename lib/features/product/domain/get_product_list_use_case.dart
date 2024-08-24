import 'package:dartz/dartz.dart';
import 'package:smbt/core/error_handling/failure.dart';
import 'package:smbt/core/usecase/no_params.dart';
import 'package:smbt/core/usecase/use_case.dart';
import 'package:smbt/features/product/domain/models/product_model.dart';
import 'package:smbt/features/product/domain/repositories/product_repository.dart';

class GetProductListUseCase
    extends UseCase<Either<Failure, List<ProductModel>>, NoParams> {
  final ProductRepository _productRepository;

  GetProductListUseCase(this._productRepository);
  @override
  Future<Either<Failure, List<ProductModel>>> call(NoParams input) {
    return _productRepository.getProductList();
  }
}
