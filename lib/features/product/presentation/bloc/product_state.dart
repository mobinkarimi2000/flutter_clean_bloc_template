part of 'product_bloc.dart';

class ProductState {
  final ProductListStatus productListStatus;

  ProductState({required this.productListStatus});

  ProductState copyWith({ProductListStatus? newProductListStatus}) {
    return ProductState(
        productListStatus: newProductListStatus ?? productListStatus);
  }
}
