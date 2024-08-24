import 'package:smbt/features/product/domain/models/product_model.dart';

abstract class ProductDataSource {
  Future<List<ProductModel>> getProductList();
}
