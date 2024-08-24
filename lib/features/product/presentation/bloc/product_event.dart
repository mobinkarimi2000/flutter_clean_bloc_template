part of 'product_bloc.dart';

abstract class ProductEvent {}

class GetProductListEvent extends ProductEvent {}

class PageToInitialProductListEvent extends ProductEvent {}
