import 'package:smbt/core/utils/mock_models.dart';
import 'package:smbt/features/product/data/datasources/network/abstraction/product_data_source.dart';
import 'package:smbt/features/product/domain/models/product_model.dart';

class ProductDataSourceImpl extends ProductDataSource {
  @override
  Future<List<ProductModel>> getProductList() async {
    await Future.delayed(const Duration(seconds: 1));
    return MockModels.productList;
  }
}
