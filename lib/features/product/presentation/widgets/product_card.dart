// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smbt/core/utils/custom_colors.dart';
import 'package:smbt/features/product/domain/models/product_model.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.productModel,
    required this.index,
  });
  final ProductModel productModel;
  final int index;
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        color: CustomColor.gray_light_medium,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                createImage(),
                const SizedBox(width: 20),
                createInfo(),
                createIndex()
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 2,
            color: CustomColor.gray_medium,
          ),
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    '${appLocalizations.qty} : ${widget.productModel.quantity}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: CustomColor.gray_darker,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                width: 1,
                height: 40,
                color: CustomColor.gray_medium,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    '${appLocalizations.price} : ${widget.productModel.price} \$',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: CustomColor.gray_darker,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container createIndex() {
    return Container(
      width: 50,
      height: 40,
      decoration: BoxDecoration(
          color: CustomColor.white,
          border: Border.all(width: 1, color: CustomColor.gray_medium),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          widget.index.toString(),
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: CustomColor.gray_medium_dark,
              fontSize: 22),
        ),
      ),
    );
  }

  Expanded createInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.productModel.name!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: CustomColor.gray_darker,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            widget.productModel.description! + widget.productModel.description!,
            style: const TextStyle(
              color: CustomColor.gray_dark,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Container createImage() {
    return Container(
      height: 80,
      width: 80,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: FittedBox(
        fit: BoxFit.cover,
        child: FullScreenWidget(
          disposeLevel: DisposeLevel.Medium,
          child: CachedNetworkImage(
            imageUrl: widget.productModel.imageUrl ?? '',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
