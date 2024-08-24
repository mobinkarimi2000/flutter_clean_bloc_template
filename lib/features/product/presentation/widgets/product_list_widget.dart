// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scroll_edge_listener/scroll_edge_listener.dart';

import 'package:smbt/core/utils/custom_colors.dart';
import 'package:smbt/core/widgets/custom_text_field.dart';
import 'package:smbt/core/widgets/error_handling/error_handling_factory_widget.dart';
import 'package:smbt/features/product/domain/models/product_model.dart';
import 'package:smbt/features/product/presentation/bloc/product_bloc.dart';
import 'package:smbt/features/product/presentation/bloc/status/product_list_status.dart';
import 'package:smbt/features/product/presentation/widgets/empty_data_product_list_widget.dart';
import 'package:smbt/features/product/presentation/widgets/loading_product_card.dart';
import 'package:smbt/features/product/presentation/widgets/product_card.dart';

class ProductListWidget extends StatefulWidget {
  const ProductListWidget({
    super.key,
    required this.type,
  });
  final int type;
  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  late ProductBloc productBloc;

  List<ProductModel> list = [];
  @override
  void initState() {
    super.initState();
    onWidgetCreated(context);
  }

  void onWidgetCreated(BuildContext context) {
    productBloc = BlocProvider.of<ProductBloc>(context);

    SchedulerBinding.instance.addPostFrameCallback((_) {
      refreshScreen();
    });
  }

  void refreshScreen() {
    callInitialEvent();
    callLoadEvent();
  }

  void callLoadEvent() {
    productBloc.add(GetProductListEvent());
  }

  void callInitialEvent() {
    productBloc.add(PageToInitialProductListEvent());
  }

  @override
  Widget build(BuildContext context) {
    Widget widget = Container();

    final appLocalizations = AppLocalizations.of(context);

    return Column(
      children: [
        createSearchField(appLocalizations!, context),
        createList(widget),
      ],
    );
  }

  Padding createSearchField(
      AppLocalizations myAppLocalization, BuildContext ctx) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: CustomTextFormField(
          hintText: myAppLocalization.search,
          borderRadius: 10,
          themeColor: CustomColor.red.withOpacity(0.5),
          backgroundColor: CustomColor.gray_light_medium,
          mainText: '',
          onChange: (value) {},
          validator: (value) {},
          obscureText: false),
    );
  }

  Expanded createList(Widget widget) {
    return Expanded(
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          bool isLoadingMore = false;
          if (state.productListStatus is ProductListLoading) {
            widget = _createLoadingWidget();
          } else if (state.productListStatus is ProductListEmpty) {
            widget = EmptyDataProductListWidget(
              onClickListener: () {
                refreshScreen();
              },
            );
          } else if (state.productListStatus is ProductListCompleted) {
            final ProductListCompleted completed =
                state.productListStatus as ProductListCompleted;
            list = completed.list;
            widget = _createLoadedWidget(list, false);
          } else if (state.productListStatus is ProductListLoadingMore) {
            widget = _createLoadedWidget(list, false);
            isLoadingMore = true;
          } else if (state.productListStatus is ProductListLoadedMoreError) {
            widget = _createLoadedWidget(list, false);
          } else if (state.productListStatus is ProductListError) {
            ProductListError followingListError =
                state.productListStatus as ProductListError;
            widget = _createErrorWidget(followingListError);
          }
          // widget = _createLoadingWidget();

          return Column(
            children: [
              Expanded(child: widget),
              Visibility(
                visible: isLoadingMore,
                child: _createLoadMoreIndicator(),
              ),
            ],
          );
        },
      ),
    );
  }

  ErrorHandlingWidget _createErrorWidget(ProductListError listError) {
    return ErrorHandlingWidget(
      listError.failure,
      onClickListener: () {
        refreshScreen();
      },
    );
  }

  _createLoadingWidget() => ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                top: 10, bottom: index == list.length - 1 ? 50 : 10),
            child: LoadingProductCard(index: index + 1),
          );
        },
      );

  Widget _createLoadedWidget(List<ProductModel> list, bool isLoading) {
    return ScrollEdgeListener(
      edge: ScrollEdge.end,
      edgeOffset: 30,
      continuous: false,
      debounce: const Duration(milliseconds: 500),
      dispatch: true,
      listener: () {
        if (isLoading) {
          return;
        }
        callLoadEvent();
      },
      child: RefreshIndicator(
        onRefresh: () async {
          refreshScreen();
        },
        backgroundColor: CustomColor.white,
        color: CustomColor.red,
        child: ListView.separated(
          itemCount: list.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  EdgeInsets.only(bottom: index == list.length - 1 ? 50 : 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: ProductCard(
                    productModel: list[index],
                    index: index + 1,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 20);
          },
        ),
      ),
    );
  }

  _createLoadMoreIndicator() {
    return const CircularProgressIndicator(
      color: CustomColor.green,
    );
  }
}
