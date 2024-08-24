// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingProductCard extends StatefulWidget {
  const LoadingProductCard({
    super.key,
    required this.index,
  });
  final int index;
  @override
  State<LoadingProductCard> createState() => _LoadingProductCardState();
}

class _LoadingProductCardState extends State<LoadingProductCard> {
  @override
  Widget build(BuildContext context) {
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
                Shimmer.fromColors(
                  baseColor: CustomColor.gray_medium,
                  highlightColor: CustomColor.white,
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: CustomColor.gray_medium,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: CustomColor.gray_medium,
                      highlightColor: CustomColor.white,
                      child: Container(
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                          color: CustomColor.gray_medium,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Shimmer.fromColors(
                      baseColor: CustomColor.gray_medium,
                      highlightColor: CustomColor.white,
                      child: Container(
                        height: 30,
                        width: 120,
                        decoration: BoxDecoration(
                          color: CustomColor.gray_medium,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Shimmer.fromColors(
                      baseColor: CustomColor.gray_medium,
                      highlightColor: CustomColor.white,
                      child: Container(
                        height: 30,
                        width: 120,
                        decoration: BoxDecoration(
                          color: CustomColor.gray_medium,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  width: 50,
                  height: 40,
                  decoration: BoxDecoration(
                      color: CustomColor.white,
                      border:
                          Border.all(width: 1, color: CustomColor.gray_medium),
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
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 2,
            color: CustomColor.gray_medium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Shimmer.fromColors(
                baseColor: CustomColor.gray_medium,
                highlightColor: CustomColor.white,
                child: Container(
                  height: 30,
                  width: 40,
                  decoration: BoxDecoration(
                    color: CustomColor.gray_medium,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Container(
                width: 1,
                height: 40,
                color: CustomColor.gray_medium,
              ),
              Shimmer.fromColors(
                baseColor: CustomColor.gray_medium,
                highlightColor: CustomColor.white,
                child: Container(
                  height: 30,
                  width: 40,
                  decoration: BoxDecoration(
                    color: CustomColor.gray_medium,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
