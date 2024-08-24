// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:smbt/core/error_handling/failure.dart';
import 'package:smbt/core/usecase/no_params.dart';

import 'package:smbt/features/product/domain/get_product_list_use_case.dart';
import 'package:smbt/features/product/domain/models/product_model.dart';
import 'package:smbt/features/product/presentation/bloc/status/product_list_status.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  int pageNumber = 0;
  int totalPage = 1;
  int pageSize = 30;
  CancelToken cancelToken = CancelToken();

  final List<ProductModel> _productList = [];
  final GetProductListUseCase _getProductListUseCase;
  ProductBloc(
    this._getProductListUseCase,
  ) : super(ProductState(productListStatus: ProductListInitial())) {
    on<PageToInitialProductListEvent>((event, emit) {
      pageNumber = 0;
      _productList.clear();
    });
    on<GetProductListEvent>((event, emit) async {
      if (pageNumber > 0) {
        emit(state.copyWith(newProductListStatus: ProductListLoadingMore()));
      } else {
        emit(state.copyWith(newProductListStatus: ProductListLoading()));
      }
      cancelToken.cancel(DioException.requestCancelled(
          requestOptions: RequestOptions(), reason: 'new request'));
      await cancelToken.whenCancel;
      if (cancelToken.isCancelled) {
        cancelToken = CancelToken();

        final result = await _getProductListUseCase(NoParams());

        result.fold((failure) {
          _handleFailureResponse(emit, failure);
        }, (success) {
          _handleSuccessResponse(success, emit);
        });
      }
    });
  }
  void _handleFailureResponse(Emitter<ProductState> emit, Failure failure) {
    emit(state.copyWith(
        newProductListStatus: ProductListError(failure: failure)));
  }

  void _handleSuccessResponse(
      List<ProductModel> success, Emitter<ProductState> emit) {
    if (success.isNotEmpty) {
      pageNumber++;
    }
    _productList.addAll(success);
    if (_productList.isEmpty) {
      emit(state.copyWith(newProductListStatus: ProductListEmpty()));
    } else {
      emit(state.copyWith(
        newProductListStatus: ProductListCompleted(list: _productList),
      ));
    }
  }
}
